#!/usr/bin/env python
#   ReadSwaggerAPI.py
#
import sys
import json
from pprint import pprint
import urllib2
#from collections import namedtuple

url = 'http://dctestappsrv1:8083/api/resource.json'
response = urllib2.urlopen(url).read()

print 'error: %s' % urllib2.URLError
#print repr(response)
#print response

data = json.loads(response)
#paths = []
#print json.dumps(data, sort_keys=False, indent=4, separators=(',', ':'))
print('version %s' % data['info']['version'])
for path in data['paths']:
    print(path)
    for request in data['paths'][path]:
        print(data['paths'][path][request]['tags'])
        print(data['paths'][path][request]['summary'])
        

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

