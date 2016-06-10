#!/usr/bin/env python
# ModelSay.py program to read all vms associated with the Say Ins. project.

"""
Python program for modeling the SAY system
"""
from __future__ import print_function

import pyVmomi
from pyVmomi import vim, vmodl
from pyVim.connect import SmartConnect, Disconnect
import requests
import ssl
import atexit
import json
import yaml
from py2neo import Graph, Node, authenticate, Relationship
import urllib2
from collections import namedtuple

def GetSystem(name):
   #print('ModelSay.py - Parsing VM Name')
   
   dc = 'dc'
   say = 'say'
   say_um = 'sayum'
   say_doc = 'saydoc'
   billing = 'bill'



   # new style VM naming conventions
   if name[:2]=='pa' and 'passthru' not in name and name[:3]!='pay':
      system = 'PAS'
      environ = GetEnvironment(name[2])
   elif name[:2]=='bl':
      system = 'Billing'
      environ = GetEnvironment(name[2])
   elif name[:2]=='dm':
      system = 'DocMgmnt'
      environ = GetEnvironment(name[2])
   elif name[:2]=='um':
      system = 'UserMgmnt'
      environ = GetEnvironment(name[2])
   elif name[:2]=='cl' and ('app' in name or 'sql' in name):
      system = 'Client'
      environ = GetEnvironment(name[2])
   elif name[:3]=='rbc':
      system = 'Ratabase'
      #print(name[3:7])
      if name[3:7] == 'demo':
          environ = 'DEMO'
      else:
          environ = GetEnvironment(name[3])
   # end new style
   elif name[:3]=='cwx':
      system = 'Claims'
      environ = GetEnvironment(name[3])
   elif name[:3]=='cws':
      system = 'Claims'
      environ = GetEnvironment(name[3])
   elif name == 'dcdevdocreposrv1':
      #print('found dcdevdocreposrv1')
      system = 'DocMgmnt'
      environ = 'DEVL'
   elif name[:2]==dc:
      system = 'PAS'
      environ = name[2:6].upper()
   elif name[:5]==say_um:
      system = 'UserMgmnt'
      environ = name[5:9].upper()
   elif name[:6]==say_doc:
      system = 'DocMgmnt'
      environ = name[6:9].upper()
   elif name[:3]== 'ado':
      #print('ado: %s' % name)
      system = 'DocMgmnt'
      environ = GetEnvironment(name[3])
      #print('ado environment: %s' % environ)
   elif name[:3]==say:
      system = 'UserMgmnt'
      environ = name[3:7].upper()
   elif name[:4]==billing:
      system = 'Billing'
      environ = name[4:8].upper()
   elif name[:4]== 'maje':
      system = 'Billing'
      environ = GetEnvironment(name[4:5])
   elif name[:3]== 'pay':
      system = 'Billing'
      environ = GetEnvironment(name[3:4])
   elif name == 'dirchanlsrv1':
      system = 'PAS'
      environ = 'PROD'
   else:
      system = 'UNKNOWN'
      environ = 'UNKNOWN'
      
   #print('GetSystem: environ = %s' % environ)
   
   if environ[:3] == 'DEV':
      environ = 'DEVL'

   if environ not in ['DEVL', 'INTEGRATION', 'PROD', 'DEMO', 'TEST', 'LOAD']:
      environ = 'UNKNOWN'
      
   
   return system, environ

def GetEnvironment(env_letter):
   #print('env letter: %s' % env_letter)
   if env_letter == 't':
      environment = 'TEST'
   elif env_letter == 'd':
      environment = 'DEVL'
   elif env_letter == 's':
      environment = 'DEVL'
   elif env_letter == 'm':
      environment = 'DEMO'
   elif env_letter == 'p':
      environment = 'PROD'
   elif env_letter == 'l':
      environment = 'LOAD'
   elif env_letter == 'i':
      environment = 'INTEGRATION'
   else:
      environment = 'UNKNOWN'

   return environment

def SetupVMware():
   #print('ModelSay.py - Setup VMware')
   #  Actually sets up Direct Channel
    vm_cluster_node = graph.merge_one("VMCluster", "name", "DirectChannel")
    vm_hw_1_node = graph.merge_one("Hardware", "name", "esxpsrv1")
    vm_hw_2_node = graph.merge_one("Hardware", "name", "esxpsrv2")
    vm_hw_3_node = graph.merge_one("Hardware", "name", "esxpsrv3")
    vm_hw_4_node = graph.merge_one("Hardware", "name", "esxpsrv4")
    results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_1_node))
    results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_2_node))
    results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_3_node))
    results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_4_node))
    
def WriteVmInfo(vm, depth=1):
   #print('ModelSay.py - Writing VMs to Graph')
   """
   Print information for a particular virtual machine or recurse into a folder
    with depth protection
   """
   maxdepth = 10
   global folder
   # if this is a group it will have children. if it does, recurse into them
   # and then return
   if hasattr(vm, 'childEntity'):
      if depth > maxdepth:
         return
      #print('VM Folder: %s' % vm.name)

      #global folder 
      folder = vm.name
      vmList = vm.childEntity
      for c in vmList:
         WriteVmInfo(c, depth+1)
      return

   vm_node = BuildNode(vm)
'''
   summary = vm.summary

   if hasattr(vm,summary.config.name):
      name = summary.config.name
   elif hasattr(vm, vm.name):
      name = vm.name

   print('vm.name = %s | %s' % (vm.name, name))
'''


   #if vm.name[:3]=='cws':
      #print('vm.name = %s' % vm.name)
