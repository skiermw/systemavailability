#!/usr/bin/env python
# 

"""
Python program for modeling the SAY system
"""
from __future__ import print_function

import pyVmomi
from pyVmomi import vim
from pyVmomi import vmodl
from pyVim.connect import SmartConnect, Disconnect
from pyVmomi import vmodl
import atexit
import json
from py2neo import Graph, Node, authenticate, Relationship
import urllib2
from collections import namedtuple

def GetSystem(name):
   #print('getallvmsEnviron.py - Parsing VM Name')
   
   dc = 'dc'
   say = 'say'
   say_um = 'sayum'
   say_doc = 'saydoc'
   billing = 'bill'
   
 
   # new style VM naming conventions
   if name[:2]=='pa':
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
   elif name[:2]=='cl':
      system = 'Client'
      environ = GetEnvironment(name[2])
   # end new style
   elif name[:2]==dc:
      system = 'PAS'
      environ = name[2:6].upper()
   elif name[:5]==say_um:
      system = 'UserMgmnt'
      environ = name[5:9].upper()
   elif name[:6]==say_doc:
      system = 'DocMgmnt'
      environ = name[6:9].upper()
   elif name[:3]==say:
      system = 'UserMgmnt'
      environ = name[3:7].upper()
   elif name[:4]==billing:
      system = 'Billing'
      environ = name[4:8].upper()
   elif name == 'dirchanlsrv1':
      system = 'PAS'
      environ = 'PROD'
   else:
      system = 'UNKNOWN'
      environ = 'UNKNOWN'
      
   #print('GetSystem: environ = %s' % environ)
   
   if environ[:3] == 'DEV':
      environ = 'DEVL'

   if environ not in ['DEVL', 'PROD', 'DEMO', 'TEST', 'LOAD']:
      environ = 'UNKNOWN'
      
   
   return system, environ

def GetEnvironment(env_letter):
   #print('env letter: %s' % env_letter)
   if env_letter == 't':
      environment = 'TEST'
   elif env_letter == 'd':
      environment = 'DEVL'
   elif env_letter == 'm':
      environment = 'DEMO'
   elif env_letter == 'p':
      environment = 'PROD'
   elif env_letter == 'l':
      environment = 'LOAD'
   else:
      environment = 'UNKNOWN'

   return environment

