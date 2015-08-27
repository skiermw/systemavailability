#!/usr/bin/env python

import urllib2

def SetupRESTEndPoints():
    #app_srv_node = ''
    app_srv_node = 'cldapp1'   
    #url = 'http://billdevappsrv1:8090/api/resource.json'
    url = 'http://dcdevappsrv1:8083/api/resource.json'
    #url = 'http://cldapp1:8080'
    
    response = urllib2.urlopen(url).read()
    print('error: %s' % urllib2.URLError)
    #data = json.loads(response)
    print(response.text)
    
   

def main():
   
   SetupRESTEndPoints()

      
# Start program
if __name__ == "__main__":
   main()