'''
   if folder == 'DirectChannel':
      DirectChannelFolder(vm)
   elif folder == 'Templates':
      if vm.name[:4] == 'maje':
         TemplateFolder(vm)
      elif vm.name[:3] == 'rbc':
         TemplateFolder(vm)
      elif vm.name[:3] == 'cws':
         TemplateFolder(vm)
   elif folder == 'Discovered virtual machine':
      if vm.name[:3] == 'cws':
         # temporary
         TemplateFolder(vm)
'''
'''
def TemplateFolder(vm):
   #print('In TemplateFolder')
   vm_cluster_node = graph.merge_one("VMCluster", "name", "UCS-TestDev")
   vm_hw_1_node = graph.merge_one("Hardware", "name", "esxpsrv10")
   vm_hw_2_node = graph.merge_one("Hardware", "name", "esxpsrv11")
   vm_hw_3_node = graph.merge_one("Hardware", "name", "esxpsrv12")
   vm_hw_4_node = graph.merge_one("Hardware", "name", "esxpsrv13")
   results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_1_node))
   results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_2_node))
   results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_3_node))
   results = graph.create_unique(Relationship(vm_cluster_node, "RUNS_ON", vm_hw_4_node))
   
   vm_node = BuildNode(vm)
            
   # Attach VM to VM Cluster
   results = graph.create_unique(Relationship(vm_node, "RUNS_ON", vm_cluster_node))
'''
def BuildNode(vm):
   environ = ""
   summary = vm.summary
   #system, environ = GetSystem(summary.config.name)
   system, environ = GetSystem(vm.name)

   #if name[0] == 'c':
       #print(name)
   if system == 'UNKNOWN':
      return

   name = summary.config.name
   #print( name)
   os = summary.config.guestFullName
   state = summary.runtime.powerState
   #print('   state = %s' % state)
   if state == 'poweredOn':
      status = 'UP'
   elif state == 'poweredOff':
      status = 'DOWN'
   else:
      status = 'UNKNOWN: %s' % state
   numCPU = summary.config.numCpu
   memSize = summary.config.memorySizeMB
   if summary.guest != None:
      ip = summary.guest.ipAddress
               
   #print('name = %s' % summary.config.name)

   # added to support doc mgment server where
   #   vm name = 'saydocdevappsrv1' but dns is 'dmdapp1'
   if name == 'saydocdevappsrv1':
      name = 'dmdapp1'
   vm_node = graph.merge_one("VM", "name", name)
   vm_node['ip'] = ip
   vm_node['system'] = system
   vm_node['status'] = status
   vm_node['os'] = os
   vm_node['CPUs'] = numCPU
   vm_node['memory'] = memSize
   vm_node.push()
   #print(environ)
   #print(system)
   if environ != "UNKNOWN":
      env_node = graph.merge_one("Environment", "name", environ.upper())
      results = graph.create_unique(Relationship(vm_node, "IS_IN", env_node))
   if 'queue' in name:
      vm_node.labels.add("%sQServer" % vm_node['system'])
      #SetupQueues(vm_node)
   if 'mongo' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("%sMongoDB" % vm_node['system'])
   if 'elast' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("%sElasticDB" % vm_node['system'])
   if 'time' in name:
      vm_node.labels.add("TimeServer")
   if 'gw' in name:
      vm_node.labels.add("GatewayServer")
   if 'dbsrv' in name:
      vm_node.labels.add("DBServer")
   if 'monitor' in name:
      vm_node.labels.add("DBMonitor")
   if 'chef' in name:
      vm_node.labels.add("ChefServer")
      #vm_node.labels.add("DevOpsServer")
   if 'build' in name:
      vm_node.labels.add("BuildServer")
      #vm_node.labels.add("DevOpsServer")
   if 'repo' in name:
      if name != 'dcdevdocreposrv1':
         vm_node.labels.add("RepoServer")
         #vm_node.labels.add("DevOpsServer")
   if 'knife' in name:
      vm_node.labels.add("KnifeServer")
      #vm_node.labels.add("DevOpsServer")
   if 'vagrant' in name:
      vm_node.labels.add("VagrantServer")
      #vm_node.labels.add("DevOpsServer")
   if 'sayum' in name and 'db' in name:
      vm_node.labels.add("AuthDBServer")
         
   # new style naming

   if 'app' in name:
      #print('name: %s' % name)
      #vm_node.labels.add("AppServer")
      vm_node.labels.add("%sServer" % vm_node['system'])

   if 'aut' in name:
      vm_node.labels.add("AuthServer")
   if 'bat' in name:
      vm_node.labels.add("%sBatchServer" % vm_node['system'])
   '''
   if 'bld' in name:
      vm_node.labels.add("BuildServer")
      vm_node.labels.add("DevOpsServer")
   '''
   if 'cas' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("%sCassandraDB" % vm_node['system'])
   if 'chf' in name:
      vm_node.labels.add("ChefServer")
      #vm_node.labels.add("DevOpsServer")
   if 'dis' in name:
      vm_node.labels.add("DiscServer")
   if 'doc' in name:
      vm_node.labels.add("DocMgmntServer")
      #vm_node.labels.add("DocRepoServer")
   if 'els' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("ElasticDB")
   if 'gtw' in name:
      vm_node.labels.add("GatewayServer")

   if 'knf' in name:
      vm_node.labels.add("KnifeServer")
      #vm_node.labels.add("DevOpsServer")
   if 'lic' in name:
      vm_node.labels.add("LicenseServer")
   if 'maje' in name:
      if 'bat' in name:
         vm_node.labels.add("MajescoBatServer")
      if 'sql' in name:
         vm_node.labels.add("MajescoSQLServer")
      if 'app' in name:
         vm_node.labels.add("MajescoAppServer")
   if 'mng' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("MongoDB")
   if 'mon' in name and not 'mongo' in name:
      vm_node.labels.add("DBMonitor")
   if 'rep' in name:
      if name != 'dcdevdocreposrv1':
        vm_node.labels.add("RepoServer")
        #vm_node.labels.add("DevOpsServer")

   if 'sql' in name:
      #vm_node.labels.add("DBServer")
      vm_node.labels.add("%sSQLServer"% vm_node['system'])
   if 'rmq' in name:
      vm_node.labels.add("%sQServer" % vm_node['system'])
      '''
      if name.endswith('1'):
         SetupQueues(vm_node)
      '''
   if 'tim' in name:
      vm_node.labels.add("%sTimeServer" % vm_node['system'])
   if 'utl' in name:
      vm_node.labels.add("UtilityServer")
   if 'efe' in name:
      vm_node.labels.add("HOFEServer")
   if 'crm' in name:
      vm_node.labels.add("CRMListenerServer")
   if 'wlt' in name:
      vm_node.labels.add("WalletServer")
   if 'msc' in name:
      vm_node.labels.add("%sMiscServer" % vm_node['system'])
   if 'utl' in name:
      vm_node.labels.add("UtilityServer")
   if 'web' in name:
      vm_node.labels.add("%sWebServer" % vm_node['system'])
      #vm_node.labels.add("BillingServer")
   if 'vgt' in name:
      vm_node.labels.add("VagrantServer")
      #vm_node.labels.add("DevOpsServer")
   # setup Adobe servers
   if 'ado' == name[:3]:
      vm_node.labels.add("AdobeServer")
      #vm_node.labels.add("DocMgmntServer")
      if name[4:7] == 'sql':
          vm_node.labels.add("AdobeDBServer")
   # setup Claims servers
   if 'cws' == name[:3]:
      if name[4:7] == 'was':
         vm_node.labels.add("CWSWASServer")
      if name[4:7] == 'iis':
        vm_node.labels.add("CWSIISServer")
   if 'cwx' == name[:3]:
      if name[4:7] == 'was':
         vm_node.labels.add("ClaimsInterfaceWASServer")
      if name[4:7] == 'iis':
         vm_node.labels.add("ClaimsInterfaceIISServer")
   #if 'cl' == name[:2]:
      #if name[3:6] == 'app':
         #vm_node.labels.add("ClientAppServer")
      #if name[3:6] == 'sql':
         #vm_node.labels.add("ClientDBServer")
   if name == 'dcdevdocreposrv1':
      vm_node.labels.add("DocRepoServer")
   if 'pay' == name[:3]:
      if name[4:7] == 'was':
         vm_node.labels.add("CardWASServer")
      if name[4:7] == 'iis':
         vm_node.labels.add("CardIISServer")

   vm_node.push()
   
   return vm_node