def SetupVMware():
   #print('getallvmsEnviron.py - Setup VMware')
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
   #print('getallvmsEnviron.py - Writing VMs to Graph')
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
      print('VM Folder: %s' % vm.name)
      #print('Depth: %s' % depth)
      #global folder 
      folder = vm.name
      vmList = vm.childEntity
      for c in vmList:
         WriteVmInfo(c, depth+1)
      return
   #print('folder = %s' % folder)
   if folder == 'DirectChannel':
      environ = ""
      summary = vm.summary
      name = summary.config.name
      #print( name)
      os = summary.config.guestFullName
      state = summary.runtime.powerState
      if summary.guest != None:
         ip = summary.guest.ipAddress
               
      #print('name = %s' % summary.config.name)   
      system, environ = GetSystem(summary.config.name)

      vm_cluster_node = graph.merge_one("VMCluster", "name", "DirectChannel")
            
      vm_node = graph.merge_one("VM", "name", name) 
      vm_node['ip'] = ip
      vm_node['system'] = system
      vm_node['status'] = state
      vm_node['os'] = os
      vm_node.push()
      #print(environ)
      #print(system)
      if environ != "UNKNOWN":
         env_node = graph.merge_one("Environment", "name", environ.upper())
         results = graph.create_unique(Relationship(vm_node, "IS_IN", env_node))
            

      if 'queue' in name:
         vm_node.labels.add("QServer")
         SetupQueues(vm_node)
            
      if 'mongo' in name:
         vm_node.labels.add("DBServer")
         vm_node.labels.add("MongoDB")
            
      if 'elast' in name:
         vm_node.labels.add("DBServer")
         vm_node.labels.add("ElasticDB")
            
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
         vm_node.labels.add("DevOpsServer")
      if 'build' in name:
         vm_node.labels.add("BuildServer")
         vm_node.labels.add("DevOpsServer")
      if 'repo' in name:
         vm_node.labels.add("RepoServer")
         vm_node.labels.add("DevOpsServer")
      if 'knife' in name:
         vm_node.labels.add("KnifeServer")
         vm_node.labels.add("DevOpsServer")
      if 'vagrant' in name:
         vm_node.labels.add("VagrantServer")
         vm_node.labels.add("DevOpsServer")
      if 'sayum' in name and 'db' in name:
         vm_node.labels.add("AuthDBServer")
      # new style naming   
      if 'app' in name:
         #print('name: %s' % name)
         vm_node.labels.add("AppServer")
         vm_node.labels.add("%sServer" % vm_node['system'])
      if 'aut' in name:
         vm_node.labels.add("AuthServer")
      if 'bat' in name:
         vm_node.labels.add("BatchServer")
      if 'bld' in name:
         vm_node.labels.add("BuildServer")
         vm_node.labels.add("DevOpsServer")
      if 'cas' in name:
         vm_node.labels.add("DBServer")
         vm_node.labels.add("CassandraDB")
      if 'chf' in name:
         vm_node.labels.add("ChefServer")
         vm_node.labels.add("DevOpsServer")
      if 'dis' in name:
         vm_node.labels.add("DiscServer")
      if 'doc' in name:
         vm_node.labels.add("DocServer")
      if 'els' in name:
         vm_node.labels.add("DBServer")
         vm_node.labels.add("ElasticDB")
      if 'gtw' in name:
         vm_node.labels.add("GatewayServer")
      if 'knf' in name:
         vm_node.labels.add("KnifeServer")
         vm_node.labels.add("DevOpsServer")
      if 'lic' in name:
         vm_node.labels.add("LicenseServer")
      if 'mng' in name:
         vm_node.labels.add("DBServer")
         vm_node.labels.add("MongoDB")
      if 'mon' in name and not 'mongo' in name:
         vm_node.labels.add("DBMonitor")
      if 'rep' in name:
         vm_node.labels.add("RepoServer")
         vm_node.labels.add("DevOpsServer")
      if 'rmq' in name:
         vm_node.labels.add("QServer")
         SetupQueues(vm_node)
      if 'tim' in name:
         vm_node.labels.add("TimeServer")
      if 'utl' in name:
         vm_node.labels.add("UtilityServer")
      if 'vgt' in name:
         vm_node.labels.add("VagrantServer")
         vm_node.labels.add("DevOpsServer")
               
      vm_node.push()
            
      # Attach VM to VM Cluster
      results = graph.create_unique(Relationship(vm_node, "RUNS_ON", vm_cluster_node))
                                      
def WriteQueueInfo(qmgr_node, queue, routing_key):
   #print('getallvmsEnviron.py - Writing Queue Info')
   #print('   qmgr_node: %s' % qmgr_node['name'])
   env_rel = graph.match(start_node=qmgr_node, rel_type="IS_IN")
   for rel in env_rel:
      env_node = rel.end_node
   queue = env_node['name']+"_"+queue
   queue_node = graph.merge_one("Queue", "name", queue)
   queue_node['type'] = 'RabbitMQ'
   queue_node['system'] = 'PAS'
   queue_node.push()
   #print(routing_key)
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   binding_rel = graph.create_unique(Relationship(qmgr_node, "CONNECTS_TO", queue_node, routing_key=routing_key))


def SetupQueues(qmgr_node):
   #q_name = qmgr_node['name']
   print('getallvmsEnviron.py - Reading Queue Manager %s' % qmgr_node['name'])
   url = 'http://%s:15672/api/exchanges/%%2f/direct_channel/bindings/source' % qmgr_node['name']
   username = 'admin'
   password = 'shelter1'
   passman = urllib2.HTTPPasswordMgrWithDefaultRealm()
   passman.add_password(None, url, username, password)
   urllib2.install_opener(urllib2.build_opener(urllib2.HTTPBasicAuthHandler(passman)))

   req = urllib2.Request(url)
   try:
      f = urllib2.urlopen(req)
      json_str = f.read()
      data = json.loads(json_str)
     
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
      print("Couldn't connect to "+qmgr_node['name']+" "+qmgr_node['status'] + " Error:" + e.reason)
      

