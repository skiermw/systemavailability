#!/usr/bin/env python

import urllib2

def SetupRESTEndPoints():
    app_srv_node = 'billdevappsrv1'
   
    url = 'http://%s:8090/api/resource.json' % app_srv_node
    response = urllib2.urlopen(url).read()
    #print('error: %s' % urllib2.URLError)
    #data = json.loads(response)
    print(response.text)
    
   

def main():
   
   SetupRESTEndPoints()

      
# Start program
if __name__ == "__main__":
   main()