def ReadVMs():
   print('ModelSay.py - Reading VMs from VMware')
   url='VCPRODSRV1'
   username='tsojmw'
   password='hyenas38'
   port = 443
   # Disabling urllib3 ssl warnings
   requests.packages.urllib3.disable_warnings()

   # Disabling SSL certificate verification
   context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
   context.verify_mode = ssl.CERT_NONE

   try:
      si = SmartConnect(
            host=url,
            user=username,
            pwd=password,
            port = port,
            sslContext=context
      )
   except IOError as e:
      print("I/O error({0}): {1}".format(e.errno, e.strerror))
   '''
   except Exception as exc:
      if isinstance(exc, vim.fault.HostConnectFault) and '[SSL: CERTIFICATE_VERIFY_FAILED]' in exc.msg:

         try:
            import ssl
            default_context = ssl._create_default_https_context
            ssl._create_default_https_context = ssl._create_unverified_context
            si = SmartConnect(
                        host=url,
                        user=username,
                        pwd=password,
                  )
            ssl._create_default_https_context = default_context
         except Exception as exc1:
            raise Exception(exc1)
      else:
         raise Exception(exc)

   '''
   if not si:
      print("Could not connect to the specified host using specified "
                   "username and password")
      return -1

   atexit.register(Disconnect, si)
   
   content = si.RetrieveContent()
   for child in content.rootFolder.childEntity:
      #print('child = %s' % child)
      if hasattr(child, 'vmFolder'):
                  datacenter = child
                  vmFolder = datacenter.vmFolder
                  #print('ReadVMS - VM Folder: %s' % vmFolder.name)
                  vmList = vmFolder.childEntity
                  for vm in vmList:
                     WriteVmInfo(vm)
   
   return 0

def WriteQueueInfo(qmgr_node, queue, routing_key):
   #print('ModelSay.py - Writing Queue Info')
   #print('   qmgr_node: %s' % qmgr_node['name'])
   env_rel = graph.match(start_node=qmgr_node, rel_type="IS_IN")
   for rel in env_rel:
      env_node = rel.end_node
   queue = queue+"_"+env_node['name']
   queue_node = graph.merge_one("Queue", "name", queue)
   queue_node['type'] = 'RabbitMQ'
   queue_node['system'] = 'PAS'
   queue_node.push() #vm_no
   #print(routing_key)
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   binding_rel = graph.create_unique(Relationship(qmgr_node, "CONNECTS_TO", queue_node, routing_key=routing_key))


def SetupQueues(qmgr_node):
   #q_name = qmgr_node['name']
   print('ModelSay.py - Reading Queue Manager %s' % qmgr_node['name'])
   url = 'https://%s:15671/api/exchanges/%%2f/direct_channel/bindings/source' % qmgr_node['name']
   #print(url)
   username = 'RabbitMQAdmin'
   password = 'T3NpCYI7lW6x2O84I120dS'
   passman = urllib2.HTTPPasswordMgrWithDefaultRealm()
   passman.add_password(None, url, username, password)
   urllib2.install_opener(urllib2.build_opener(urllib2.HTTPBasicAuthHandler(passman)))

   req = urllib2.Request(url)
   ctx = ssl.create_default_context()
   ctx.check_hostname = False
   ctx.verify_mode = ssl.CERT_NONE

   try:
      f = urllib2.urlopen(req, context=ctx)
      json_str = f.read()
      data = json.loads(json_str)
      #print('Setup queues - data: %s' % data)

      done = False
      i = 0
      while True:
         queue = data[i]['destination']
         routing_key = data[i]['routing_key']
         WriteQueueInfo(qmgr_node, queue, routing_key)
         i = i+1
         try:
            data[i]
         except:
            break
   except urllib2.URLError as e:
      print(e.args)
      print("Couldn't connect to "+qmgr_node['name']+" "+qmgr_node['status'] + " Error:" + e.reason)


def SetupMFQueue(env_node):
   #print('ModelSay.py - Setting up MF Queues in %s' % env_node["name"])

   # this is a temporary section until we can read the bridge program's settings
   #   Setup mainframe nodes and relationships
   #  (bridge program)-[runs on]-(rabbit queue mgr)
   #  (bridge program)-[connects]-(WS queue mgr)
   #  (WS queue mgr)-[connects]-(WS queue)
   #  (bridge program)-[reads]-(rabbit queue)

   # setup Mainframe node
   mf_node = graph.merge_one("Mainframe", "name", "Mainframe")
   mf_node.labels.add("Hardware")
   mf_node.push()

   if env_node["name"] == "DEVL":
      q_srv_name = "MQD1"
      lpar_name = "DEVL"
   elif env_node["name"] == "TEST":
      q_srv_name = "MQT1"
      lpar_name = "DEVL"
   elif env_node["name"] == "DEMO":
      q_srv_name = "MQM1"
      lpar_name = "DEVL"
   elif env_node["name"] == "LOAD":
      q_srv_name = "MQF1"
      lpar_name = "DEVL"
   elif env_node["name"] == "PROD":
      q_srv_name = "MQP1"
      lpar_name = "PROD"
   else:
      return

   lpar_node = graph.merge_one("LPAR", "name", "%s" % lpar_name)
   # note one per bridged WS Queue
   # Backoffice
   #   Backoffice WSMQ queue creation
   bo_queue_node = graph.merge_one("Queue", "name", "%s_DIRECT.BACKOFFICE.PREMIUM" % env_node["name"])
   bo_queue_node['type']= 'WSMQ'
   bo_queue_node['system']= 'BackOffice'
   bo_queue_node.push()
   results = graph.create_unique(Relationship(bo_queue_node, "IS_IN", env_node))


   #    Reporting WSMQ queue creation
   rpt_queue_node = graph.merge_one("Queue", "name", "%s_DIRECT.REPORTING.POLICYMSGS" % env_node["name"])
   rpt_queue_node['type']= 'WSMQ'
   rpt_queue_node['system']= 'Reporting'
   rpt_queue_node.push()
   results = graph.create_unique(Relationship(rpt_queue_node, "IS_IN", env_node))

   #  get WSMQ Q manager for this environment
   mq_queue_srv_node = graph.merge_one("QServer", "name", q_srv_name)
   mq_queue_srv_node['type']= 'WSMQ'
   mq_queue_srv_node.push()
   results = graph.create_unique(Relationship(mq_queue_srv_node, "IS_IN", env_node))
   results = graph.create_unique(Relationship(mq_queue_srv_node, "RUNS_ON", lpar_node))

   #  setup bridge program
   #    Backoffice
   bo_bridge_node = graph.merge_one("Program", "name", "%s_Act_Bridge" % env_node["name"])
   bo_bridge_node['system'] = 'PAS'
   bo_bridge_node.push()
   results = graph.create_unique(Relationship(bo_bridge_node, "IS_IN", env_node))
   #    Reporting
   rpt_bridge_node = graph.merge_one("Program", "name", "%s_Rpt_Bridge" % env_node["name"])
   rpt_bridge_node['system'] = 'PAS'
   rpt_bridge_node.push()
   results = graph.create_unique(Relationship(rpt_bridge_node, "IS_IN", env_node))

   #  get RabbitMQ Q manager(s) and connect bridge programs to them
   cypher = "MATCH (vm:QServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'PAS' and e.name = '%s' RETURN vm" % env_node["name"]
   results = graph.cypher.execute(cypher)
   for rec in results:
      #print(rec.vm['name'])
      rabbit_queue_srv_node = rec.vm
      results = graph.create_unique(Relationship(bo_bridge_node, "RUNS_ON", rabbit_queue_srv_node))
      results = graph.create_unique(Relationship(rpt_bridge_node, "RUNS_ON", rabbit_queue_srv_node))



   #  get the Rabbit Queue (should have been defined when reading the RabbitMQ server)
   #    Backoffice
   rabbitq_node = graph.merge_one("Queue", "name", "actuarial_%s" % env_node["name"])
   results = graph.create_unique(Relationship(bo_bridge_node, "CONNECTS_TO", rabbitq_node))
   print(results)

   results = graph.create_unique(Relationship(bo_bridge_node, "CONNECTS_TO", bo_queue_node))
   results = graph.create_unique(Relationship(bo_queue_node, "RUNS_ON", mq_queue_srv_node))

   #    Reporting
   rpt_rabbitq_node = graph.merge_one("Queue", "name", "reporting_%s" % env_node["name"])
   results = graph.create_unique(Relationship(rpt_bridge_node, "CONNECTS_TO", rpt_rabbitq_node))
   results = graph.create_unique(Relationship(rpt_bridge_node, "CONNECTS_TO", rpt_queue_node))
   results = graph.create_unique(Relationship(rpt_queue_node, "RUNS_ON", mq_queue_srv_node))


   #################################################################################