def ReadVMs():
   print('getallvmsEnviron.py - Reading VMs from VMware')
   url='VCPRODSRV1'
   username='tsojmw'
   password='hyenas30'
   try:
      si = SmartConnect(
            host=url,
            user=username,
            pwd=password,
      )
                      
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

   if not si:
      print("Could not connect to the specified host using specified "
                   "username and password")
      return -1

   atexit.register(Disconnect, si)
   
   content = si.RetrieveContent()
   for child in content.rootFolder.childEntity:
      if hasattr(child, 'vmFolder'):
                  datacenter = child
                  vmFolder = datacenter.vmFolder
                  #print('ReadVMS - VM Folder: %s' % vmFolder.name)
                  vmList = vmFolder.childEntity
                  for vm in vmList:
                     WriteVmInfo(vm)
   
   return 0

  
def SetupMFQueue(env_node):
   #print('getallvmsEnviron.py - Setting up MF Queues in %s' % env_node["name"])
   
   # this is a temporary section until we can read the bridge program's settings
   #   Setup mainframe nodes and relationships
   #  (bridge program)-[runs on]-(rabbit queue mgr)
   #  (bridge program)-[connects]-(WS queue mgr)
   #  (WS queue mgr)-[connects]-(WS queue)
   #  (bridge program)-[reads]-(rabbit queue)
   
   # setup Mainframe node
   mf_node = graph.merge_one("Mainframe", "name", "Mainframe")
   mf_node['type'] = 'Hardware'
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
   rabbitq_node = graph.merge_one("Queue", "name", "%s_actuarial" % env_node["name"])
   results = graph.create_unique(Relationship(bo_bridge_node, "CONNECTS_TO", rabbitq_node))
   results = graph.create_unique(Relationship(bo_bridge_node, "CONNECTS_TO", bo_queue_node))
   results = graph.create_unique(Relationship(bo_queue_node, "RUNS_ON", mq_queue_srv_node))
   
   #    Reporting
   rpt_rabbitq_node = graph.merge_one("Queue", "name", "%s_reporting" % env_node["name"])
   results = graph.create_unique(Relationship(rpt_bridge_node, "CONNECTS_TO", rpt_rabbitq_node))
   results = graph.create_unique(Relationship(rpt_bridge_node, "CONNECTS_TO", rpt_queue_node))
   results = graph.create_unique(Relationship(rpt_queue_node, "RUNS_ON", mq_queue_srv_node))   
   
   
   #################################################################################   
def SetupSystems():
   print('getallvmsEnviron.py - Setup Systems')
   # Loop thru all environments
   for env in graph.find("Environment"):
      SetupRatabase(env)
      SetupPAS(env)
      SetupUM(env)
      SetupMFQueue(env)
      SetupClaims(env)
      SetupBackOffice(env)
      SetupFrontEnd(env)
      SetupFeatures(env)
      
      
def SetupClaims(env_node):
   print('getallvmsEnviron.py - Setting up Claims in %s' % env_node["name"])
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

def SetupBackOffice(env_node):
   print('getallvmsEnviron.py - Setting up BackOffice in %s' % env_node["name"])
   
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
   
   
def SetupPAS(env_node):
   #print('getallvmsEnviron.py - Setting up PAS in %s' % env_node["name"])
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
                  
      SetupRESTEndPoints(app_srv_node, env_node)
      
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

   

