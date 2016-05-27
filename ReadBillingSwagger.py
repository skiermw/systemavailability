#!/usr/bin/env python

import json
import yaml
import urllib2

def SetupRESTEndPoints(name):

   url = 'http://%s:8083/swagger.yaml' % name
   response = urllib2.urlopen(url).read()
   #print('error: %s' % urllib2.URLError)

   print('response= %s' % response)
   data = yaml.load(response)
   print('yaml = %s' % data)
   #json_data = json.dumps(data)
   #print('json = %s' % json_data)

   api_version = data['info']['version']

   for path in data['paths']:
      path_name =  path

      for request in data['paths'][path]:
         request_name = request  + path
         tag = data['paths'][path][request]['tags']
         summary = data['paths'][path][request]['summary']
         print('%s %s %s' % (request_name, tag, summary))
         print(' ')


def main():
   SetupRESTEndPoints('blmapp1')


# Start program
if __name__ == "__main__":
   main()