def SetupSystems():
   print('ModelSay.py - Setup Systems')
   # Loop thru all environments
   for env in graph.find("Environment"):
      SetupRatabase(env)
      SetupPAS(env)
      SetupBilling(env)
      SetupWallet(env)
      SetupDocMgmnt(env)
      SetupClaims(env)
      SetupClient(env)
      SetupUM(env)
      #SetupCRM(env)
      SetupMFQueue(env)
      SetupBackOffice(env)
      #SetupFrontEnd(env)
      SetupFeatures(env)
   SetupIntegration()

def SetupIntegration():
    integration = {'environments': [
            {'system':'PAS',
            'environ': 'TEST'},
            {'system': 'DocMgmnt',
            'environ': 'DEVL'},
            {'system': 'Claims',
            'environ': 'TEST'},
            {'system': 'Billing',
            'environ': 'TEST'},
            {'system': 'Ratabase',
            'environ': 'INTEGRATION'},
            {'system': 'CRM',
            'environ': 'TEST'},
            {'system': 'Client',
            'environ': 'TEST'},
            {'system': 'UserMgmnt',
            'environ': 'TEST'}
        ]
    }
    int_env_node = graph.merge_one("SayEnvironment", "name", "INTEGRATION")
    for env in integration['environments']:
        #print('system: %s environment:%s' % (env['system'], env['environ']))
        cypher = "MATCH (vm)-[:IS_IN]->(e:Environment) WHERE vm.system = '%s' and e.name = '%s' RETURN vm" % (env['system'], env['environ'])
        results = graph.cypher.execute(cypher)
        for rec in results:
           srv_node = rec.vm
           results = graph.create_unique(Relationship(srv_node, "IS_PART_OF", int_env_node))

    ConnectSayEnvironment(int_env_node)

def ConnectSayEnvironment(say_env_node):
   print('ModelSay.py - ConnectSayEnvironment')
   env_name = say_env_node["name"]
   #######################################################
   #  Read thru all PAS AppServers
   cypher = "MATCH (vm:PASServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      pas_srv_node = rec.vm
      # connect AppServer to Ratabase
      ratabase_cypher = "MATCH (vm:RatabaseServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
      ratabase_results = graph.cypher.execute(ratabase_cypher)
      for ratabase_vm in ratabase_results:
         ratabase_node = ratabase_vm.vm
         results = graph.create_unique(Relationship(pas_srv_node, "CONNECTS_TO", ratabase_node))

      # connect AppServer to Client
      client_cypher = "MATCH (vm:ClientServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
      client_results = graph.cypher.execute(client_cypher)
      for client_vm in client_results:
         client_node = client_vm.vm
         results = graph.create_unique(Relationship(pas_srv_node, "CONNECTS_TO", client_node))

      # connect AppServer to Billing
      billing_cypher = "MATCH (vm:BillingServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
      billing_results = graph.cypher.execute(billing_cypher)
      for billing_vm in billing_results:
         billing_node = billing_vm.vm
         # don't connect to Majesco server
         if 'MajescoServer' not in billing_node.labels:

            results = graph.create_unique(Relationship(pas_srv_node, "CONNECTS_TO", billing_node))

      # connect AppServer to User Management
      um_cypher = "MATCH (vm:GatewayServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
      um_results = graph.cypher.execute(um_cypher)
      for um_vm in um_results:
         um_node = um_vm.vm
         results = graph.create_unique(Relationship(pas_srv_node, "CONNECTS_TO", um_node))
      # connect AppServer to DocMgment
      doc_cypher = "MATCH (vm:AppServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  vm.system = 'DocMgmnt' and e.name = '%s' RETURN vm" % env_name
      doc_results = graph.cypher.execute(doc_cypher)
      for doc_vm in doc_results:
         doc_node = doc_vm.vm
         results = graph.create_unique(Relationship(pas_srv_node, "CONNECTS_TO", doc_node))

   #######################################################
   #  Read thru all Billing Servers
   billing_cypher = "MATCH (vm:BillingServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
   billing_results = graph.cypher.execute(billing_cypher)
   for billing_vm in billing_results:
      billing_node = billing_vm.vm
      # don't connect to Majesco server
      if 'MajescoServer' not in billing_node.labels:
         '''
         # connect billing Server to PAS
         pas_cypher = "MATCH (vm:PASServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
         past_results = graph.cypher.execute(pas_cypher)
         for pas_vm in pas_results:
            pas_node = pas_vm.vm
            results = graph.create_unique(Relationship(billing_node, "CONNECTS_TO", pas_node))
         '''
         # connect billing Server to Client
         client_cypher = "MATCH (vm:ClientServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  e.name = '%s' RETURN vm" % env_name
         client_results = graph.cypher.execute(client_cypher)
         for client_vm in client_results:
            client_node = client_vm.vm
            results = graph.create_unique(Relationship(billing_node, "CONNECTS_TO", client_node))
         # connect billing Server to DocMgment
         doc_cypher = "MATCH (vm:AppServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE  vm.system = 'DocMgmnt' and e.name = '%s' RETURN vm" % env_name
         doc_results = graph.cypher.execute(doc_cypher)
         for doc_vm in doc_results:
            doc_node = doc_vm.vm
            results = graph.create_unique(Relationship(billing_node, "CONNECTS_TO", doc_node))

   #######################################################
   #  Setup Claims
   connections = ('PASServer', 'DocMgmntServer',
                   'GatewayServer', 'ClientServer')
   #  Read thru all Claims Interface IIS Servers
   cypher = "MATCH (vm:ClaimsInterfaceIISServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for clm in results:
      clm_node = clm.vm
      # connect to feature to  servers
      for connection in connections:
         cypher = "MATCH (vm:%s)-[:IS_PART_OF]->(e:SayEnvironment) WHERE e.name = '%s' RETURN vm" % (connection, env_name)
         results = graph.cypher.execute(cypher)
         for rec in results:
            app_srv_node = rec.vm
            results = graph.create_unique(Relationship(clm_node, "CONNECTS_TO", app_srv_node))

   '''
   #  Setup Customer Frontend
   connections = ('PASServer', 'DocMgmntServer', 'ClaimsInterfaceIISServer',
                   'GatewayServer', 'BillingServer', 'ClientServer')
   #  Read thru all FrontEnd Servers
   cypher = "MATCH (vm:FrontEndServer)-[:IS_PART_OF]->(e:SayEnvironment) WHERE e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for fe in results:
      front_end_node = fe.vm
      # connect to feature to  servers
      for connection in connections:
         cypher = "MATCH (vm:%s)-[:IS_PART_OF]->(e:SayEnvironment) WHERE e.name = '%s' RETURN vm" % (connection, env_name)
         results = graph.cypher.execute(cypher)
         for rec in results:
            app_srv_node = rec.vm
            results = graph.create_unique(Relationship(front_end_node, "CONNECTS_TO", app_srv_node))
   '''