def SetupRESTEndPoints(app_srv_node, env_node):
   print('getallvmsEnviron.py - Setting up REST End Points on %s' % app_srv_node["name"])
   url = 'http://%s:8083/api/resource.json' % app_srv_node["name"]
   response = urllib2.urlopen(url).read()
   #print('error: %s' % urllib2.URLError)
   data = json.loads(response)
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
   #print('getallvmsEnviron.py - Setting up User Management in %s' % env_node["name"])
   env_name = env_node["name"]
   #print(env_name)
   cypher = "MATCH (vm:GatewayServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'UserMgmnt' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher) 
   for rec in results:
      #print(rec.vm['name'])
      gw_srv_node = rec.vm
      for vm in graph.match(start_node=env_node, rel_type="IS_IN", bidirectional=True):
         if vm.start_node["system"] == "UserMgmnt": 
            if 'AuthServer' in vm.start_node.labels:
               auth_node = vm.start_node
               results = graph.create_unique(Relationship(gw_srv_node, "CONNECTS_TO", auth_node))
            if 'DiscServer' in vm.start_node.labels:
               results = graph.create_unique(Relationship(gw_srv_node, "CONNECTS_TO", vm.start_node))
            if 'DBServer' in vm.start_node.labels:
               db_node = vm.start_node
                              
      results = graph.create_unique(Relationship(auth_node, "CONNECTS_TO", db_node))

      # connect to PAS app servers
      cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'PAS' and e.name = '%s' RETURN vm" % env_name
      results = graph.cypher.execute(cypher) 
      for rec in results:
         app_srv_node = rec.vm
         #print("app srv: %s - gw_srv: %s" % (app_srv_node['name'], gw_srv_node['name']))
         results = graph.create_unique(Relationship(app_srv_node, "CONNECTS_TO", gw_srv_node))
         
def SetupRatabase(env_node):
   print('getallvmsEnviron.py - Setting up Ratabase in %s' % env_node["name"])
   ######
   # I don't have access to the Ratabase VMs
   #   so this will build the nodes for each environment
   ######
   env_name = env_node["name"]
   ratabase_name = 'rb%sappsrv1' % env_name
   ratabase_node = Node('RatabaseServer', 'VM', system='Ratabase', name=ratabase_name, status='UNKNOWN' ) 
   results = graph.create_unique(Relationship(ratabase_node, "IS_IN", env_node))
   
def SetupFrontEnd(env_node):
   print('getallvmsEnviron.py - Setting up FrontEnd in %s' % env_node["name"])
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
   print('getallvmsEnviron.py - Setting up Features in %s' % env_node["name"])
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
                   'FrontEndServer')
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
                   'DocMgmntServer', 'FrontEndServer')
   # connect to feature to  servers
   for dependency in dependencies:
      cypher = "MATCH (vm:%s)-[:IS_IN]->(e:Environment) WHERE e.name = '%s' RETURN vm" % (dependency, env_name)
      results = graph.cypher.execute(cypher) 
      for rec in results:
         app_srv_node = rec.vm
         results = graph.create_unique(Relationship(purchase_node, "DEPENDS_ON", app_srv_node))
   
def LoadConstraints():
   print('getallvmsEnviron.py - Loading Constraints')
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
   print('getallvmsEnviron.py - Deleting Constraints')
   for label in graph.node_labels:
      for cons in graph.schema.get_uniqueness_constraints(label):
         #print('cons: %s' % cons)
         graph.schema.drop_uniqueness_constraint(label, cons)
   
def DeleteGraph():
   print('getallvmsEnviron.py - Deleting Existing Graph')
   DeleteConstraints()
   graph.cypher.execute("MATCH (n) OPTIONAL MATCH (n)-[r]-()DELETE n,r")
   
def LoadDomains():
   print('getallvmsEnviron.py - Loading Domains')
   file = open("LoadDomain.txt")
   cypher = file.read()
   file.close()
   graph.cypher.execute(cypher)
   
def main():
   global graph
    
   #graph = Graph("http://neo4j:shelter@10.8.30.170:7474/db/data/")
   graph = Graph("http://neo4j:shelter@localhost:7474/db/data/")
   print(graph.uri)
   DeleteGraph()
   LoadConstraints()
   LoadDomains()
   SetupVMware()
   ReadVMs()
   
   SetupSystems()

      
# Start program
if __name__ == "__main__":
   main()
