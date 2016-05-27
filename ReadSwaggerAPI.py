#!/usr/bin/env python
#   ReadSwaggerAPI.py
#
import sys
import json
from pprint import pprint
import urllib2

#url = 'http://dctestappsrv1:8083/api/resource.json'
url = 'http://test.api.sayinsurance.com/:8083/api/resource.json'

response = urllib2.urlopen(url).read()

print 'error: %s' % urllib2.URLError

data = json.loads(response)

app_srv_name = url
system = 'PAS'
api_version = data['info']['version']

for path in data['paths']:
    path = path
    
    for request in data['paths'][path]:
        
        tag = data['paths'][path][request]['tags']
        summary = data['paths'][path][request]['summary']
        

'''
for path in data['paths']:
    print('  ' + path)
    for request in data['paths'][path]:
        print('    ' + request)
        for stuff in data['paths'][path][request]:
            print(stuff)
            #print( data['paths'][path][request][stuff])
            for i in stuff[]:
                print(stuff[0])
'''