def SetupPAS(env_node):
   #print('ModelSay.py - Setting up PAS in %s' % env_node["name"])
   env_name = env_node["name"]
   # Setup external services
   #   Lexis/Nexis
   #   Smarty Streets
   test_lexis_node = graph.merge_one("ExternalService", "name", "Test_LexisNexis")
   test_lexis_node['system']="PAS"
   test_lexis_node.labels.add('LexisNexisService')
   test_lexis_node.push()
   prod_lexis_node = graph.merge_one("ExternalService", "name", "Prod_LexisNexis")
   prod_lexis_node['system']="PAS"
   test_lexis_node.labels.add('LexisNexisService')
   prod_lexis_node.push()
   smarty_streets_node = graph.merge_one("ExternalService", "name", "SmartyStreets")
   smarty_streets_node['system']="PAS"
   smarty_streets_node.labels.add('SmartyStreetsService')
   smarty_streets_node.push()
   results = graph.create_unique(Relationship(smarty_streets_node, "IS_IN", env_node))
   #  MF ESP scheduling
   devl_esp_node = graph.merge_one("Scheduler", "name", "Test_ESP")
   devl_esp_node['system']="ESP"
   devl_esp_node.push()
   prod_esp_node = graph.merge_one("Scheduler", "name", "Prod_ESP")
   prod_esp_node['system']="ESP"
   prod_esp_node.push()

   if env_node['name'] == 'PROD':
      results = graph.create_unique(Relationship(prod_lexis_node, "IS_IN", env_node))
      results = graph.create_unique(Relationship(prod_esp_node, "IS_IN", env_node))
      lpar_node = graph.merge_one("LPAR", "name", "PROD")
      results = graph.create_unique(Relationship(prod_esp_node, "RUN_ON", lpar_node))
   else:
      results = graph.create_unique(Relationship(test_lexis_node, "IS_IN", env_node))
      results = graph.create_unique(Relationship(devl_esp_node, "IS_IN", env_node))
      lpar_node = graph.merge_one("LPAR", "name", "DEVL")
      results = graph.create_unique(Relationship(devl_esp_node, "RUN_ON", lpar_node))

   #  Read thru all PAS AppServers
   cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'PAS' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      #print(rec.vm['name'])
      app_srv_node = rec.vm
      #  the following section should be added to the setup of Integration Environment
      '''
      # connect AppServer to Ratabase
      ratabase_cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Ratabase' and e.name = '%s' RETURN vm" % env_name
      ratabase_results = graph.cypher.execute(ratabase_cypher)
      for ratabase_vm in ratabase_results:
         ratabase_node = ratabase_vm.vm
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", ratabase_node))
      # connect AppServer to Client
      client_cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Client' and e.name = '%s' RETURN vm" % env_name
      client_results = graph.cypher.execute(client_cypher)
      for client_vm in client_results:
         client_node = client_vm.vm
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", client_node))
      '''
      # connect AppServer to Smarty Streets (all environments go to single service)
      results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", smarty_streets_node))
      # connect AppServer to Lexis/Nexis (PROD environment to PROD all other to test)
      if env_name == 'PROD':
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", prod_lexis_node))
      else:
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", test_lexis_node))

      for vm in graph.match(start_node=env_node, rel_type="IS_IN", bidirectional=True):
         if vm.start_node["system"] == "PAS":
            if 'DBServer' in vm.start_node.labels:
               #print(vm.start_node['name'])
               results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
            if 'QServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
            if 'TimeServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
            if 'BatchServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
                  if env_name == 'PROD':
                     results = graph.create_unique(Relationship(vm.start_node, "CONNECTS_TO", prod_esp_node))
                  else:
                     results = graph.create_unique(Relationship(vm.start_node, "CONNECTS_TO", devl_esp_node))

      #SetupRESTEndPoints(app_srv_node, env_node)

   #  Setup DB Monitors
   #   'DBMonitor is for Cassandra
   cypher = "MATCH (vm:DBMonitor)-[:IS_IN]->(e:Environment) WHERE vm.system = 'PAS' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for mon in results:
         #print(rec.vm['name'])
      db_mon_node = mon.vm
      cypher = "MATCH (cass:CassandraDB)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN cass" % env_name
      results = graph.cypher.execute(cypher)
      for rec in results:
         results = graph.create_unique(Relationship(rec.cass, "CONNECTS_TO", db_mon_node))

   # Mongo monitor (in the cloud!)
   mongo_mon_node = graph.merge_one("DBMonitor", "name", "MongoMonitor")
   mongo_mon_node.labels.add("CloudServer")
   mongo_mon_node['system']="PAS"
   mongo_mon_node.push()
   results = graph.create_unique(Relationship(mongo_mon_node, "IS_IN", env_node))

   cypher = "MATCH (mongo:MongoDB)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN mongo" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      results = graph.create_unique(Relationship(rec.mongo, "CONNECTS_TO", mongo_mon_node))

