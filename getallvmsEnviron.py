#!/usr/bin/env python
# VMware vSphere Python SDK
# Copyright (c) 2008-2015 VMware, Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Python program for listing the vms on an ESX / vCenter host
"""
from __future__ import print_function

import pyVmomi

from pyVmomi import vim
from pyVmomi import vmodl

from pyVim.connect import SmartConnect, Disconnect
from pyVmomi import vmodl

import argparse
import atexit
import getpass
import json
from py2neo import Graph, Node, authenticate, Relationship
import urllib2
from collections import namedtuple



def GetArgs():
   """
   Supports the command-line arguments listed below.
   """
   parser = argparse.ArgumentParser(
       description='Process args for retrieving all the Virtual Machines')
   parser.add_argument('-s', '--host', required=True, action='store',
                       help='Remote host to connect to')
   parser.add_argument('-o', '--port', type=int, default=443, action='store',
                       help='Port to connect on')
   parser.add_argument('-u', '--user', required=True, action='store',
                       help='User name to use when connecting to host')
   parser.add_argument('-p', '--password', required=False, action='store',
                       help='Password to use when connecting to host')
   args = parser.parse_args()
   return args

   
def GetSystem(name):
   dc = 'dc'
   say = 'say'
   say_um = 'sayum'
   billing = 'bill'
   
  
   if name[:2]==dc:
      system = 'PAS'
      environ = name[2:6]
   elif name[:5]==say_um:
      system = 'UseMgmnt'
      environ = name[5:9]
   elif name[:3]==say:
      system = 'UseMgmnt'
      environ = name[3:7]
   elif name[:4]==billing:
      system = 'Billing'
      environ = name[4:8]
   else:
      system = 'UNKNOWN'
      environ = 'UNKNOWN'

   if environ[:3] == 'dev':
      environ = 'devl'

   if environ not in ['devl', 'prod', 'demo', 'test']:
      environ = 'UNKNOWN'
      
   return system, environ

   
def PrintVmInfo(vm, depth=1):
   """
   Print information for a particular virtual machine or recurse into a folder
    with depth protection
   """
   maxdepth = 10

   # if this is a group it will have children. if it does, recurse into them
   # and then return
   if hasattr(vm, 'childEntity'):
      if depth > maxdepth:
         return
      vmList = vm.childEntity
      for c in vmList:
         PrintVmInfo(c, depth+1)
      return
   environ = ""
   summary = vm.summary
   print("Name       : ", summary.config.name)
   print("Path       : ", summary.config.vmPathName)
   print("Guest      : ", summary.config.guestFullName)
   annotation = summary.config.annotation
   if annotation != None and annotation != "":
      print("Annotation : ", annotation)
   print("State      : ", summary.runtime.powerState)
   if summary.guest != None:
      ip = summary.guest.ipAddress
      if ip != None and ip != "":
         print("IP         : ", ip)
   if summary.runtime.question != None:
      print("Question  : ", summary.runtime.question.text)

   system, environ = GetSystem(summary.config.name)
   #print("System     : ", system)
   #print("Environment: ", environ)
   #print("")

def WriteVmInfo(vm, depth=1):
   """
   Print information for a particular virtual machine or recurse into a folder
    with depth protection
   """
   maxdepth = 10
   
   # if this is a group it will have children. if it does, recurse into them
   # and then return
   if hasattr(vm, 'childEntity'):
      if depth > maxdepth:
         return
      vmList = vm.childEntity
      for c in vmList:
         WriteVmInfo(c, depth+1)
      return
   environ = ""
   summary = vm.summary
   name = summary.config.name
   #print( name)
   os = summary.config.guestFullName
   state = summary.runtime.powerState
   if summary.guest != None:
      ip = summary.guest.ipAddress
      
   system, environ = GetSystem(summary.config.name)
   
   
   vm_node = graph.merge_one("VM", "name", name) 
   vm_node['ip'] = ip
   vm_node['system'] = system
   vm_node['status'] = state
   vm_node['os'] = os
   #print(environ)
   #print(system)
   if environ != "UNKNOWN":
      env_node = graph.merge_one("Environment", "name", environ.upper())
      results = graph.create_unique(Relationship(vm_node, "IS_IN", env_node))
   vm_node.push()

   if 'queue' in name:
      vm_node.labels.add("QServer")
      SetupQueues(vm_node)
   if 'app' in name:
      vm_node.labels.add("AppServer")
   if 'mongo' in name:
      vm_node.labels.add("DBServer")
   if 'cass' in name:
      vm_node.labels.add("DBServer")
   if 'elast' in name:
      vm_node.labels.add("DBServer")
   if 'time' in name:
      vm_node.labels.add("TimeServer")
   if 'gw' in name:
      vm_node.labels.add("GatewayServer")
   if 'auth' in name:
      vm_node.labels.add("AuthServer")
   if 'dbsrv' in name:
      vm_node.labels.add("DBServer")
   if 'discovery' in name:
      vm_node.labels.add("DiscServer")
      
   vm_node.push()
                                      
def WriteQueueInfo(qmgr_node, queue, routing_key):
   env_rel = graph.match(start_node=qmgr_node, rel_type="IS_IN")
   for rel in env_rel:
      env_node = rel.end_node
   queue = env_node['name']+"_"+queue
   queue_node = graph.merge_one("Queue", "name", queue) 
   #print(routing_key)
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   binding_rel = graph.create_unique(Relationship(qmgr_node, "IS_BOUND_TO", queue_node, routing_key=routing_key))


def SetupQueues(qmgr_node):
   
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
   except:
      print("Couldn't connect to "+qmgr_node['name']+" "+qmgr_node['status'])
      

def ReadVMs():
   url='VCPRODSRV1'
   username='tsojmw'
   password='hyenas21'
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
                  vmList = vmFolder.childEntity
                  for vm in vmList:
                     WriteVmInfo(vm)
   return 0

def WriteMFQueueInfo():
   # this is a temporary section until we can read the bridge program's settings
   #   Setup mainframe nodes and relationships
   #  (bridge program)-[runs on]-(rabbit queue mgr)
   #  (bridge program)-[connects]-(WS queue mgr)
   #  (WS queue mgr)-[connects]-(WS queue)
   #  (bridge program)-[reads]-(rabbit queue)

   # DEVL 
   env_node = graph.merge_one("Environment", "name", "DEVL")
   # note one per bridged WS Queue
   queue_node = graph.merge_one("Queue", "name", "DEV_DIRECT.BACKOFFICE.PREMIUM")
   queue_node['type']= 'WSMQ'
   queue_node.push()
   
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   queue_srv_node = graph.merge_one("MF", "name", "MQD1")
   queue_srv_node['type']= 'WSMQ'
   queue_srv_node.push()
   
   results = graph.create_unique(Relationship(queue_srv_node, "IS_IN", env_node))
   bridge_node = graph.merge_one("Program", "name", "DEV_Act_Bridge")
   results = graph.create_unique(Relationship(bridge_node, "IS_IN", env_node))
   rabbit_node = graph.merge_one("VM", "name", "dcdevqueuesrv1")
   
   rabbitq_node = graph.merge_one("Queue", "name", "DEV_actuarial")
      
   results = graph.create_unique(Relationship(bridge_node, "READS", rabbitq_node))
   results = graph.create_unique(Relationship(bridge_node, "RUNS_ON", rabbit_node))
   results = graph.create_unique(Relationship(bridge_node, "CONNECTS_TO", queue_srv_node))
   results = graph.create_unique(Relationship(queue_srv_node, "CONNECTS_TO", queue_node))
   #################################################################################
   # TEST 
   env_node = graph.merge_one("Environment", "name", "TEST")
   # note one per bridged WS Queue
   queue_node = graph.merge_one("Queue", "name", "TEST_DIRECT.BACKOFFICE.PREMIUM")
   queue_node['type']= 'WSMQ'
   queue_node.push()
   
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   queue_srv_node = graph.merge_one("MF", "name", "MQT1")
   queue_srv_node['type']= 'WSMQ'
   queue_srv_node.push()
   
   results = graph.create_unique(Relationship(queue_srv_node, "IS_IN", env_node))
   bridge_node = graph.merge_one("Program", "name", "TEST_Act_Bridge")
   results = graph.create_unique(Relationship(bridge_node, "IS_IN", env_node))
   rabbit_node = graph.merge_one("VM", "name", "dctestqueuesrv1")
   
   # find the correct rabbit queue - using find rather than merge because if doesn't 
   #    exist there is a problem
   rabbitq_node = graph.find_one("Queue", "name", "TEST_actuarial")
   
   results = graph.create_unique(Relationship(bridge_node, "READS", rabbitq_node))
   results = graph.create_unique(Relationship(bridge_node, "RUNS_ON", rabbit_node))
   results = graph.create_unique(Relationship(bridge_node, "CONNECTS_TO", queue_srv_node))
   results = graph.create_unique(Relationship(queue_srv_node, "CONNECTS_TO", queue_node))
   #################################################################################
   # DEMO 
   env_node = graph.merge_one("Environment", "name", "DEMO")
   # note one per bridged WS Queue
   queue_node = graph.merge_one("Queue", "name", "DEMO_DIRECT.BACKOFFICE.PREMIUM")
   queue_node['type']= 'WSMQ'
   queue_node.push()
   
   results = graph.create_unique(Relationship(queue_node, "IS_IN", env_node))
   queue_srv_node = graph.merge_one("MF", "name", "MQM1")
   queue_srv_node['type']= 'WSMQ'
   queue_srv_node.push()
   
   results = graph.create_unique(Relationship(queue_srv_node, "IS_IN", env_node))
   bridge_node = graph.merge_one("Program", "name", "DEMO_Act_Bridge")
   results = graph.create_unique(Relationship(bridge_node, "IS_IN", env_node))
   rabbit_node = graph.merge_one("VM", "name", "dcdemoqueuesrv1")
   
   # find the correct rabbit queue - using find rather than merge because if doesn't 
   #    exist there is a problem
   rabbitq_node = graph.find_one("Queue", "name", "DEMO_actuarial")
   
   results = graph.create_unique(Relationship(bridge_node, "READS", rabbitq_node))
   results = graph.create_unique(Relationship(bridge_node, "RUNS_ON", rabbit_node))
   results = graph.create_unique(Relationship(bridge_node, "CONNECTS_TO", queue_srv_node))
   results = graph.create_unique(Relationship(queue_srv_node, "CONNECTS_TO", queue_node))
   
def SetupSystems():
   # Loop thru all environments
   for env in graph.find("Environment"):
      SetupPAS(env)
      
def SetupPAS(env_node):
   env_name = env_node["name"]
   #print(env_name)
   cypher = "MATCH (vm:AppServer)-[:IS_IN]->(e:Environment) WHERE vm.system = 'PAS' and e.name = '%s' RETURN vm" % env_name
   results = graph.cypher.execute(cypher) 
   for rec in results:
      #print(rec.vm['name'])
      app_srv_node = rec.vm
      for vm in graph.match(start_node=env_node, rel_type="IS_IN", bidirectional=True):
         if vm.start_node["system"] == "PAS": 
            if 'DBServer' in vm.start_node.labels:
               #print(vm.start_node['name'])
               results = graph.create_unique(Relationship(app_srv_node, "NEEDS", vm.start_node))
            if 'QServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "NEEDS", vm.start_node))
            if 'TimeServer' in vm.start_node.labels:
                  #print(vm.start_node['name'])
                  results = graph.create_unique(Relationship(app_srv_node, "NEEDS", vm.start_node))
        
            


'''
      print(vm.start_node["name"])
      if vm.start_node.
      if 'queue' in vm.start_node["name"]:
         vm_node.labels.add("QServer")
         SetupQueues(vm_node)
         
      if 'app' in name:
         vm_node.labels.add("AppServer")
      if 'mongo' in name:
         vm_node.labels.add("DBServer")
      if 'cass' in name:
         vm_node.labels.add("DBServer")
      if 'elast' in name:
         vm_node.labels.add("DBServer")
'''      
'''
   # find the correct rabbit queue - using find rather than merge because if doesn't 
   #    exist there is a problem
   rabbitq_node = graph.find_one("Queue", "name", "DEV_actuarial")
   
   results = graph.create_unique(Relationship(bridge_node, "READS", rabbitq_node))
   results = graph.create_unique(Relationship(bridge_node, "RUNS_ON", rabbit_node))
   results = graph.create_unique(Relationship(bridge_node, "CONNECTS_TO", queue_srv_node))
   results = graph.create_unique(Relationship(queue_srv_node, "CONNECTS_TO", queue_node))
   '''
def main():
   global graph
   graph = Graph("http://neo4j:shelter@10.8.30.170:7474/db/data/")
   ReadVMs()
   WriteMFQueueInfo()
   SetupSystems()
   
      
# Start program
if __name__ == "__main__":
   main()