def SetupDocMgmnt(env_node):
   print('ModelSay.py - Setting up Document Mgment in %s' % env_node["name"])
   env_name = env_node["name"]
   cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'DocMgmnt' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      docmgmnt_node = rec.vm
      results = graph.create_unique(Relationship(docmgmnt_node, "IS_IN", env_node))

      connections = ('AdobeServer', 'DocRepoServer')
      #  Read thru all DocMgmnt Servers

      # connect to feature to  servers
      for connection in connections:
          cypher = "MATCH (vm:%s)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % (connection, env_name)
          results = graph.cypher.execute(cypher)
          for rec in results:
              doc_srv_node = rec.vm
              # Connect to all but the Adobe DB Server
              if 'SQLServer' not in doc_srv_node.labels:
                  results = graph.create_unique(Relationship(docmgmnt_node, "CONNECTS_TO", doc_srv_node))
                  if 'AdobeServer' in doc_srv_node.labels:
                      cypher = "MATCH (vm:AdobeDBServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
                      results = graph.cypher.execute(cypher)
                      for rec in results:
                         ado_db_node = rec.vm
                         results = graph.create_unique(Relationship(doc_srv_node, "CONNECTS_TO", ado_db_node))

def SetupRatabase(env_node):
   print('ModelSay.py - Setting up Ratabase in %s' % env_node["name"])
   '''
   env_name = env_node["name"]
   cypher = "MATCH (vm:RatabaseServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Ratabase' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      ratabase_node = rec.vm
      results = graph.create_unique(Relationship(ratabase_node, "IS_IN", env_node))
   '''
   ######
   # How to tell which Ratabase is being used by PAS app servers
   #   so this will build the nodes for each environment
   ######

def SetupBilling(env_node):
   print('ModelSay.py - Setting up Billing in %s' % env_node["name"])
   env_name = env_node["name"]
    #  Read thru all Billing Majesco AppServers
   cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Billing' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      #print(rec.vm['name'])
      app_srv_node = rec.vm
      if 'MajescoServer' in app_srv_node.labels:
         for vm in graph.match(start_node=env_node, rel_type="IS_IN", bidirectional=True):
            if vm.start_node["system"] == "Billing":
               if 'DBServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
               # Find the Billing Middle-layer app server
               if 'AppServer' in vm.start_node.labels:
                  if 'MajescoServer' not in vm.start_node.labels:
                     print(vm.start_node)
                     results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
                     #connect to wallet server
                     cypher2 = "MATCH (vm:CardWASServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
                     results2 = graph.cypher.execute(cypher2)
                     print(results2)
                     for rec in results2:
                        results = graph.create_unique(Relationship(vm.start_node, "CONNECTS_TO", rec.vm))
               if 'BatchServer' in vm.start_node.labels:
                     #print(vm.start_node['name'])
                     results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", vm.start_node))
                     '''
                     if env_name == 'PROD':
                        results = graph.create_unique(Relationship(vm.start_node, "CONNECTS_TO", prod_esp_node))
                     else:
                        results = graph.create_unique(Relationship(vm.start_node, "CONNECTS_TO", devl_esp_node))
                     '''
      '''
      if 'MajescoServer' not in app_srv_node.labels:
         SetupRESTEndPoints(app_srv_node, env_node)
      '''
def SetupWallet(env_node):
   print('ModelSay.py - Setting up Wallet in %s' % env_node["name"])
   env_name = env_node["name"]
    #  Read thru all Billing Majesco AppServers
   cypher = "MATCH (vm:WalletServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Billing' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   #print(results)
   for rec in results:
      #print(rec.vm['name'])
      app_srv_node = rec.vm
      # connect to PAS Server
      cypher4 = "MATCH (vm:PASServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
      results4 = graph.cypher.execute(cypher4)
      #print(results4)
      for rec in results4:
         results = graph.create_unique(Relationship(rec.vm, "CONNECTS_TO", app_srv_node))

      # connect to Billing Server
      cypher3 = "MATCH (vm:BillingServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
      results3 = graph.cypher.execute(cypher3)
      #print(results3)
      for rec in results3:
         if 'MajescoServer' not in rec.vm.labels:
            results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", rec.vm))

      # connect to Card Server
      cypher2 = "MATCH (vm:CardWASServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
      results2 = graph.cypher.execute(cypher2)
      #print(results2)
      for rec in results2:
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", rec.vm))
         blue_pay_node = graph.merge_one("ExternalService", "name", "BluePay")
         blue_pay_node['system']="Billing"
         blue_pay_node.labels.add('BluePayService')
         blue_pay_node.push()
         results = graph.create_unique(Relationship(blue_pay_node, "IS_IN", env_node))
         results = graph.create_unique(Relationship(rec.vm, "CONNECTS_TO", blue_pay_node))
         if env_name == "PROD":
            db_name = "DPAYP001"
         elif env_name == 'TEST':
            db_name = "DPAYT001"
         elif env_name == 'DEVL':
            db_name = "DPAYD001"
         elif env_name == 'DEMO':
            db_name = "DPAYM001"

         db2_node = graph.merge_one("DBServer", "name", "%s" % db_name)
         db2_node['type'] = 'DB/2'
         db2_node['system'] = 'Billing'
         db2_node.push()
         results = graph.create_unique(Relationship(rec.vm, "CONNECTS_TO", db2_node))

         mf_node = graph.merge_one("Mainframe", "name", "Mainframe")

         results = graph.create_unique(Relationship(db2_node, "RUNS_ON", mf_node))


def SetupClient(env_node):
   print('ModelSay.py - Setting up Client in %s' % env_node["name"])
   env_name = env_node["name"]

   cypher = "MATCH (vm:ClientAppServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      app_srv_node = rec.vm
      cypher = "MATCH (vm:ClientDBServer)-[:IS_IN]->(e:Environment) WHERE  e.name = '%s' RETURN vm" % env_name
      results = graph.cypher.execute(cypher)
      for rec in results:
         db_srv_node = rec.vm
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", db_srv_node))
      #SetupRESTEndPoints(app_srv_node, env_node)

def SetupClaims(env_node):
   print('ModelSay.py - Setting up Claims in %s' % env_node["name"])
   env_name = env_node["name"]
    #  Read thru all Claims Interface Servers
   #  Claims Interface IIS -> Claims Interface WAS -> CWS IIS -> CWS WAS
   #connections = ('ClaimsInterfaceIISServer', 'CWSWASServer')
   cypher = "MATCH (vm:ClaimsInterfaceWASServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'Claims' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for rec in results:
      #print(rec.vm['name'])
      app_srv_node = rec.vm

      # connect to Claims Interface IIS server
      cypher = "MATCH (vm:ClaimsInterfaceIISServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
      results = graph.cypher.execute(cypher)
      for rec in results:
          iis_node = rec.vm
          results = graph.create_unique(Relationship(iis_node, "CONNECTS_TO", app_srv_node))

      # connect to Claims WAS server
      cypher = "MATCH (vm:CWSIISServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
      results = graph.cypher.execute(cypher)
      for rec in results:
          iis_node = rec.vm
          results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", iis_node))
          cypher = "MATCH (vm:CWSWASServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
          results = graph.cypher.execute(cypher)
          for rec in results:
              was_node = rec.vm
              results = graph.create_unique(Relationship(iis_node, "CONNECTS_TO", was_node))


   '''
   mf_node = graph.merge_one("Mainframe", "name", "Mainframe")
   
   if env_node["name"] == "DEVL":
      q_srv_name = "MQD1"
   elif env_node["name"] == "TEST":
      q_srv_name = "MQT1"
   elif env_node["name"] == "DEMO":
      q_srv_name = "MQM1"
   elif env_node["name"] == "LOAD":
      q_srv_name = "MQF1"
   elif env_node["name"] == "PROD":
      q_srv_name = "MQP1"
      
   mq_queue_srv_node = graph.merge_one("QServer", "name", q_srv_name)
   
   # Backoffice
   #   Backoffice Claims WSMQ queue creation
   bo_queue_node = graph.merge_one("Queue", "name", "%s_Direct.BackOffice.ClaimTopics" % env_node["name"]) 
   bo_queue_node['type']= 'WSMQ'
   bo_queue_node['system']= 'Claims'
   bo_queue_node.push()
   results = graph.create_unique(Relationship(bo_queue_node, "IS_IN", env_node))
   results = graph.create_unique(Relationship(bo_queue_node, "RUNS_ON", mq_queue_srv_node))
'''

def SetupBackOffice(env_node):
   print('ModelSay.py - Setting up BackOffice in %s' % env_node["name"])
   
   mf_node = graph.merge_one("Mainframe", "name", "Mainframe")
   
   if env_node["name"] == "DEVL":
      q_srv_name = "MQD1"
      cics_env_name = "CICSDD"
      lpar_name = "DEVL"
      db2_name = "DBOMD001"
      db2_env_name = "DSNT"
   elif env_node["name"] == "TEST":
      q_srv_name = "MQT1"
      cics_env_name = "CICSDT"
      lpar_name = "DEVL"
      db2_name = "DBOMT001"
      db2_env_name = "DSNT"
   elif env_node["name"] == "DEMO":
      q_srv_name = "MQM1"
      cics_env_name = "CICSDM"
      lpar_name = "DEVL"
      db2_name = "DBOMM001"
      db2_env_name = "DSNT"
   elif env_node["name"] == "LOAD":
      q_srv_name = "MQF1"
      cics_env_name = "CICSDF"
      lpar_name = "DEVL"
      db2_name = "DBOMM001"
      db2_env_name = "DSNT"
   elif env_node["name"] == "PROD":
      q_srv_name = "MQP1"
      cics_env_name = "CICSDP"
      lpar_name = "PROD"
      db2_name = "DBOMP001"
      db2_env_name = "DSN"
   else:
      return

  
   mq_queue_srv_node = graph.merge_one("QServer", "name", q_srv_name)
   
   # Backoffice
   #   Backoffice Error WSMQ queue creation
   bo_queue_node = graph.merge_one("Queue", "name", "%s_Direct.BackOffice.Error" % env_node["name"]) 
   bo_queue_node['type']= 'WSMQ'
   bo_queue_node['system']= 'BackOffice'
   bo_queue_node.push()
   
   results = graph.create_unique(Relationship(bo_queue_node, "IS_IN", env_node))
   results = graph.create_unique(Relationship(bo_queue_node, "RUNS_ON", mq_queue_srv_node))
   
   cics_node = graph.merge_one("Program", "name", "%s_DPAS" % env_node["name"])
   cics_node['system'] = 'BackOffice'
   cics_node['type'] = 'CICS'
   cics_node.push()
   results = graph.create_unique(Relationship(cics_node, "IS_IN", env_node))
   cics_env_node = graph.merge_one("CICSEnv", "name", "%s" % cics_env_name)
   cics_env_node['system'] = 'BackOffice'
   cics_env_node['type'] = 'CICS'
   cics_env_node.push()
   results = graph.create_unique(Relationship(cics_env_node, "IS_IN", env_node))

   lpar_node = graph.merge_one("LPAR", "name", "%s" % lpar_name)
   
   bo_prem_queue_node = graph.merge_one("Queue", "name", "%s_DIRECT.BACKOFFICE.PREMIUM" % env_node["name"])
   
   results = graph.create_unique(Relationship(cics_node, "CONNECTS_TO", bo_prem_queue_node))
   results = graph.create_unique(Relationship(cics_node, "RUNS_ON", cics_env_node))
   results = graph.create_unique(Relationship(cics_env_node, "RUNS_ON", lpar_node))
   results = graph.create_unique(Relationship(lpar_node, "RUNS_ON", mf_node))

   db2_node = graph.merge_one("DBServer", "name", "%s" % db2_name)
   db2_node['type'] = 'DB/2'
   db2_node['system'] = 'BackOffice'
   db2_node.push()
   db2_env_node = graph.merge_one("DB2Env", "name", "%s" % db2_env_name)
   results = graph.create_unique(Relationship(cics_node, "CONNECTS_TO", db2_node))
   results = graph.create_unique(Relationship(db2_node, "RUNS_ON", db2_env_node))
   results = graph.create_unique(Relationship(db2_env_node, "RUNS_ON", lpar_node))
   results = graph.create_unique(Relationship(db2_node, "IS_IN", env_node))

def SetupRESTEndPoints(app_srv_node, env_node):
   print('ModelSay.py - Setting up REST End Points on %s' % app_srv_node["name"])
   if app_srv_node['system'] == 'PAS':
      url = 'http://%s:8083/api/resource.json' % app_srv_node["name"]
      response = urllib2.urlopen(url).read()
      data = json.loads(response)
   elif app_srv_node['system'] == 'Billing':
      url = 'http://%s:8083/swagger.yaml' % app_srv_node["name"]
      response = urllib2.urlopen(url).read()
      data = yaml.load(response)
   elif app_srv_node['system'] == 'Client':
      url = 'http://%s:8083/swagger.yaml' % app_srv_node["name"]
      response = urllib2.urlopen(url).read()
      data = yaml.load(response)
   #print('error: %s' % urllib2.URLError)

   app_srv_name = app_srv_node["name"]
   system = 'PAS'
   api_version = data['info']['version']
   
   for path in data['paths']:
      path_name = env_node['name'] + path
      REST_node = graph.merge_one("RESTEndPoint", "name", path_name)
      REST_node['system'] = app_srv_node["system"]
      REST_node['version'] = api_version
      REST_node.push()
      results = graph.create_unique(Relationship(REST_node, "RUNS_ON", app_srv_node))
      results = graph.create_unique(Relationship(REST_node, "IS_IN", env_node))
      for request in data['paths'][path]:
         request_name = request + env_node['name'] + path
         Request_node = graph.merge_one("RESTRequest", "name", request_name)
         Request_node['system'] = app_srv_node['system']
         Request_node['tag'] = data['paths'][path][request]['tags']
         Request_node['summary'] = data['paths'][path][request]['summary']
         Request_node.push()
         results = graph.create_unique(Relationship(REST_node, "ALOWS", Request_node))        
         results = graph.create_unique(Relationship(Request_node, "IS_IN", env_node))

def SetupUM(env_node):
   #print('ModelSay.py - Setting up User Management in %s' % env_node["name"])
   env_name = env_node["name"]

   #print(env_name)
   cypher = "MATCH (vm:GatewayServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher) 
   for rec in results:
      #print(rec.vm['name'])
      gw_srv_node = rec.vm
      for vm in graph.match(start_node=env_node, rel_type="IS_IN", bidirectional=True):
         if vm.start_node["system"] == "UserMgmnt": 
            if 'AuthServer' in vm.start_node.labels:
               auth_node = vm.start_node
               results = graph.create_unique(Relationship(gw_srv_node, "CONNECTS_TO", auth_node))
               cypher = "MATCH (vm:AuthDBServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
               results = graph.cypher.execute(cypher)
               for rec in results:
                  auth_db_node = rec.vm
                  results = graph.create_unique(Relationship(auth_node, "CONNECTS_TO", auth_db_node))
            if 'DiscServer' in vm.start_node.labels:
               results = graph.create_unique(Relationship(gw_srv_node, "CONNECTS_TO", vm.start_node))

def SetupFrontEnd(env_node):
   print('ModelSay.py - Setting up FrontEnd in %s' % env_node["name"])
   ######
   # I don't have access to the Frontend VMs and they may be cloud based
   #   so this will build the nodes for each environment
   ######
   env_name = env_node["name"]
   frontend_name = 'fe%sappsrv1' % env_name
   frontend_node = Node('FrontEndServer', 'VM', system='FrontEnd', name=frontend_name, status='UNKNOWN' ) 
   results = graph.create_unique(Relationship(frontend_node, "IS_IN", env_node))
   
   connections = ('PASServer', 'SmartyStreetsService', 'DocMgmntServer',
                   'GatewayServer', 'BillingServer', 'ClientServer')
   #  Read thru all FrontEnd Servers
   cypher = "MATCH (vm:FrontEndServer)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher)
   for fe in results:
      front_end_node = fe.vm
      # connect to feature to  servers
      for connection in connections:
         cypher = "MATCH (vm:%s)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % (connection, env_name)
         results = graph.cypher.execute(cypher)
         for rec in results:
            app_srv_node = rec.vm
            results = graph.create_unique(Relationship(front_end_node, "CONNECTS_TO", app_srv_node))

def SetupFeatures(env_node):
   print('ModelSay.py - Setting up Features in %s' % env_node["name"])
   ####
   env_name = env_node["name"]
   #################################################################
   #  Setup Quote feature
   quote_name = 'Quote_' + env_name
   quote_node = graph.merge_one("Feature", "name", quote_name)
   quote_node.push()
   results = graph.create_unique(Relationship(quote_node, "IS_IN", env_node))
   
   dependencies = ('PASServer', 'ElasticDB', 'MongoDB', 'CassandraDB', 'SmartyStreetsService', 'LexisNexisService',
                   'RatabaseServer', 'GatewayServer', 'AuthServer', 'AuthDBServer', 'BillingServer', 'ClientServer',
                   'FrontEndServer', 'WalletServer')
   # connect to feature to  servers
   for dependency in dependencies:
      cypher = "MATCH (vm:%s)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % (dependency, env_name)
      results = graph.cypher.execute(cypher) 
      for rec in results:
         app_srv_node = rec.vm
         results = graph.create_unique(Relationship(quote_node, "DEPENDS_ON", app_srv_node))
   #################################################################
   #  Setup Purchase feature
   purchase_name = 'Purchase_' + env_name
   purchase_node = graph.merge_one("Feature", "name", purchase_name)
   purchase_node.push()
   results = graph.create_unique(Relationship(purchase_node, "IS_IN", env_node))
   
   dependencies = ('PASServer', 'ElasticDB', 'MongoDB', 'CassandraDB', 'SmartyStreetsService', 'LexisNexisService',
                   'RatabaseServer', 'GatewayServer', 'AuthServer', 'AuthDBServer', 'BillingServer', 'ClientServer',
                   'DocMgmntServer', 'FrontEndServer', 'WalletServer', 'BluePayService', 'Mainframe')
   # connect to feature to  servers
   for dependency in dependencies:
      cypher = "MATCH (vm:%s)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % (dependency, env_name)
      results = graph.cypher.execute(cypher) 
      for rec in results:
         app_srv_node = rec.vm
         results = graph.create_unique(Relationship(purchase_node, "DEPENDS_ON", app_srv_node))
   
def LoadConstraints():
   print('ModelSay.py - Loading Constraints')
   graph.schema.create_uniqueness_constraint("Domain", "name")
   graph.schema.create_uniqueness_constraint("Environment", "name")
   graph.schema.create_uniqueness_constraint("VM", "name")
   graph.schema.create_uniqueness_constraint("Mainframe", "name")
   graph.schema.create_uniqueness_constraint("VMwareCluster", "name")
   graph.schema.create_uniqueness_constraint("VMwareServer", "name")
   graph.schema.create_uniqueness_constraint("Queue", "name")
   graph.schema.create_uniqueness_constraint("QServer", "name")
   graph.schema.create_uniqueness_constraint("AppServer", "name")
   graph.schema.create_uniqueness_constraint("DBServer", "name")
   graph.schema.create_uniqueness_constraint("DiscServer", "name")
   graph.schema.create_uniqueness_constraint("GatewayServer", "name")
   graph.schema.create_uniqueness_constraint("Program", "name")
   graph.schema.create_uniqueness_constraint("TimeServer", "name")
   # LPAR

def DeleteConstraints():
   print('ModelSay.py - Deleting Constraints')
   for label in graph.node_labels:
      for cons in graph.schema.get_uniqueness_constraints(label):
         #print('cons: %s' % cons)
         graph.schema.drop_uniqueness_constraint(label, cons)
   
def DeleteGraph():
   print('ModelSay.py - Deleting Existing Graph')
   DeleteConstraints()
   graph.cypher.execute("MATCH (n) OPTIONAL MATCH (n)-[r]-()DELETE n,r")

def LoadDomains():
   print('ModelSay.py - Loading Domainss')
   file = open("LoadDomain.txt")
   cypher = file.read()
   file.close()
   graph.cypher.execute(cypher)

def LoadQueries():
   print('ModelSay.py - Loading Queries')
   file = open("LoadQuery.txt")
   cypher = file.read()
   file.close()
   graph.cypher.execute(cypher)

def main():
   global graph
    
   graph = Graph("http://neo4j:shelter@10.8.30.56:7474/db/data/")
   #graph = Graph("http://neo4j:shelter@localhost:7474/db/data/")
   print(graph.uri)
   DeleteGraph()
   #LoadConstraints()
   LoadDomains()
   LoadQueries()
   SetupVMware()
   ReadVMs()
   
   SetupSystems()

      
# Start program
if __name__ == "__main__":
   main()
