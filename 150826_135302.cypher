begin
create constraint on (n:`AppServer`) assert n.`name` is unique
create constraint on (n:`DBServer`) assert n.`name` is unique
create constraint on (n:`DiscServer`) assert n.`name` is unique
create constraint on (n:`Domain`) assert n.`name` is unique
create constraint on (n:`Environment`) assert n.`name` is unique
create constraint on (n:`GatewayServer`) assert n.`name` is unique
create constraint on (n:`Mainframe`) assert n.`name` is unique
create constraint on (n:`Program`) assert n.`name` is unique
create constraint on (n:`QServer`) assert n.`name` is unique
create constraint on (n:`Queue`) assert n.`name` is unique
create constraint on (n:`TimeServer`) assert n.`name` is unique
create constraint on (n:`VM`) assert n.`name` is unique
create constraint on (n:`VMwareCluster`) assert n.`name` is unique
create constraint on (n:`VMwareServer`) assert n.`name` is unique
create (_10051:`Domain` {`name`:"PAS", `status`:"UP", `system`:"PAS"})
create (_10052:`Domain` {`name`:"CRM", `status`:"UP", `system`:"CRM"})
create (_10053:`Domain` {`name`:"Client", `status`:"UP", `system`:"Client"})
create (_10054:`Domain` {`name`:"Billing", `status`:"UP", `system`:"Billing"})
create (_10055:`Domain` {`name`:"Actuarial", `status`:"UP", `system`:"Actuarial"})
create (_10056:`Domain` {`name`:"Ratabase", `status`:"UP", `system`:"Ratabase"})
create (_10057:`Domain` {`name`:"MarketingAutomation", `status`:"UP", `system`:"MarketingAutomation"})
create (_10058:`Domain` {`name`:"DocumentMGMT", `status`:"UP", `system`:"DocMgmnt"})
create (_10059:`Domain` {`name`:"UserMGMT", `status`:"UP", `system`:"UserMgmnt"})
create (_10060:`Domain` {`name`:"Claims", `status`:"UP", `system`:"Claims"})
create (_10061:`Domain` {`name`:"BI", `status`:"UP", `system`:"BI"})
create (_10062:`Domain` {`name`:"Reporting", `status`:"UP", `system`:"Reporting"})
create (_10063:`Domain` {`name`:"WebFrontEnd", `status`:"UP", `system`:"WebFrontEnd"})
create (_10064:`VMCluster` {`name`:"DirectChannelCluster"})
create (_10065:`Hardware` {`name`:"DirectChannelServer1"})
create (_10066:`Hardware` {`name`:"DirectChannelServer2"})
create (_10067:`Hardware` {`name`:"DirectChannelServer3"})
create (_10068:`VM`:`DiscServer` {`ip`:"10.4.4.4", `name`:"saydemodiscoverysrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10069:`Environment` {`name`:"DEMO"})
create (_10070:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.192", `name`:"dctestcassandrasrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10071:`Environment` {`name`:"TEST"})
create (_10072:`VM`:`DevOpsServer`:`VagrantServer` {`ip`:"10.4.5.72", `name`:"dcprodvagrantsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10073:`Environment` {`name`:"PROD"})
create (_10074:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.193", `name`:"dctestcassandrasrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10075:`VM`:`QServer` {`ip`:"10.4.4.98", `name`:"dctestqueuesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10076:`Queue` {`name`:"TEST_actuarial", `system`:"PAS", `type`:"RabbitMQ"})
create (_10077:`Queue` {`name`:"TEST_bi", `system`:"PAS", `type`:"RabbitMQ"})
create (_10078:`Queue` {`name`:"TEST_crm", `system`:"PAS", `type`:"RabbitMQ"})
create (_10079:`Queue` {`name`:"TEST_docman", `system`:"PAS", `type`:"RabbitMQ"})
create (_10080:`Queue` {`name`:"TEST_reporting", `system`:"PAS", `type`:"RabbitMQ"})
create (_10081:`Queue` {`name`:"TEST_test_q", `system`:"PAS", `type`:"RabbitMQ"})
create (_10082:`VM` {`ip`:"10.10.1.98", `name`:"sayrhel66template", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOff", `system`:"UserMgmnt"})
create (_10083:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.194", `name`:"dctestcassandrasrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10084:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.71", `name`:"dcdevelasticsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10085:`Environment` {`name`:"DEVL"})
create (_10086:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.72", `name`:"dcdevelasticsrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10087:`VM` {`ip`:"10.4.4.92", `name`:"saysandboxnosqlsrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10088:`VM` {`ip`:"10.4.4.93", `name`:"saysandboxnosqlsrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10089:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.12", `name`:"dcdevmongosrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10090:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.83", `name`:"dcdemoelasticsrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10091:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.11", `name`:"dcdevmongosrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10092:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.73", `name`:"dcdevelasticsrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10093:`VM` {`ip`:"10.10.1.143", `name`:"ubuntubase", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOff", `system`:"UNKNOWN"})
create (_10094:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.82", `name`:"dcdemoelasticsrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10095:`VM`:`TimeServer` {`ip`:"10.4.4.217", `name`:"dcdemotimesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10096:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.81", `name`:"dcdemoelasticsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10097:`VM`:`AppServer` {`ip`:"10.4.4.6", `name`:"clmapp1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"Client"})
create (_10098:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.13", `name`:"dcdevmongosrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10099:`VM`:`GatewayServer` {`ip`:"10.4.4.203", `name`:"sayumtestgwsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10100:`VM`:`DevOpsServer`:`RepoServer` {`ip`:"10.4.5.28", `name`:"sayumprodreposrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10101:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.148", `name`:"dctestelasticsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10102:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.149", `name`:"dctestelasticsrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10103:`VM`:`DBServer`:`ElasticDB` {`ip`:"10.4.4.150", `name`:"dctestelasticsrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10104:`VM`:`AppServer` {`ip`:"10.4.4.94", `name`:"dctestappsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10105:`VM`:`DiscServer` {`ip`:"10.4.4.2", `name`:"umddis1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10106:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.51", `name`:"dcdemocassandrasrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10107:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.52", `name`:"dcdemocassandrasrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10108:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.53", `name`:"dcdemocassandrasrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10109:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.167", `name`:"dctestmongosrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10110:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.43", `name`:"dctestmongosrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10111:`VM`:`QServer` {`ip`:"10.4.4.122", `name`:"dcdemoqueuesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10112:`Queue` {`name`:"DEMO_actuarial", `system`:"PAS", `type`:"RabbitMQ"})
create (_10113:`Queue` {`name`:"DEMO_bi", `system`:"PAS", `type`:"RabbitMQ"})
create (_10114:`Queue` {`name`:"DEMO_crm", `system`:"PAS", `type`:"RabbitMQ"})
create (_10115:`Queue` {`name`:"DEMO_docman", `system`:"PAS", `type`:"RabbitMQ"})
create (_10116:`Queue` {`name`:"DEMO_reporting", `system`:"PAS", `type`:"RabbitMQ"})
create (_10117:`Queue` {`name`:"DEMO_test_q", `system`:"PAS", `type`:"RabbitMQ"})
create (_10118:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.18", `name`:"dctestmongosrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10119:`VM`:`DevOpsServer`:`KnifeServer` {`ip`:"10.4.5.62", `name`:"dcprodknifesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10120:`VM` {`ip`:"10.4.7.22", `name`:"dirchanlsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10121:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.31", `name`:"dcdevcassandrasrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10122:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.32", `name`:"dcdevcassandrasrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10123:`VM`:`DBServer`:`CassandraDB` {`ip`:"10.4.4.33", `name`:"dcdevcassandrasrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10124:`VM`:`TimeServer` {`ip`:"10.4.4.215", `name`:"dcdevtimesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10125:`VM`:`AppServer` {`ip`:"10.4.4.7", `name`:"cltapp1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"Client"})
create (_10126:`VM`:`DiscServer` {`ip`:"10.4.4.3", `name`:"saytestdiscoverysrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10127:`VM`:`GatewayServer` {`ip`:"10.4.4.174", `name`:"sayumdevgwsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10128:`VM`:`AuthServer` {`ip`:"10.4.4.168", `name`:"sayumdemoauthsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10129:`VM`:`BatchServer` {`ip`:"10.4.4.57", `name`:"padbat1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10130:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.23", `name`:"dcdemomongosrv3", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10131:`VM` {`ip`:"10.4.4.218", `name`:"dctestutilsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10132:`VM`:`DevOpsServer`:`RepoServer` {`ip`:"10.4.5.73", `name`:"dcprodreposrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10133:`VM`:`BuildServer`:`DevOpsServer` {`ip`:"10.4.5.69", `name`:"dcprodbuildsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10134:`VM`:`AuthServer` {`ip`:"10.4.4.165", `name`:"sayumdevauthsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10135:`VM`:`DBServer` {`ip`:"10.4.4.173", `name`:"sayumtestdbsrv1", `os`:"Microsoft Windows Server 2012 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10136:`VM`:`AppServer` {`ip`:"10.4.4.164", `name`:"dcdemoappsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10137:`VM`:`TimeServer` {`ip`:"10.4.4.216", `name`:"dctesttimesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10138:`VM`:`AppServer`:`DocServer` {`ip`:"10.4.4.159", `name`:"saydocdevappsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"DocMgmnt"})
create (_10139:`VM`:`AppServer` {`ip`:"10.4.4.1", `name`:"billdevappsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"Billing"})
create (_10140:`VM`:`DiscServer` {`ip`:"10.4.4.3", `name`:"ummdis1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10141:`VM` {`ip`:"10.4.4.132", `name`:"dctestspikesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10142:`VM` {`ip`:"10.4.4.134", `name`:"dctestspikesrv2", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10143:`VM`:`AuthServer` {`ip`:"10.4.4.166", `name`:"sayumtestauthsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10144:`VM`:`AppServer` {`ip`:"10.4.4.5", `name`:"cldapp1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"Client"})
create (_10145:`VM`:`DBMonitor` {`ip`:"10.4.4.35", `name`:"dctestdbmonitorsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10146:`VM`:`BuildServer`:`DevOpsServer` {`ip`:"10.4.4.15", `name`:"bldlog1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"Billing"})
create (_10147:`VM`:`DevOpsServer`:`ChefServer` {`ip`:"10.4.5.42", `name`:"dcprodchefsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10148:`VM`:`DevOpsServer`:`VagrantServer`:`ChefServer` {`name`:"vagrantchefnode", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOff", `system`:"UNKNOWN"})
create (_10149:`VM`:`QServer` {`ip`:"10.4.4.106", `name`:"dcdevqueuesrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10150:`Queue` {`name`:"DEVL_actuarial", `system`:"PAS", `type`:"RabbitMQ"})
create (_10151:`Queue` {`name`:"DEVL_bi", `system`:"PAS", `type`:"RabbitMQ"})
create (_10152:`Queue` {`name`:"DEVL_crm", `system`:"PAS", `type`:"RabbitMQ"})
create (_10153:`Queue` {`name`:"DEVL_docman", `system`:"PAS", `type`:"RabbitMQ"})
create (_10154:`Queue` {`name`:"DEVL_reporting", `system`:"PAS", `type`:"RabbitMQ"})
create (_10155:`Queue` {`name`:"DEVL_test_q", `system`:"PAS", `type`:"RabbitMQ"})
create (_10156:`VM`:`DBServer` {`ip`:"10.4.4.171", `name`:"sayumdemodbsrv1", `os`:"Microsoft Windows Server 2012 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10157:`VM`:`AppServer` {`ip`:"10.4.4.62", `name`:"dcdevappsrv1", `os`:"Ubuntu Linux (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10158:`VM` {`ip`:"10.4.4.91", `name`:"saysandboxnosqlsrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10159:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.21", `name`:"dcdemomongosrv1", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10160:`VM`:`DBServer`:`MongoDB` {`ip`:"10.4.4.22", `name`:"dcdemomongosrv2", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOn", `system`:"PAS"})
create (_10161:`VM`:`DevOpsServer`:`ChefServer` {`name`:"dcrhchefnode", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOff", `system`:"PAS"})
create (_10162:`VM`:`DevOpsServer`:`ChefServer` {`ip`:"10.10.1.96", `name`:"dcchefnode", `os`:"Red Hat Enterprise Linux 6 (64-bit)", `status`:"poweredOff", `system`:"PAS"})
create (_10163:`VM`:`DBServer` {`ip`:"10.4.4.172", `name`:"sayumdevdbsrv1", `os`:"Microsoft Windows Server 2012 (64-bit)", `status`:"poweredOn", `system`:"UserMgmnt"})
create (_10164:`VM`:`AppServer` {`name`:"rbDEMOappsrv1", `status`:"unknown", `system`:"Ratabase"})
create (_10165:`ExternalService` {`name`:"Test_LexisNexis", `system`:"PAS"})
create (_10166:`ExternalService` {`name`:"Prod_LexisNexis", `system`:"PAS"})
create (_10167:`ExternalService` {`name`:"SmartyStreets", `system`:"PAS"})
create (_10168:`Scheduler` {`name`:"Test_ESP", `system`:"ESP"})
create (_10169:`Scheduler` {`name`:"Prod_ESP", `system`:"ESP"})
create (_10170:`LPAR` {`name`:"DEVL"})
create (_10171:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10172:`RESTRequest` {`name`:"getDEMO/policy/{policyId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10173:`RESTEndPoint` {`name`:"DEMO/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10174:`RESTRequest` {`name`:"getDEMO/renewal", `summary`:"Get renewal information", `system`:"PAS", `tag`:["renewal"]})
create (_10175:`RESTEndPoint` {`name`:"DEMO/balance", `system`:"PAS", `version`:"1.0.0"})
create (_10176:`RESTRequest` {`name`:"getDEMO/balance", `summary`:"Query for the balance of written premium", `system`:"PAS", `tag`:["balance"]})
create (_10177:`RESTEndPoint` {`name`:"DEMO/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10178:`RESTRequest` {`name`:"getDEMO/vehicles", `summary`:"Get vehicle information by VIN", `system`:"PAS", `tag`:["vehicle"]})
create (_10179:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10180:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Quote", `system`:"PAS", `tag`:["quote"]})
create (_10181:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}/{expectedPolicyRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10182:`RESTRequest` {`name`:"putDEMO/policy/{policyId}/{expectedPolicyRevision}", `summary`:"Submit a change quote", `system`:"PAS", `tag`:["policy"]})
create (_10183:`RESTEndPoint` {`name`:"DEMO/vehicle/trims", `system`:"PAS", `version`:"1.0.0"})
create (_10184:`RESTRequest` {`name`:"getDEMO/vehicle/trims", `summary`:"Get a list of vehicle trims", `system`:"PAS", `tag`:["vehicle"]})
create (_10185:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10186:`RESTRequest` {`name`:"deleteDEMO/quote/{quoteId}/{streamRevision}/vehicles", `summary`:"Delete multiple vehicles", `system`:"PAS", `tag`:["quote"]})
create (_10187:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `system`:"PAS", `version`:"1.0.0"})
create (_10188:`RESTRequest` {`name`:"putDEMO/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `summary`:"Overwrite the address on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10189:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `system`:"PAS", `version`:"1.0.0"})
create (_10190:`RESTRequest` {`name`:"putDEMO/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `summary`:"Overwrite driver violations on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10191:`RESTEndPoint` {`name`:"DEMO/vehicle/years", `system`:"PAS", `version`:"1.0.0"})
create (_10192:`RESTRequest` {`name`:"getDEMO/vehicle/years", `summary`:"Get a list of vehicle years", `system`:"PAS", `tag`:["vehicle"]})
create (_10193:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10194:`RESTRequest` {`name`:"putDEMO/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10195:`RESTRequest` {`name`:"deleteDEMO/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10196:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10197:`RESTRequest` {`name`:"deleteDEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `summary`:"Delete the Finance Company on a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10198:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10199:`RESTRequest` {`name`:"putDEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10200:`RESTRequest` {`name`:"deleteDEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10201:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10202:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new Driver", `system`:"PAS", `tag`:["quote"]})
create (_10203:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10204:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a quote and store premiums", `system`:"PAS", `tag`:["quote"]})
create (_10205:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/package", `system`:"PAS", `version`:"1.0.0"})
create (_10206:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/package", `summary`:"Preview a rate from a quote package", `system`:"PAS", `tag`:["quote"]})
create (_10207:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10208:`RESTRequest` {`name`:"putDEMO/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10209:`RESTRequest` {`name`:"deleteDEMO/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10210:`RESTEndPoint` {`name`:"DEMO/renewal/{renewalId}/{expectedStreamRevision}/accept", `system`:"PAS", `version`:"1.0.0"})
create (_10211:`RESTRequest` {`name`:"postDEMO/renewal/{renewalId}/{expectedStreamRevision}/accept", `summary`:"Accepts a renewal", `system`:"PAS", `tag`:["renewal"]})
create (_10212:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10213:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10214:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10215:`RESTRequest` {`name`:"postDEMO/changeQuote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["changeQuote"]})
create (_10216:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}/{streamRevision}/changeQuote", `system`:"PAS", `version`:"1.0.0"})
create (_10217:`RESTRequest` {`name`:"postDEMO/policy/{policyId}/{streamRevision}/changeQuote", `summary`:"Create a new policy change quote", `system`:"PAS", `tag`:["policy"]})
create (_10218:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10219:`RESTRequest` {`name`:"postDEMO/changeQuote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new driver", `system`:"PAS", `tag`:["changeQuote"]})
create (_10220:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10221:`RESTRequest` {`name`:"patchDEMO/changeQuote/{quoteId}/{streamRevision}", `summary`:"Update Change Quote data", `system`:"PAS", `tag`:["changeQuote"]})
create (_10222:`RESTEndPoint` {`name`:"DEMO/policies/summary", `system`:"PAS", `version`:"1.0.0"})
create (_10223:`RESTRequest` {`name`:"getDEMO/policies/summary", `summary`:"Search for policy summaries", `system`:"PAS", `tag`:["policy"]})
create (_10224:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}/renew", `system`:"PAS", `version`:"1.0.0"})
create (_10225:`RESTRequest` {`name`:"putDEMO/policy/{policyId}/renew", `summary`:"Renew a policy", `system`:"PAS", `tag`:["policy"]})
create (_10226:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/stop", `system`:"PAS", `version`:"1.0.0"})
create (_10227:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/stop", `summary`:"Stop the quote", `system`:"PAS", `tag`:["quote"]})
create (_10228:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/auth", `system`:"PAS", `version`:"1.0.0"})
create (_10229:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/auth", `summary`:"Generate quote auth token", `system`:"PAS", `tag`:["quote"]})
create (_10230:`RESTEndPoint` {`name`:"DEMO/renewal/{renewalId}", `system`:"PAS", `version`:"1.0.0"})
create (_10231:`RESTRequest` {`name`:"getDEMO/renewal/{renewalId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["renewal"]})
create (_10232:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10233:`RESTRequest` {`name`:"putDEMO/quote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10234:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/drivers", `system`:"PAS", `version`:"1.0.0"})
create (_10235:`RESTRequest` {`name`:"deleteDEMO/quote/{quoteId}/{streamRevision}/drivers", `summary`:"Delete multiple drivers", `system`:"PAS", `tag`:["quote"]})
create (_10236:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10237:`RESTRequest` {`name`:"putDEMO/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10238:`RESTRequest` {`name`:"deleteDEMO/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver", `system`:"PAS", `tag`:["quote"]})
create (_10239:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10240:`RESTRequest` {`name`:"postDEMO/changeQuote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a changeQuote and store premiums", `system`:"PAS", `tag`:["changeQuote"]})
create (_10241:`RESTEndPoint` {`name`:"DEMO/quote/validCoverages", `system`:"PAS", `version`:"1.0.0"})
create (_10242:`RESTRequest` {`name`:"getDEMO/quote/validCoverages", `summary`:"Get a list of valid coverages", `system`:"PAS", `tag`:["coverages"]})
create (_10243:`RESTEndPoint` {`name`:"DEMO/vehicle/models", `system`:"PAS", `version`:"1.0.0"})
create (_10244:`RESTRequest` {`name`:"getDEMO/vehicle/models", `summary`:"Get a list of vehicle models", `system`:"PAS", `tag`:["vehicle"]})
create (_10245:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10246:`RESTRequest` {`name`:"postDEMO/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10247:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/drivingRecord", `system`:"PAS", `version`:"1.0.0"})
create (_10248:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/drivingRecord", `summary`:"Order MVR and CLUE for drivers on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10249:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10250:`RESTRequest` {`name`:"postDEMO/policy/{policyId}/renewal", `summary`:"Create a renewal", `system`:"PAS", `tag`:["policy"]})
create (_10251:`RESTEndPoint` {`name`:"DEMO/address", `system`:"PAS", `version`:"1.0.0"})
create (_10252:`RESTRequest` {`name`:"getDEMO/address", `summary`:"Validate address", `system`:"PAS", `tag`:["address"]})
create (_10253:`RESTEndPoint` {`name`:"DEMO/quote", `system`:"PAS", `version`:"1.0.0"})
create (_10254:`RESTRequest` {`name`:"postDEMO/quote", `summary`:"Create a new quote", `system`:"PAS", `tag`:["quote"]})
create (_10255:`RESTRequest` {`name`:"getDEMO/quote", `summary`:"Search for a quote", `system`:"PAS", `tag`:["quote"]})
create (_10256:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10257:`RESTRequest` {`name`:"patchDEMO/quote/{quoteId}/{streamRevision}", `summary`:"Update quote data", `system`:"PAS", `tag`:["quote"]})
create (_10258:`RESTEndPoint` {`name`:"DEMO/policy", `system`:"PAS", `version`:"1.0.0"})
create (_10259:`RESTRequest` {`name`:"postDEMO/policy", `summary`:"Create a new policy from the given quote", `system`:"PAS", `tag`:["policy"]})
create (_10260:`RESTRequest` {`name`:"getDEMO/policy", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10261:`RESTEndPoint` {`name`:"DEMO/vehicle/makes", `system`:"PAS", `version`:"1.0.0"})
create (_10262:`RESTRequest` {`name`:"getDEMO/vehicle/makes", `summary`:"Get a list of vehicle makes", `system`:"PAS", `tag`:["vehicle"]})
create (_10263:`RESTEndPoint` {`name`:"DEMO/policy/{policyId}/history", `system`:"PAS", `version`:"1.0.0"})
create (_10264:`RESTRequest` {`name`:"getDEMO/policy/{policyId}/history", `summary`:"Get list of policy events", `system`:"PAS", `tag`:["policy"]})
create (_10265:`RESTEndPoint` {`name`:"DEMO/changeQuote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10266:`RESTRequest` {`name`:"putDEMO/changeQuote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10267:`RESTEndPoint` {`name`:"DEMO/quote/{quoteId}/{streamRevision}/policyNumber", `system`:"PAS", `version`:"1.0.0"})
create (_10268:`RESTRequest` {`name`:"postDEMO/quote/{quoteId}/{streamRevision}/policyNumber", `summary`:"Generate a policy number for the quote", `system`:"PAS", `tag`:["quote"]})
create (_10269:`DBMonitor`:`CloudServer` {`name`:"MongoMonitor", `system`:"PAS"})
create (_10270:`Mainframe` {`name`:"Mainframe", `type`:"Hardware"})
create (_10271:`Queue` {`name`:"DEMO_DIRECT.BACKOFFICE.PREMIUM", `system`:"BackOffice", `type`:"WSMQ"})
create (_10272:`Queue` {`name`:"DEMO_DIRECT.REPORTING.POLICYMSGS", `system`:"Reporting", `type`:"WSMQ"})
create (_10273:`QServer` {`name`:"MQM1", `type`:"WSMQ"})
create (_10274:`Program` {`name`:"DEMO_Act_Bridge", `system`:"PAS"})
create (_10275:`Program` {`name`:"DEMO_Rpt_Bridge", `system`:"PAS"})
create (_10276:`Queue` {`name`:"DEMO_Direct.BackOffice.ClaimTopics", `system`:"Claims", `type`:"WSMQ"})
create (_10277:`Queue` {`name`:"DEMO_Direct.BackOffice.Error", `system`:"BackOffice", `type`:"WSMQ"})
create (_10278:`Program` {`name`:"DEMO_DPAS", `system`:"BackOffice", `type`:"CICS"})
create (_10279:`CICSEnv` {`name`:"CICSDM", `system`:"BackOffice", `type`:"CICS"})
create (_10280:`DBServer` {`name`:"DBOMM001", `system`:"BackOffice", `type`:"DB/2"})
create (_10281:`DB2Env` {`name`:"DSNT"})
create (_10282:`VM`:`AppServer` {`name`:"rbTESTappsrv1", `status`:"unknown", `system`:"Ratabase"})
create (_10283:`RESTEndPoint` {`name`:"TEST/policy/{policyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10284:`RESTRequest` {`name`:"getTEST/policy/{policyId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10285:`RESTEndPoint` {`name`:"TEST/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10286:`RESTRequest` {`name`:"getTEST/renewal", `summary`:"Get renewal information", `system`:"PAS", `tag`:["renewal"]})
create (_10287:`RESTEndPoint` {`name`:"TEST/balance", `system`:"PAS", `version`:"1.0.0"})
create (_10288:`RESTRequest` {`name`:"getTEST/balance", `summary`:"Query for the balance of written premium", `system`:"PAS", `tag`:["balance"]})
create (_10289:`RESTEndPoint` {`name`:"TEST/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10290:`RESTRequest` {`name`:"getTEST/vehicles", `summary`:"Get vehicle information by VIN", `system`:"PAS", `tag`:["vehicle"]})
create (_10291:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10292:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Quote", `system`:"PAS", `tag`:["quote"]})
create (_10293:`RESTEndPoint` {`name`:"TEST/policy/{policyId}/{expectedPolicyRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10294:`RESTRequest` {`name`:"putTEST/policy/{policyId}/{expectedPolicyRevision}", `summary`:"Submit a change quote", `system`:"PAS", `tag`:["policy"]})
create (_10295:`RESTEndPoint` {`name`:"TEST/vehicle/trims", `system`:"PAS", `version`:"1.0.0"})
create (_10296:`RESTRequest` {`name`:"getTEST/vehicle/trims", `summary`:"Get a list of vehicle trims", `system`:"PAS", `tag`:["vehicle"]})
create (_10297:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10298:`RESTRequest` {`name`:"deleteTEST/quote/{quoteId}/{streamRevision}/vehicles", `summary`:"Delete multiple vehicles", `system`:"PAS", `tag`:["quote"]})
create (_10299:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `system`:"PAS", `version`:"1.0.0"})
create (_10300:`RESTRequest` {`name`:"putTEST/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `summary`:"Overwrite the address on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10301:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `system`:"PAS", `version`:"1.0.0"})
create (_10302:`RESTRequest` {`name`:"putTEST/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `summary`:"Overwrite driver violations on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10303:`RESTEndPoint` {`name`:"TEST/vehicle/years", `system`:"PAS", `version`:"1.0.0"})
create (_10304:`RESTRequest` {`name`:"getTEST/vehicle/years", `summary`:"Get a list of vehicle years", `system`:"PAS", `tag`:["vehicle"]})
create (_10305:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10306:`RESTRequest` {`name`:"putTEST/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10307:`RESTRequest` {`name`:"deleteTEST/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10308:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10309:`RESTRequest` {`name`:"deleteTEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `summary`:"Delete the Finance Company on a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10310:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10311:`RESTRequest` {`name`:"putTEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10312:`RESTRequest` {`name`:"deleteTEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10313:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10314:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new Driver", `system`:"PAS", `tag`:["quote"]})
create (_10315:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10316:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a quote and store premiums", `system`:"PAS", `tag`:["quote"]})
create (_10317:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/package", `system`:"PAS", `version`:"1.0.0"})
create (_10318:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/package", `summary`:"Preview a rate from a quote package", `system`:"PAS", `tag`:["quote"]})
create (_10319:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10320:`RESTRequest` {`name`:"putTEST/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10321:`RESTRequest` {`name`:"deleteTEST/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10322:`RESTEndPoint` {`name`:"TEST/renewal/{renewalId}/{expectedStreamRevision}/accept", `system`:"PAS", `version`:"1.0.0"})
create (_10323:`RESTRequest` {`name`:"postTEST/renewal/{renewalId}/{expectedStreamRevision}/accept", `summary`:"Accepts a renewal", `system`:"PAS", `tag`:["renewal"]})
create (_10324:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10325:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10326:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10327:`RESTRequest` {`name`:"postTEST/changeQuote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["changeQuote"]})
create (_10328:`RESTEndPoint` {`name`:"TEST/policy/{policyId}/{streamRevision}/changeQuote", `system`:"PAS", `version`:"1.0.0"})
create (_10329:`RESTRequest` {`name`:"postTEST/policy/{policyId}/{streamRevision}/changeQuote", `summary`:"Create a new policy change quote", `system`:"PAS", `tag`:["policy"]})
create (_10330:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10331:`RESTRequest` {`name`:"postTEST/changeQuote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new driver", `system`:"PAS", `tag`:["changeQuote"]})
create (_10332:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10333:`RESTRequest` {`name`:"patchTEST/changeQuote/{quoteId}/{streamRevision}", `summary`:"Update Change Quote data", `system`:"PAS", `tag`:["changeQuote"]})
create (_10334:`RESTEndPoint` {`name`:"TEST/policies/summary", `system`:"PAS", `version`:"1.0.0"})
create (_10335:`RESTRequest` {`name`:"getTEST/policies/summary", `summary`:"Search for policy summaries", `system`:"PAS", `tag`:["policy"]})
create (_10336:`RESTEndPoint` {`name`:"TEST/policy/{policyId}/renew", `system`:"PAS", `version`:"1.0.0"})
create (_10337:`RESTRequest` {`name`:"putTEST/policy/{policyId}/renew", `summary`:"Renew a policy", `system`:"PAS", `tag`:["policy"]})
create (_10338:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/stop", `system`:"PAS", `version`:"1.0.0"})
create (_10339:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/stop", `summary`:"Stop the quote", `system`:"PAS", `tag`:["quote"]})
create (_10340:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/auth", `system`:"PAS", `version`:"1.0.0"})
create (_10341:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/auth", `summary`:"Generate quote auth token", `system`:"PAS", `tag`:["quote"]})
create (_10342:`RESTEndPoint` {`name`:"TEST/renewal/{renewalId}", `system`:"PAS", `version`:"1.0.0"})
create (_10343:`RESTRequest` {`name`:"getTEST/renewal/{renewalId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["renewal"]})
create (_10344:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10345:`RESTRequest` {`name`:"putTEST/quote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10346:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/drivers", `system`:"PAS", `version`:"1.0.0"})
create (_10347:`RESTRequest` {`name`:"deleteTEST/quote/{quoteId}/{streamRevision}/drivers", `summary`:"Delete multiple drivers", `system`:"PAS", `tag`:["quote"]})
create (_10348:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10349:`RESTRequest` {`name`:"putTEST/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10350:`RESTRequest` {`name`:"deleteTEST/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver", `system`:"PAS", `tag`:["quote"]})
create (_10351:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10352:`RESTRequest` {`name`:"postTEST/changeQuote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a changeQuote and store premiums", `system`:"PAS", `tag`:["changeQuote"]})
create (_10353:`RESTEndPoint` {`name`:"TEST/quote/validCoverages", `system`:"PAS", `version`:"1.0.0"})
create (_10354:`RESTRequest` {`name`:"getTEST/quote/validCoverages", `summary`:"Get a list of valid coverages", `system`:"PAS", `tag`:["coverages"]})
create (_10355:`RESTEndPoint` {`name`:"TEST/vehicle/models", `system`:"PAS", `version`:"1.0.0"})
create (_10356:`RESTRequest` {`name`:"getTEST/vehicle/models", `summary`:"Get a list of vehicle models", `system`:"PAS", `tag`:["vehicle"]})
create (_10357:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10358:`RESTRequest` {`name`:"postTEST/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10359:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/drivingRecord", `system`:"PAS", `version`:"1.0.0"})
create (_10360:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/drivingRecord", `summary`:"Order MVR and CLUE for drivers on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10361:`RESTEndPoint` {`name`:"TEST/policy/{policyId}/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10362:`RESTRequest` {`name`:"postTEST/policy/{policyId}/renewal", `summary`:"Create a renewal", `system`:"PAS", `tag`:["policy"]})
create (_10363:`RESTEndPoint` {`name`:"TEST/address", `system`:"PAS", `version`:"1.0.0"})
create (_10364:`RESTRequest` {`name`:"getTEST/address", `summary`:"Validate address", `system`:"PAS", `tag`:["address"]})
create (_10365:`RESTEndPoint` {`name`:"TEST/quote", `system`:"PAS", `version`:"1.0.0"})
create (_10366:`RESTRequest` {`name`:"postTEST/quote", `summary`:"Create a new quote", `system`:"PAS", `tag`:["quote"]})
create (_10367:`RESTRequest` {`name`:"getTEST/quote", `summary`:"Search for a quote", `system`:"PAS", `tag`:["quote"]})
create (_10368:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10369:`RESTRequest` {`name`:"patchTEST/quote/{quoteId}/{streamRevision}", `summary`:"Update quote data", `system`:"PAS", `tag`:["quote"]})
create (_10370:`RESTEndPoint` {`name`:"TEST/policy", `system`:"PAS", `version`:"1.0.0"})
create (_10371:`RESTRequest` {`name`:"postTEST/policy", `summary`:"Create a new policy from the given quote", `system`:"PAS", `tag`:["policy"]})
create (_10372:`RESTRequest` {`name`:"getTEST/policy", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10373:`RESTEndPoint` {`name`:"TEST/vehicle/makes", `system`:"PAS", `version`:"1.0.0"})
create (_10374:`RESTRequest` {`name`:"getTEST/vehicle/makes", `summary`:"Get a list of vehicle makes", `system`:"PAS", `tag`:["vehicle"]})
create (_10375:`RESTEndPoint` {`name`:"TEST/policy/{policyId}/history", `system`:"PAS", `version`:"1.0.0"})
create (_10376:`RESTRequest` {`name`:"getTEST/policy/{policyId}/history", `summary`:"Get list of policy events", `system`:"PAS", `tag`:["policy"]})
create (_10377:`RESTEndPoint` {`name`:"TEST/changeQuote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10378:`RESTRequest` {`name`:"putTEST/changeQuote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10379:`RESTEndPoint` {`name`:"TEST/quote/{quoteId}/{streamRevision}/policyNumber", `system`:"PAS", `version`:"1.0.0"})
create (_10380:`RESTRequest` {`name`:"postTEST/quote/{quoteId}/{streamRevision}/policyNumber", `summary`:"Generate a policy number for the quote", `system`:"PAS", `tag`:["quote"]})
create (_10381:`Queue` {`name`:"TEST_DIRECT.BACKOFFICE.PREMIUM", `system`:"BackOffice", `type`:"WSMQ"})
create (_10382:`Queue` {`name`:"TEST_DIRECT.REPORTING.POLICYMSGS", `system`:"Reporting", `type`:"WSMQ"})
create (_10383:`QServer` {`name`:"MQT1", `type`:"WSMQ"})
create (_10384:`Program` {`name`:"TEST_Act_Bridge", `system`:"PAS"})
create (_10385:`Program` {`name`:"TEST_Rpt_Bridge", `system`:"PAS"})
create (_10386:`Queue` {`name`:"TEST_Direct.BackOffice.ClaimTopics", `system`:"Claims", `type`:"WSMQ"})
create (_10387:`Queue` {`name`:"TEST_Direct.BackOffice.Error", `system`:"BackOffice", `type`:"WSMQ"})
create (_10388:`Program` {`name`:"TEST_DPAS", `system`:"BackOffice", `type`:"CICS"})
create (_10389:`CICSEnv` {`name`:"CICSDT", `system`:"BackOffice", `type`:"CICS"})
create (_10390:`DBServer` {`name`:"DBOMT001", `system`:"BackOffice", `type`:"DB/2"})
create (_10391:`VM`:`AppServer` {`name`:"rbPRODappsrv1", `status`:"unknown", `system`:"Ratabase"})
create (_10392:`LPAR` {`name`:"PROD"})
create (_10393:`Queue` {`name`:"PROD_DIRECT.BACKOFFICE.PREMIUM", `system`:"BackOffice", `type`:"WSMQ"})
create (_10394:`Queue` {`name`:"PROD_DIRECT.REPORTING.POLICYMSGS", `system`:"Reporting", `type`:"WSMQ"})
create (_10395:`QServer` {`name`:"MQP1", `type`:"WSMQ"})
create (_10396:`Program` {`name`:"PROD_Act_Bridge", `system`:"PAS"})
create (_10397:`Program` {`name`:"PROD_Rpt_Bridge", `system`:"PAS"})
create (_10398:`Queue` {`name`:"PROD_actuarial"})
create (_10399:`Queue` {`name`:"PROD_reporting"})
create (_10400:`Queue` {`name`:"PROD_Direct.BackOffice.ClaimTopics", `system`:"Claims", `type`:"WSMQ"})
create (_10401:`Queue` {`name`:"PROD_Direct.BackOffice.Error", `system`:"BackOffice", `type`:"WSMQ"})
create (_10402:`Program` {`name`:"PROD_DPAS", `system`:"BackOffice", `type`:"CICS"})
create (_10403:`CICSEnv` {`name`:"CICSDP", `system`:"BackOffice", `type`:"CICS"})
create (_10404:`DBServer` {`name`:"DBOMP001", `system`:"BackOffice", `type`:"DB/2"})
create (_10405:`DB2Env` {`name`:"DSN"})
create (_10406:`VM`:`AppServer` {`name`:"rbDEVLappsrv1", `status`:"unknown", `system`:"Ratabase"})
create (_10407:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10408:`RESTRequest` {`name`:"getDEVL/policy/{policyId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10409:`RESTEndPoint` {`name`:"DEVL/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10410:`RESTRequest` {`name`:"getDEVL/renewal", `summary`:"Get renewal information", `system`:"PAS", `tag`:["renewal"]})
create (_10411:`RESTEndPoint` {`name`:"DEVL/balance", `system`:"PAS", `version`:"1.0.0"})
create (_10412:`RESTRequest` {`name`:"getDEVL/balance", `summary`:"Query for the balance of written premium", `system`:"PAS", `tag`:["balance"]})
create (_10413:`RESTEndPoint` {`name`:"DEVL/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10414:`RESTRequest` {`name`:"getDEVL/vehicles", `summary`:"Get vehicle information by VIN", `system`:"PAS", `tag`:["vehicle"]})
create (_10415:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10416:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Quote", `system`:"PAS", `tag`:["quote"]})
create (_10417:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}/{expectedPolicyRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10418:`RESTRequest` {`name`:"putDEVL/policy/{policyId}/{expectedPolicyRevision}", `summary`:"Submit a change quote", `system`:"PAS", `tag`:["policy"]})
create (_10419:`RESTEndPoint` {`name`:"DEVL/vehicle/trims", `system`:"PAS", `version`:"1.0.0"})
create (_10420:`RESTRequest` {`name`:"getDEVL/vehicle/trims", `summary`:"Get a list of vehicle trims", `system`:"PAS", `tag`:["vehicle"]})
create (_10421:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/vehicles", `system`:"PAS", `version`:"1.0.0"})
create (_10422:`RESTRequest` {`name`:"deleteDEVL/quote/{quoteId}/{streamRevision}/vehicles", `summary`:"Delete multiple vehicles", `system`:"PAS", `tag`:["quote"]})
create (_10423:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `system`:"PAS", `version`:"1.0.0"})
create (_10424:`RESTRequest` {`name`:"putDEVL/changeQuote/{quoteId}/{streamRevision}/address/{addressId}", `summary`:"Overwrite the address on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10425:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `system`:"PAS", `version`:"1.0.0"})
create (_10426:`RESTRequest` {`name`:"putDEVL/quote/{quoteId}/{streamRevision}/driver/{driverId}/violations", `summary`:"Overwrite driver violations on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10427:`RESTEndPoint` {`name`:"DEVL/vehicle/years", `system`:"PAS", `version`:"1.0.0"})
create (_10428:`RESTRequest` {`name`:"getDEVL/vehicle/years", `summary`:"Get a list of vehicle years", `system`:"PAS", `tag`:["vehicle"]})
create (_10429:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10430:`RESTRequest` {`name`:"putDEVL/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10431:`RESTRequest` {`name`:"deleteDEVL/changeQuote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver on a change quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10432:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `system`:"PAS", `version`:"1.0.0"})
create (_10433:`RESTRequest` {`name`:"deleteDEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany/{financeCompanyId}", `summary`:"Delete the Finance Company on a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10434:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10435:`RESTRequest` {`name`:"putDEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10436:`RESTRequest` {`name`:"deleteDEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle on a quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10437:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10438:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new Driver", `system`:"PAS", `tag`:["quote"]})
create (_10439:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10440:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a quote and store premiums", `system`:"PAS", `tag`:["quote"]})
create (_10441:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/package", `system`:"PAS", `version`:"1.0.0"})
create (_10442:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/package", `summary`:"Preview a rate from a quote package", `system`:"PAS", `tag`:["quote"]})
create (_10443:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `system`:"PAS", `version`:"1.0.0"})
create (_10444:`RESTRequest` {`name`:"putDEVL/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Overwrite a vehicle on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10445:`RESTRequest` {`name`:"deleteDEVL/quote/{quoteId}/{streamRevision}/vehicle/{vehicleId}", `summary`:"Delete a vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10446:`RESTEndPoint` {`name`:"DEVL/renewal/{renewalId}/{expectedStreamRevision}/accept", `system`:"PAS", `version`:"1.0.0"})
create (_10447:`RESTRequest` {`name`:"postDEVL/renewal/{renewalId}/{expectedStreamRevision}/accept", `summary`:"Accepts a renewal", `system`:"PAS", `tag`:["renewal"]})
create (_10448:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10449:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["quote"]})
create (_10450:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/vehicle", `system`:"PAS", `version`:"1.0.0"})
create (_10451:`RESTRequest` {`name`:"postDEVL/changeQuote/{quoteId}/{streamRevision}/vehicle", `summary`:"Add a new vehicle", `system`:"PAS", `tag`:["changeQuote"]})
create (_10452:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}/{streamRevision}/changeQuote", `system`:"PAS", `version`:"1.0.0"})
create (_10453:`RESTRequest` {`name`:"postDEVL/policy/{policyId}/{streamRevision}/changeQuote", `summary`:"Create a new policy change quote", `system`:"PAS", `tag`:["policy"]})
create (_10454:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/driver", `system`:"PAS", `version`:"1.0.0"})
create (_10455:`RESTRequest` {`name`:"postDEVL/changeQuote/{quoteId}/{streamRevision}/driver", `summary`:"Add a new driver", `system`:"PAS", `tag`:["changeQuote"]})
create (_10456:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10457:`RESTRequest` {`name`:"patchDEVL/changeQuote/{quoteId}/{streamRevision}", `summary`:"Update Change Quote data", `system`:"PAS", `tag`:["changeQuote"]})
create (_10458:`RESTEndPoint` {`name`:"DEVL/policies/summary", `system`:"PAS", `version`:"1.0.0"})
create (_10459:`RESTRequest` {`name`:"getDEVL/policies/summary", `summary`:"Search for policy summaries", `system`:"PAS", `tag`:["policy"]})
create (_10460:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}/renew", `system`:"PAS", `version`:"1.0.0"})
create (_10461:`RESTRequest` {`name`:"putDEVL/policy/{policyId}/renew", `summary`:"Renew a policy", `system`:"PAS", `tag`:["policy"]})
create (_10462:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/stop", `system`:"PAS", `version`:"1.0.0"})
create (_10463:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/stop", `summary`:"Stop the quote", `system`:"PAS", `tag`:["quote"]})
create (_10464:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/auth", `system`:"PAS", `version`:"1.0.0"})
create (_10465:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/auth", `summary`:"Generate quote auth token", `system`:"PAS", `tag`:["quote"]})
create (_10466:`RESTEndPoint` {`name`:"DEVL/renewal/{renewalId}", `system`:"PAS", `version`:"1.0.0"})
create (_10467:`RESTRequest` {`name`:"getDEVL/renewal/{renewalId}", `summary`:"Get policy information", `system`:"PAS", `tag`:["renewal"]})
create (_10468:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10469:`RESTRequest` {`name`:"putDEVL/quote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10470:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/drivers", `system`:"PAS", `version`:"1.0.0"})
create (_10471:`RESTRequest` {`name`:"deleteDEVL/quote/{quoteId}/{streamRevision}/drivers", `summary`:"Delete multiple drivers", `system`:"PAS", `tag`:["quote"]})
create (_10472:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/driver/{driverId}", `system`:"PAS", `version`:"1.0.0"})
create (_10473:`RESTRequest` {`name`:"putDEVL/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Overwrite a driver on a quote", `system`:"PAS", `tag`:["quote"]})
create (_10474:`RESTRequest` {`name`:"deleteDEVL/quote/{quoteId}/{streamRevision}/driver/{driverId}", `summary`:"Delete a driver", `system`:"PAS", `tag`:["quote"]})
create (_10475:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/rate", `system`:"PAS", `version`:"1.0.0"})
create (_10476:`RESTRequest` {`name`:"postDEVL/changeQuote/{quoteId}/{streamRevision}/rate", `summary`:"Rate a changeQuote and store premiums", `system`:"PAS", `tag`:["changeQuote"]})
create (_10477:`RESTEndPoint` {`name`:"DEVL/quote/validCoverages", `system`:"PAS", `version`:"1.0.0"})
create (_10478:`RESTRequest` {`name`:"getDEVL/quote/validCoverages", `summary`:"Get a list of valid coverages", `system`:"PAS", `tag`:["coverages"]})
create (_10479:`RESTEndPoint` {`name`:"DEVL/vehicle/models", `system`:"PAS", `version`:"1.0.0"})
create (_10480:`RESTRequest` {`name`:"getDEVL/vehicle/models", `summary`:"Get a list of vehicle models", `system`:"PAS", `tag`:["vehicle"]})
create (_10481:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `system`:"PAS", `version`:"1.0.0"})
create (_10482:`RESTRequest` {`name`:"postDEVL/changeQuote/{quoteId}/{streamRevision}/vehicle/{vehicleId}/financeCompany", `summary`:"Attach Finance Company to a vehicle on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10483:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/drivingRecord", `system`:"PAS", `version`:"1.0.0"})
create (_10484:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/drivingRecord", `summary`:"Order MVR and CLUE for drivers on the quote", `system`:"PAS", `tag`:["quote"]})
create (_10485:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}/renewal", `system`:"PAS", `version`:"1.0.0"})
create (_10486:`RESTRequest` {`name`:"postDEVL/policy/{policyId}/renewal", `summary`:"Create a renewal", `system`:"PAS", `tag`:["policy"]})
create (_10487:`RESTEndPoint` {`name`:"DEVL/address", `system`:"PAS", `version`:"1.0.0"})
create (_10488:`RESTRequest` {`name`:"getDEVL/address", `summary`:"Validate address", `system`:"PAS", `tag`:["address"]})
create (_10489:`RESTEndPoint` {`name`:"DEVL/quote", `system`:"PAS", `version`:"1.0.0"})
create (_10490:`RESTRequest` {`name`:"postDEVL/quote", `summary`:"Create a new quote", `system`:"PAS", `tag`:["quote"]})
create (_10491:`RESTRequest` {`name`:"getDEVL/quote", `summary`:"Search for a quote", `system`:"PAS", `tag`:["quote"]})
create (_10492:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}", `system`:"PAS", `version`:"1.0.0"})
create (_10493:`RESTRequest` {`name`:"patchDEVL/quote/{quoteId}/{streamRevision}", `summary`:"Update quote data", `system`:"PAS", `tag`:["quote"]})
create (_10494:`RESTEndPoint` {`name`:"DEVL/policy", `system`:"PAS", `version`:"1.0.0"})
create (_10495:`RESTRequest` {`name`:"postDEVL/policy", `summary`:"Create a new policy from the given quote", `system`:"PAS", `tag`:["policy"]})
create (_10496:`RESTRequest` {`name`:"getDEVL/policy", `summary`:"Get policy information", `system`:"PAS", `tag`:["policy"]})
create (_10497:`RESTEndPoint` {`name`:"DEVL/vehicle/makes", `system`:"PAS", `version`:"1.0.0"})
create (_10498:`RESTRequest` {`name`:"getDEVL/vehicle/makes", `summary`:"Get a list of vehicle makes", `system`:"PAS", `tag`:["vehicle"]})
create (_10499:`RESTEndPoint` {`name`:"DEVL/policy/{policyId}/history", `system`:"PAS", `version`:"1.0.0"})
create (_10500:`RESTRequest` {`name`:"getDEVL/policy/{policyId}/history", `summary`:"Get list of policy events", `system`:"PAS", `tag`:["policy"]})
create (_10501:`RESTEndPoint` {`name`:"DEVL/changeQuote/{quoteId}/{streamRevision}/coverages", `system`:"PAS", `version`:"1.0.0"})
create (_10502:`RESTRequest` {`name`:"putDEVL/changeQuote/{quoteId}/{streamRevision}/coverages", `summary`:"Overwrite all coverages on the Change Quote", `system`:"PAS", `tag`:["changeQuote"]})
create (_10503:`RESTEndPoint` {`name`:"DEVL/quote/{quoteId}/{streamRevision}/policyNumber", `system`:"PAS", `version`:"1.0.0"})
create (_10504:`RESTRequest` {`name`:"postDEVL/quote/{quoteId}/{streamRevision}/policyNumber", `summary`:"Generate a policy number for the quote", `system`:"PAS", `tag`:["quote"]})
create (_10505:`Queue` {`name`:"DEVL_DIRECT.BACKOFFICE.PREMIUM", `system`:"BackOffice", `type`:"WSMQ"})
create (_10506:`Queue` {`name`:"DEVL_DIRECT.REPORTING.POLICYMSGS", `system`:"Reporting", `type`:"WSMQ"})
create (_10507:`QServer` {`name`:"MQD1", `type`:"WSMQ"})
create (_10508:`Program` {`name`:"DEVL_Act_Bridge", `system`:"PAS"})
create (_10509:`Program` {`name`:"DEVL_Rpt_Bridge", `system`:"PAS"})
create (_10510:`Queue` {`name`:"DEVL_Direct.BackOffice.ClaimTopics", `system`:"Claims", `type`:"WSMQ"})
create (_10511:`Queue` {`name`:"DEVL_Direct.BackOffice.Error", `system`:"BackOffice", `type`:"WSMQ"})
create (_10512:`Program` {`name`:"DEVL_DPAS", `system`:"BackOffice", `type`:"CICS"})
create (_10513:`CICSEnv` {`name`:"CICSDD", `system`:"BackOffice", `type`:"CICS"})
create (_10514:`DBServer` {`name`:"DBOMD001", `system`:"BackOffice", `type`:"DB/2"})
create _10051-[:`CONNECTS_TO`]->_10060
create _10051-[:`CONNECTS_TO`]->_10061
create _10051-[:`CONNECTS_TO`]->_10062
create _10051-[:`CONNECTS_TO`]->_10052
create _10051-[:`CONNECTS_TO`]->_10055
create _10051-[:`NEEDS`]->_10053
create _10051-[:`NEEDS`]->_10056
create _10051-[:`NEEDS`]->_10054
create _10051-[:`NEEDS`]->_10059
create _10051-[:`NEEDS`]->_10058
create _10052-[:`CONNECTS_TO`]->_10057
create _10052-[:`NEEDS`]->_10053
create _10052-[:`NEEDS`]->_10058
create _10054-[:`NEEDS`]->_10053
create _10054-[:`NEEDS`]->_10058
create _10058-[:`CONNECTS_TO`]->_10057
create _10060-[:`NEEDS`]->_10058
create _10063-[:`NEEDS`]->_10054
create _10063-[:`NEEDS`]->_10058
create _10063-[:`NEEDS`]->_10053
create _10063-[:`NEEDS`]->_10051
create _10064-[:`RUNS_ON`]->_10065
create _10064-[:`RUNS_ON`]->_10066
create _10064-[:`RUNS_ON`]->_10067
create _10068-[:`IS_IN`]->_10069
create _10068-[:`RUNS_ON`]->_10064
create _10070-[:`IS_IN`]->_10071
create _10070-[:`CONNECTS_TO`]->_10145
create _10070-[:`RUNS_ON`]->_10064
create _10072-[:`IS_IN`]->_10073
create _10072-[:`RUNS_ON`]->_10064
create _10074-[:`IS_IN`]->_10071
create _10074-[:`CONNECTS_TO`]->_10145
create _10074-[:`RUNS_ON`]->_10064
create _10075-[:`IS_IN`]->_10071
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.#"}]->_10076
create _10075-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10077
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.ChangeQuoteCreated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.QuoteRated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteCreated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteRated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteStopped"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteSubmitted"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalAccepted"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10078
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10079
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10079
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10079
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCommitReversed"}]->_10080
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10080
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10080
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10080
create _10075-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10080
create _10075-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10081
create _10075-[:`RUNS_ON`]->_10064
create _10076-[:`IS_IN`]->_10071
create _10077-[:`IS_IN`]->_10071
create _10078-[:`IS_IN`]->_10071
create _10079-[:`IS_IN`]->_10071
create _10080-[:`IS_IN`]->_10071
create _10081-[:`IS_IN`]->_10071
create _10082-[:`RUNS_ON`]->_10064
create _10083-[:`IS_IN`]->_10071
create _10083-[:`CONNECTS_TO`]->_10145
create _10083-[:`RUNS_ON`]->_10064
create _10084-[:`IS_IN`]->_10085
create _10084-[:`RUNS_ON`]->_10064
create _10086-[:`IS_IN`]->_10085
create _10086-[:`RUNS_ON`]->_10064
create _10087-[:`RUNS_ON`]->_10064
create _10088-[:`RUNS_ON`]->_10064
create _10089-[:`IS_IN`]->_10085
create _10089-[:`CONNECTS_TO`]->_10269
create _10089-[:`RUNS_ON`]->_10064
create _10090-[:`IS_IN`]->_10069
create _10090-[:`RUNS_ON`]->_10064
create _10091-[:`IS_IN`]->_10085
create _10091-[:`CONNECTS_TO`]->_10269
create _10091-[:`RUNS_ON`]->_10064
create _10092-[:`IS_IN`]->_10085
create _10092-[:`RUNS_ON`]->_10064
create _10093-[:`RUNS_ON`]->_10064
create _10094-[:`IS_IN`]->_10069
create _10094-[:`RUNS_ON`]->_10064
create _10095-[:`IS_IN`]->_10069
create _10095-[:`RUNS_ON`]->_10064
create _10096-[:`IS_IN`]->_10069
create _10096-[:`RUNS_ON`]->_10064
create _10097-[:`IS_IN`]->_10069
create _10097-[:`RUNS_ON`]->_10064
create _10098-[:`IS_IN`]->_10085
create _10098-[:`CONNECTS_TO`]->_10269
create _10098-[:`RUNS_ON`]->_10064
create _10099-[:`IS_IN`]->_10071
create _10099-[:`CONNECTS_TO`]->_10126
create _10099-[:`CONNECTS_TO`]->_10143
create _10099-[:`RUNS_ON`]->_10064
create _10100-[:`IS_IN`]->_10073
create _10100-[:`RUNS_ON`]->_10064
create _10101-[:`IS_IN`]->_10071
create _10101-[:`RUNS_ON`]->_10064
create _10102-[:`IS_IN`]->_10071
create _10102-[:`RUNS_ON`]->_10064
create _10103-[:`IS_IN`]->_10071
create _10103-[:`RUNS_ON`]->_10064
create _10104-[:`IS_IN`]->_10071
create _10104-[:`CONNECTS_TO`]->_10282
create _10104-[:`CONNECTS_TO`]->_10125
create _10104-[:`CONNECTS_TO`]->_10167
create _10104-[:`CONNECTS_TO`]->_10165
create _10104-[:`CONNECTS_TO`]->_10137
create _10104-[:`CONNECTS_TO`]->_10118
create _10104-[:`CONNECTS_TO`]->_10110
create _10104-[:`CONNECTS_TO`]->_10109
create _10104-[:`CONNECTS_TO`]->_10103
create _10104-[:`CONNECTS_TO`]->_10102
create _10104-[:`CONNECTS_TO`]->_10101
create _10104-[:`CONNECTS_TO`]->_10083
create _10104-[:`CONNECTS_TO`]->_10075
create _10104-[:`CONNECTS_TO`]->_10074
create _10104-[:`CONNECTS_TO`]->_10070
create _10104-[:`CONNECTS_TO`]->_10099
create _10104-[:`RUNS_ON`]->_10064
create _10105-[:`IS_IN`]->_10085
create _10105-[:`RUNS_ON`]->_10064
create _10106-[:`IS_IN`]->_10069
create _10106-[:`RUNS_ON`]->_10064
create _10107-[:`IS_IN`]->_10069
create _10107-[:`RUNS_ON`]->_10064
create _10108-[:`IS_IN`]->_10069
create _10108-[:`RUNS_ON`]->_10064
create _10109-[:`IS_IN`]->_10071
create _10109-[:`CONNECTS_TO`]->_10269
create _10109-[:`RUNS_ON`]->_10064
create _10110-[:`IS_IN`]->_10071
create _10110-[:`CONNECTS_TO`]->_10269
create _10110-[:`RUNS_ON`]->_10064
create _10111-[:`IS_IN`]->_10069
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.#"}]->_10112
create _10111-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10113
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.ChangeQuoteCreated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.QuoteRated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteCreated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteRated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteStopped"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteSubmitted"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalAccepted"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10114
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10115
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10115
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10115
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCommitReversed"}]->_10116
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10116
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10116
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10116
create _10111-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10116
create _10111-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10117
create _10111-[:`RUNS_ON`]->_10064
create _10112-[:`IS_IN`]->_10069
create _10113-[:`IS_IN`]->_10069
create _10114-[:`IS_IN`]->_10069
create _10115-[:`IS_IN`]->_10069
create _10116-[:`IS_IN`]->_10069
create _10117-[:`IS_IN`]->_10069
create _10118-[:`IS_IN`]->_10071
create _10118-[:`CONNECTS_TO`]->_10269
create _10118-[:`RUNS_ON`]->_10064
create _10119-[:`IS_IN`]->_10073
create _10119-[:`RUNS_ON`]->_10064
create _10120-[:`IS_IN`]->_10073
create _10120-[:`RUNS_ON`]->_10064
create _10121-[:`IS_IN`]->_10085
create _10121-[:`RUNS_ON`]->_10064
create _10122-[:`IS_IN`]->_10085
create _10122-[:`RUNS_ON`]->_10064
create _10123-[:`IS_IN`]->_10085
create _10123-[:`RUNS_ON`]->_10064
create _10124-[:`IS_IN`]->_10085
create _10124-[:`RUNS_ON`]->_10064
create _10125-[:`IS_IN`]->_10071
create _10125-[:`RUNS_ON`]->_10064
create _10126-[:`IS_IN`]->_10071
create _10126-[:`RUNS_ON`]->_10064
create _10127-[:`IS_IN`]->_10085
create _10127-[:`CONNECTS_TO`]->_10105
create _10127-[:`CONNECTS_TO`]->_10134
create _10127-[:`RUNS_ON`]->_10064
create _10128-[:`IS_IN`]->_10069
create _10128-[:`RUNS_ON`]->_10064
create _10129-[:`IS_IN`]->_10085
create _10129-[:`CONNECTS_TO`]->_10168
create _10129-[:`RUNS_ON`]->_10064
create _10130-[:`IS_IN`]->_10069
create _10130-[:`CONNECTS_TO`]->_10269
create _10130-[:`RUNS_ON`]->_10064
create _10131-[:`IS_IN`]->_10071
create _10131-[:`RUNS_ON`]->_10064
create _10132-[:`IS_IN`]->_10073
create _10132-[:`RUNS_ON`]->_10064
create _10133-[:`IS_IN`]->_10073
create _10133-[:`RUNS_ON`]->_10064
create _10134-[:`IS_IN`]->_10085
create _10134-[:`CONNECTS_TO`]->_10163
create _10134-[:`RUNS_ON`]->_10064
create _10135-[:`IS_IN`]->_10071
create _10135-[:`RUNS_ON`]->_10064
create _10136-[:`IS_IN`]->_10069
create _10136-[:`CONNECTS_TO`]->_10164
create _10136-[:`CONNECTS_TO`]->_10097
create _10136-[:`CONNECTS_TO`]->_10167
create _10136-[:`CONNECTS_TO`]->_10165
create _10136-[:`CONNECTS_TO`]->_10160
create _10136-[:`CONNECTS_TO`]->_10159
create _10136-[:`CONNECTS_TO`]->_10130
create _10136-[:`CONNECTS_TO`]->_10111
create _10136-[:`CONNECTS_TO`]->_10108
create _10136-[:`CONNECTS_TO`]->_10107
create _10136-[:`CONNECTS_TO`]->_10106
create _10136-[:`CONNECTS_TO`]->_10096
create _10136-[:`CONNECTS_TO`]->_10095
create _10136-[:`CONNECTS_TO`]->_10094
create _10136-[:`CONNECTS_TO`]->_10090
create _10136-[:`RUNS_ON`]->_10064
create _10137-[:`IS_IN`]->_10071
create _10137-[:`RUNS_ON`]->_10064
create _10138-[:`IS_IN`]->_10085
create _10138-[:`RUNS_ON`]->_10064
create _10139-[:`IS_IN`]->_10085
create _10139-[:`RUNS_ON`]->_10064
create _10140-[:`IS_IN`]->_10069
create _10140-[:`RUNS_ON`]->_10064
create _10141-[:`IS_IN`]->_10071
create _10141-[:`RUNS_ON`]->_10064
create _10142-[:`IS_IN`]->_10071
create _10142-[:`RUNS_ON`]->_10064
create _10143-[:`IS_IN`]->_10071
create _10143-[:`CONNECTS_TO`]->_10135
create _10143-[:`RUNS_ON`]->_10064
create _10144-[:`IS_IN`]->_10085
create _10144-[:`RUNS_ON`]->_10064
create _10145-[:`IS_IN`]->_10071
create _10145-[:`RUNS_ON`]->_10064
create _10146-[:`IS_IN`]->_10085
create _10146-[:`RUNS_ON`]->_10064
create _10147-[:`IS_IN`]->_10073
create _10147-[:`RUNS_ON`]->_10064
create _10148-[:`RUNS_ON`]->_10064
create _10149-[:`IS_IN`]->_10085
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.#"}]->_10150
create _10149-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10151
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.ChangeQuoteCreated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.changeQuote.QuoteRated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteCreated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteRated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteStopped"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.quote.QuoteSubmitted"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalAccepted"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10152
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10153
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10153
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10153
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCommitReversed"}]->_10154
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyCreated"}]->_10154
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyOverwritten"}]->_10154
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.policy.PolicyRenewed"}]->_10154
create _10149-[:`CONNECTS_TO` {`routing_key`:"policyAdmin.renewal.RenewalCreated"}]->_10154
create _10149-[:`CONNECTS_TO` {`routing_key`:"#"}]->_10155
create _10149-[:`RUNS_ON`]->_10064
create _10150-[:`IS_IN`]->_10085
create _10151-[:`IS_IN`]->_10085
create _10152-[:`IS_IN`]->_10085
create _10153-[:`IS_IN`]->_10085
create _10154-[:`IS_IN`]->_10085
create _10155-[:`IS_IN`]->_10085
create _10156-[:`IS_IN`]->_10069
create _10156-[:`RUNS_ON`]->_10064
create _10157-[:`IS_IN`]->_10085
create _10157-[:`CONNECTS_TO`]->_10406
create _10157-[:`CONNECTS_TO`]->_10144
create _10157-[:`CONNECTS_TO`]->_10167
create _10157-[:`CONNECTS_TO`]->_10165
create _10157-[:`CONNECTS_TO`]->_10149
create _10157-[:`CONNECTS_TO`]->_10129
create _10157-[:`CONNECTS_TO`]->_10124
create _10157-[:`CONNECTS_TO`]->_10123
create _10157-[:`CONNECTS_TO`]->_10122
create _10157-[:`CONNECTS_TO`]->_10121
create _10157-[:`CONNECTS_TO`]->_10098
create _10157-[:`CONNECTS_TO`]->_10092
create _10157-[:`CONNECTS_TO`]->_10091
create _10157-[:`CONNECTS_TO`]->_10089
create _10157-[:`CONNECTS_TO`]->_10086
create _10157-[:`CONNECTS_TO`]->_10084
create _10157-[:`CONNECTS_TO`]->_10127
create _10157-[:`RUNS_ON`]->_10064
create _10158-[:`RUNS_ON`]->_10064
create _10159-[:`IS_IN`]->_10069
create _10159-[:`CONNECTS_TO`]->_10269
create _10159-[:`RUNS_ON`]->_10064
create _10160-[:`IS_IN`]->_10069
create _10160-[:`CONNECTS_TO`]->_10269
create _10160-[:`RUNS_ON`]->_10064
create _10161-[:`RUNS_ON`]->_10064
create _10162-[:`RUNS_ON`]->_10064
create _10163-[:`IS_IN`]->_10085
create _10163-[:`RUNS_ON`]->_10064
create _10164-[:`IS_IN`]->_10069
create _10165-[:`IS_IN`]->_10069
create _10165-[:`IS_IN`]->_10071
create _10165-[:`IS_IN`]->_10085
create _10166-[:`IS_IN`]->_10073
create _10167-[:`IS_IN`]->_10069
create _10167-[:`IS_IN`]->_10071
create _10167-[:`IS_IN`]->_10073
create _10167-[:`IS_IN`]->_10085
create _10168-[:`IS_IN`]->_10069
create _10168-[:`IS_IN`]->_10071
create _10168-[:`IS_IN`]->_10085
create _10168-[:`RUN_ON`]->_10170
create _10169-[:`IS_IN`]->_10073
create _10169-[:`RUN_ON`]->_10392
create _10170-[:`RUNS_ON`]->_10270
create _10171-[:`IS_IN`]->_10069
create _10171-[:`RUNS_ON`]->_10136
create _10171-[:`ALOWS`]->_10172
create _10172-[:`IS_IN`]->_10069
create _10173-[:`IS_IN`]->_10069
create _10173-[:`RUNS_ON`]->_10136
create _10173-[:`ALOWS`]->_10174
create _10174-[:`IS_IN`]->_10069
create _10175-[:`IS_IN`]->_10069
create _10175-[:`RUNS_ON`]->_10136
create _10175-[:`ALOWS`]->_10176
create _10176-[:`IS_IN`]->_10069
create _10177-[:`IS_IN`]->_10069
create _10177-[:`RUNS_ON`]->_10136
create _10177-[:`ALOWS`]->_10178
create _10178-[:`IS_IN`]->_10069
create _10179-[:`IS_IN`]->_10069
create _10179-[:`RUNS_ON`]->_10136
create _10179-[:`ALOWS`]->_10180
create _10180-[:`IS_IN`]->_10069
create _10181-[:`IS_IN`]->_10069
create _10181-[:`RUNS_ON`]->_10136
create _10181-[:`ALOWS`]->_10182
create _10182-[:`IS_IN`]->_10069
create _10183-[:`IS_IN`]->_10069
create _10183-[:`RUNS_ON`]->_10136
create _10183-[:`ALOWS`]->_10184
create _10184-[:`IS_IN`]->_10069
create _10185-[:`IS_IN`]->_10069
create _10185-[:`RUNS_ON`]->_10136
create _10185-[:`ALOWS`]->_10186
create _10186-[:`IS_IN`]->_10069
create _10187-[:`IS_IN`]->_10069
create _10187-[:`RUNS_ON`]->_10136
create _10187-[:`ALOWS`]->_10188
create _10188-[:`IS_IN`]->_10069
create _10189-[:`IS_IN`]->_10069
create _10189-[:`RUNS_ON`]->_10136
create _10189-[:`ALOWS`]->_10190
create _10190-[:`IS_IN`]->_10069
create _10191-[:`IS_IN`]->_10069
create _10191-[:`RUNS_ON`]->_10136
create _10191-[:`ALOWS`]->_10192
create _10192-[:`IS_IN`]->_10069
create _10193-[:`IS_IN`]->_10069
create _10193-[:`RUNS_ON`]->_10136
create _10193-[:`ALOWS`]->_10194
create _10193-[:`ALOWS`]->_10195
create _10194-[:`IS_IN`]->_10069
create _10195-[:`IS_IN`]->_10069
create _10196-[:`IS_IN`]->_10069
create _10196-[:`RUNS_ON`]->_10136
create _10196-[:`ALOWS`]->_10197
create _10197-[:`IS_IN`]->_10069
create _10198-[:`IS_IN`]->_10069
create _10198-[:`RUNS_ON`]->_10136
create _10198-[:`ALOWS`]->_10199
create _10198-[:`ALOWS`]->_10200
create _10199-[:`IS_IN`]->_10069
create _10200-[:`IS_IN`]->_10069
create _10201-[:`IS_IN`]->_10069
create _10201-[:`RUNS_ON`]->_10136
create _10201-[:`ALOWS`]->_10202
create _10202-[:`IS_IN`]->_10069
create _10203-[:`IS_IN`]->_10069
create _10203-[:`RUNS_ON`]->_10136
create _10203-[:`ALOWS`]->_10204
create _10204-[:`IS_IN`]->_10069
create _10205-[:`IS_IN`]->_10069
create _10205-[:`RUNS_ON`]->_10136
create _10205-[:`ALOWS`]->_10206
create _10206-[:`IS_IN`]->_10069
create _10207-[:`IS_IN`]->_10069
create _10207-[:`RUNS_ON`]->_10136
create _10207-[:`ALOWS`]->_10208
create _10207-[:`ALOWS`]->_10209
create _10208-[:`IS_IN`]->_10069
create _10209-[:`IS_IN`]->_10069
create _10210-[:`IS_IN`]->_10069
create _10210-[:`RUNS_ON`]->_10136
create _10210-[:`ALOWS`]->_10211
create _10211-[:`IS_IN`]->_10069
create _10212-[:`IS_IN`]->_10069
create _10212-[:`RUNS_ON`]->_10136
create _10212-[:`ALOWS`]->_10213
create _10213-[:`IS_IN`]->_10069
create _10214-[:`IS_IN`]->_10069
create _10214-[:`RUNS_ON`]->_10136
create _10214-[:`ALOWS`]->_10215
create _10215-[:`IS_IN`]->_10069
create _10216-[:`IS_IN`]->_10069
create _10216-[:`RUNS_ON`]->_10136
create _10216-[:`ALOWS`]->_10217
create _10217-[:`IS_IN`]->_10069
create _10218-[:`IS_IN`]->_10069
create _10218-[:`RUNS_ON`]->_10136
create _10218-[:`ALOWS`]->_10219
create _10219-[:`IS_IN`]->_10069
create _10220-[:`IS_IN`]->_10069
create _10220-[:`RUNS_ON`]->_10136
create _10220-[:`ALOWS`]->_10221
create _10221-[:`IS_IN`]->_10069
create _10222-[:`IS_IN`]->_10069
create _10222-[:`RUNS_ON`]->_10136
create _10222-[:`ALOWS`]->_10223
create _10223-[:`IS_IN`]->_10069
create _10224-[:`IS_IN`]->_10069
create _10224-[:`RUNS_ON`]->_10136
create _10224-[:`ALOWS`]->_10225
create _10225-[:`IS_IN`]->_10069
create _10226-[:`IS_IN`]->_10069
create _10226-[:`RUNS_ON`]->_10136
create _10226-[:`ALOWS`]->_10227
create _10227-[:`IS_IN`]->_10069
create _10228-[:`IS_IN`]->_10069
create _10228-[:`RUNS_ON`]->_10136
create _10228-[:`ALOWS`]->_10229
create _10229-[:`IS_IN`]->_10069
create _10230-[:`IS_IN`]->_10069
create _10230-[:`RUNS_ON`]->_10136
create _10230-[:`ALOWS`]->_10231
create _10231-[:`IS_IN`]->_10069
create _10232-[:`IS_IN`]->_10069
create _10232-[:`RUNS_ON`]->_10136
create _10232-[:`ALOWS`]->_10233
create _10233-[:`IS_IN`]->_10069
create _10234-[:`IS_IN`]->_10069
create _10234-[:`RUNS_ON`]->_10136
create _10234-[:`ALOWS`]->_10235
create _10235-[:`IS_IN`]->_10069
create _10236-[:`IS_IN`]->_10069
create _10236-[:`RUNS_ON`]->_10136
create _10236-[:`ALOWS`]->_10237
create _10236-[:`ALOWS`]->_10238
create _10237-[:`IS_IN`]->_10069
create _10238-[:`IS_IN`]->_10069
create _10239-[:`IS_IN`]->_10069
create _10239-[:`RUNS_ON`]->_10136
create _10239-[:`ALOWS`]->_10240
create _10240-[:`IS_IN`]->_10069
create _10241-[:`IS_IN`]->_10069
create _10241-[:`RUNS_ON`]->_10136
create _10241-[:`ALOWS`]->_10242
create _10242-[:`IS_IN`]->_10069
create _10243-[:`IS_IN`]->_10069
create _10243-[:`RUNS_ON`]->_10136
create _10243-[:`ALOWS`]->_10244
create _10244-[:`IS_IN`]->_10069
create _10245-[:`IS_IN`]->_10069
create _10245-[:`RUNS_ON`]->_10136
create _10245-[:`ALOWS`]->_10246
create _10246-[:`IS_IN`]->_10069
create _10247-[:`IS_IN`]->_10069
create _10247-[:`RUNS_ON`]->_10136
create _10247-[:`ALOWS`]->_10248
create _10248-[:`IS_IN`]->_10069
create _10249-[:`IS_IN`]->_10069
create _10249-[:`RUNS_ON`]->_10136
create _10249-[:`ALOWS`]->_10250
create _10250-[:`IS_IN`]->_10069
create _10251-[:`IS_IN`]->_10069
create _10251-[:`RUNS_ON`]->_10136
create _10251-[:`ALOWS`]->_10252
create _10252-[:`IS_IN`]->_10069
create _10253-[:`IS_IN`]->_10069
create _10253-[:`RUNS_ON`]->_10136
create _10253-[:`ALOWS`]->_10254
create _10253-[:`ALOWS`]->_10255
create _10254-[:`IS_IN`]->_10069
create _10255-[:`IS_IN`]->_10069
create _10256-[:`IS_IN`]->_10069
create _10256-[:`RUNS_ON`]->_10136
create _10256-[:`ALOWS`]->_10257
create _10257-[:`IS_IN`]->_10069
create _10258-[:`IS_IN`]->_10069
create _10258-[:`RUNS_ON`]->_10136
create _10258-[:`ALOWS`]->_10259
create _10258-[:`ALOWS`]->_10260
create _10259-[:`IS_IN`]->_10069
create _10260-[:`IS_IN`]->_10069
create _10261-[:`IS_IN`]->_10069
create _10261-[:`RUNS_ON`]->_10136
create _10261-[:`ALOWS`]->_10262
create _10262-[:`IS_IN`]->_10069
create _10263-[:`IS_IN`]->_10069
create _10263-[:`RUNS_ON`]->_10136
create _10263-[:`ALOWS`]->_10264
create _10264-[:`IS_IN`]->_10069
create _10265-[:`IS_IN`]->_10069
create _10265-[:`RUNS_ON`]->_10136
create _10265-[:`ALOWS`]->_10266
create _10266-[:`IS_IN`]->_10069
create _10267-[:`IS_IN`]->_10069
create _10267-[:`RUNS_ON`]->_10136
create _10267-[:`ALOWS`]->_10268
create _10268-[:`IS_IN`]->_10069
create _10269-[:`IS_IN`]->_10069
create _10269-[:`IS_IN`]->_10071
create _10269-[:`IS_IN`]->_10073
create _10269-[:`IS_IN`]->_10085
create _10271-[:`IS_IN`]->_10069
create _10271-[:`RUNS_ON`]->_10273
create _10272-[:`IS_IN`]->_10069
create _10272-[:`RUNS_ON`]->_10273
create _10273-[:`IS_IN`]->_10069
create _10273-[:`RUNS_ON`]->_10170
create _10274-[:`IS_IN`]->_10069
create _10274-[:`CONNECTS_TO`]->_10112
create _10274-[:`CONNECTS_TO`]->_10271
create _10274-[:`RUNS_ON`]->_10111
create _10275-[:`IS_IN`]->_10069
create _10275-[:`CONNECTS_TO`]->_10116
create _10275-[:`CONNECTS_TO`]->_10272
create _10275-[:`RUNS_ON`]->_10111
create _10276-[:`IS_IN`]->_10069
create _10276-[:`RUNS_ON`]->_10273
create _10277-[:`IS_IN`]->_10069
create _10277-[:`RUNS_ON`]->_10273
create _10278-[:`IS_IN`]->_10069
create _10278-[:`CONNECTS_TO`]->_10271
create _10278-[:`CONNECTS_TO`]->_10280
create _10278-[:`RUNS_ON`]->_10279
create _10279-[:`IS_IN`]->_10069
create _10279-[:`RUNS_ON`]->_10170
create _10280-[:`IS_IN`]->_10069
create _10280-[:`RUNS_ON`]->_10281
create _10281-[:`RUNS_ON`]->_10170
create _10282-[:`IS_IN`]->_10071
create _10283-[:`IS_IN`]->_10071
create _10283-[:`RUNS_ON`]->_10104
create _10283-[:`ALOWS`]->_10284
create _10284-[:`IS_IN`]->_10071
create _10285-[:`IS_IN`]->_10071
create _10285-[:`RUNS_ON`]->_10104
create _10285-[:`ALOWS`]->_10286
create _10286-[:`IS_IN`]->_10071
create _10287-[:`IS_IN`]->_10071
create _10287-[:`RUNS_ON`]->_10104
create _10287-[:`ALOWS`]->_10288
create _10288-[:`IS_IN`]->_10071
create _10289-[:`IS_IN`]->_10071
create _10289-[:`RUNS_ON`]->_10104
create _10289-[:`ALOWS`]->_10290
create _10290-[:`IS_IN`]->_10071
create _10291-[:`IS_IN`]->_10071
create _10291-[:`RUNS_ON`]->_10104
create _10291-[:`ALOWS`]->_10292
create _10292-[:`IS_IN`]->_10071
create _10293-[:`IS_IN`]->_10071
create _10293-[:`RUNS_ON`]->_10104
create _10293-[:`ALOWS`]->_10294
create _10294-[:`IS_IN`]->_10071
create _10295-[:`IS_IN`]->_10071
create _10295-[:`RUNS_ON`]->_10104
create _10295-[:`ALOWS`]->_10296
create _10296-[:`IS_IN`]->_10071
create _10297-[:`IS_IN`]->_10071
create _10297-[:`RUNS_ON`]->_10104
create _10297-[:`ALOWS`]->_10298
create _10298-[:`IS_IN`]->_10071
create _10299-[:`IS_IN`]->_10071
create _10299-[:`RUNS_ON`]->_10104
create _10299-[:`ALOWS`]->_10300
create _10300-[:`IS_IN`]->_10071
create _10301-[:`IS_IN`]->_10071
create _10301-[:`RUNS_ON`]->_10104
create _10301-[:`ALOWS`]->_10302
create _10302-[:`IS_IN`]->_10071
create _10303-[:`IS_IN`]->_10071
create _10303-[:`RUNS_ON`]->_10104
create _10303-[:`ALOWS`]->_10304
create _10304-[:`IS_IN`]->_10071
create _10305-[:`IS_IN`]->_10071
create _10305-[:`RUNS_ON`]->_10104
create _10305-[:`ALOWS`]->_10306
create _10305-[:`ALOWS`]->_10307
create _10306-[:`IS_IN`]->_10071
create _10307-[:`IS_IN`]->_10071
create _10308-[:`IS_IN`]->_10071
create _10308-[:`RUNS_ON`]->_10104
create _10308-[:`ALOWS`]->_10309
create _10309-[:`IS_IN`]->_10071
create _10310-[:`IS_IN`]->_10071
create _10310-[:`RUNS_ON`]->_10104
create _10310-[:`ALOWS`]->_10311
create _10310-[:`ALOWS`]->_10312
create _10311-[:`IS_IN`]->_10071
create _10312-[:`IS_IN`]->_10071
create _10313-[:`IS_IN`]->_10071
create _10313-[:`RUNS_ON`]->_10104
create _10313-[:`ALOWS`]->_10314
create _10314-[:`IS_IN`]->_10071
create _10315-[:`IS_IN`]->_10071
create _10315-[:`RUNS_ON`]->_10104
create _10315-[:`ALOWS`]->_10316
create _10316-[:`IS_IN`]->_10071
create _10317-[:`IS_IN`]->_10071
create _10317-[:`RUNS_ON`]->_10104
create _10317-[:`ALOWS`]->_10318
create _10318-[:`IS_IN`]->_10071
create _10319-[:`IS_IN`]->_10071
create _10319-[:`RUNS_ON`]->_10104
create _10319-[:`ALOWS`]->_10320
create _10319-[:`ALOWS`]->_10321
create _10320-[:`IS_IN`]->_10071
create _10321-[:`IS_IN`]->_10071
create _10322-[:`IS_IN`]->_10071
create _10322-[:`RUNS_ON`]->_10104
create _10322-[:`ALOWS`]->_10323
create _10323-[:`IS_IN`]->_10071
create _10324-[:`IS_IN`]->_10071
create _10324-[:`RUNS_ON`]->_10104
create _10324-[:`ALOWS`]->_10325
create _10325-[:`IS_IN`]->_10071
create _10326-[:`IS_IN`]->_10071
create _10326-[:`RUNS_ON`]->_10104
create _10326-[:`ALOWS`]->_10327
create _10327-[:`IS_IN`]->_10071
create _10328-[:`IS_IN`]->_10071
create _10328-[:`RUNS_ON`]->_10104
create _10328-[:`ALOWS`]->_10329
create _10329-[:`IS_IN`]->_10071
create _10330-[:`IS_IN`]->_10071
create _10330-[:`RUNS_ON`]->_10104
create _10330-[:`ALOWS`]->_10331
create _10331-[:`IS_IN`]->_10071
create _10332-[:`IS_IN`]->_10071
create _10332-[:`RUNS_ON`]->_10104
create _10332-[:`ALOWS`]->_10333
create _10333-[:`IS_IN`]->_10071
create _10334-[:`IS_IN`]->_10071
create _10334-[:`RUNS_ON`]->_10104
create _10334-[:`ALOWS`]->_10335
create _10335-[:`IS_IN`]->_10071
create _10336-[:`IS_IN`]->_10071
create _10336-[:`RUNS_ON`]->_10104
create _10336-[:`ALOWS`]->_10337
create _10337-[:`IS_IN`]->_10071
create _10338-[:`IS_IN`]->_10071
create _10338-[:`RUNS_ON`]->_10104
create _10338-[:`ALOWS`]->_10339
create _10339-[:`IS_IN`]->_10071
create _10340-[:`IS_IN`]->_10071
create _10340-[:`RUNS_ON`]->_10104
create _10340-[:`ALOWS`]->_10341
create _10341-[:`IS_IN`]->_10071
create _10342-[:`IS_IN`]->_10071
create _10342-[:`RUNS_ON`]->_10104
create _10342-[:`ALOWS`]->_10343
create _10343-[:`IS_IN`]->_10071
create _10344-[:`IS_IN`]->_10071
create _10344-[:`RUNS_ON`]->_10104
create _10344-[:`ALOWS`]->_10345
create _10345-[:`IS_IN`]->_10071
create _10346-[:`IS_IN`]->_10071
create _10346-[:`RUNS_ON`]->_10104
create _10346-[:`ALOWS`]->_10347
create _10347-[:`IS_IN`]->_10071
create _10348-[:`IS_IN`]->_10071
create _10348-[:`RUNS_ON`]->_10104
create _10348-[:`ALOWS`]->_10349
create _10348-[:`ALOWS`]->_10350
create _10349-[:`IS_IN`]->_10071
create _10350-[:`IS_IN`]->_10071
create _10351-[:`IS_IN`]->_10071
create _10351-[:`RUNS_ON`]->_10104
create _10351-[:`ALOWS`]->_10352
create _10352-[:`IS_IN`]->_10071
create _10353-[:`IS_IN`]->_10071
create _10353-[:`RUNS_ON`]->_10104
create _10353-[:`ALOWS`]->_10354
create _10354-[:`IS_IN`]->_10071
create _10355-[:`IS_IN`]->_10071
create _10355-[:`RUNS_ON`]->_10104
create _10355-[:`ALOWS`]->_10356
create _10356-[:`IS_IN`]->_10071
create _10357-[:`IS_IN`]->_10071
create _10357-[:`RUNS_ON`]->_10104
create _10357-[:`ALOWS`]->_10358
create _10358-[:`IS_IN`]->_10071
create _10359-[:`IS_IN`]->_10071
create _10359-[:`RUNS_ON`]->_10104
create _10359-[:`ALOWS`]->_10360
create _10360-[:`IS_IN`]->_10071
create _10361-[:`IS_IN`]->_10071
create _10361-[:`RUNS_ON`]->_10104
create _10361-[:`ALOWS`]->_10362
create _10362-[:`IS_IN`]->_10071
create _10363-[:`IS_IN`]->_10071
create _10363-[:`RUNS_ON`]->_10104
create _10363-[:`ALOWS`]->_10364
create _10364-[:`IS_IN`]->_10071
create _10365-[:`IS_IN`]->_10071
create _10365-[:`RUNS_ON`]->_10104
create _10365-[:`ALOWS`]->_10366
create _10365-[:`ALOWS`]->_10367
create _10366-[:`IS_IN`]->_10071
create _10367-[:`IS_IN`]->_10071
create _10368-[:`IS_IN`]->_10071
create _10368-[:`RUNS_ON`]->_10104
create _10368-[:`ALOWS`]->_10369
create _10369-[:`IS_IN`]->_10071
create _10370-[:`IS_IN`]->_10071
create _10370-[:`RUNS_ON`]->_10104
create _10370-[:`ALOWS`]->_10371
create _10370-[:`ALOWS`]->_10372
create _10371-[:`IS_IN`]->_10071
create _10372-[:`IS_IN`]->_10071
create _10373-[:`IS_IN`]->_10071
create _10373-[:`RUNS_ON`]->_10104
create _10373-[:`ALOWS`]->_10374
create _10374-[:`IS_IN`]->_10071
create _10375-[:`IS_IN`]->_10071
create _10375-[:`RUNS_ON`]->_10104
create _10375-[:`ALOWS`]->_10376
create _10376-[:`IS_IN`]->_10071
create _10377-[:`IS_IN`]->_10071
create _10377-[:`RUNS_ON`]->_10104
create _10377-[:`ALOWS`]->_10378
create _10378-[:`IS_IN`]->_10071
create _10379-[:`IS_IN`]->_10071
create _10379-[:`RUNS_ON`]->_10104
create _10379-[:`ALOWS`]->_10380
create _10380-[:`IS_IN`]->_10071
create _10381-[:`IS_IN`]->_10071
create _10381-[:`RUNS_ON`]->_10383
create _10382-[:`IS_IN`]->_10071
create _10382-[:`RUNS_ON`]->_10383
create _10383-[:`IS_IN`]->_10071
create _10383-[:`RUNS_ON`]->_10170
create _10384-[:`IS_IN`]->_10071
create _10384-[:`CONNECTS_TO`]->_10076
create _10384-[:`CONNECTS_TO`]->_10381
create _10384-[:`RUNS_ON`]->_10075
create _10385-[:`IS_IN`]->_10071
create _10385-[:`CONNECTS_TO`]->_10080
create _10385-[:`CONNECTS_TO`]->_10382
create _10385-[:`RUNS_ON`]->_10075
create _10386-[:`IS_IN`]->_10071
create _10386-[:`RUNS_ON`]->_10383
create _10387-[:`IS_IN`]->_10071
create _10387-[:`RUNS_ON`]->_10383
create _10388-[:`IS_IN`]->_10071
create _10388-[:`CONNECTS_TO`]->_10381
create _10388-[:`CONNECTS_TO`]->_10390
create _10388-[:`RUNS_ON`]->_10389
create _10389-[:`IS_IN`]->_10071
create _10389-[:`RUNS_ON`]->_10170
create _10390-[:`IS_IN`]->_10071
create _10390-[:`RUNS_ON`]->_10281
create _10391-[:`IS_IN`]->_10073
create _10392-[:`RUNS_ON`]->_10270
create _10393-[:`IS_IN`]->_10073
create _10393-[:`RUNS_ON`]->_10395
create _10394-[:`IS_IN`]->_10073
create _10394-[:`RUNS_ON`]->_10395
create _10395-[:`IS_IN`]->_10073
create _10395-[:`RUNS_ON`]->_10392
create _10396-[:`IS_IN`]->_10073
create _10396-[:`CONNECTS_TO`]->_10398
create _10396-[:`CONNECTS_TO`]->_10393
create _10397-[:`IS_IN`]->_10073
create _10397-[:`CONNECTS_TO`]->_10399
create _10397-[:`CONNECTS_TO`]->_10394
create _10400-[:`IS_IN`]->_10073
create _10400-[:`RUNS_ON`]->_10395
create _10401-[:`IS_IN`]->_10073
create _10401-[:`RUNS_ON`]->_10395
create _10402-[:`IS_IN`]->_10073
create _10402-[:`CONNECTS_TO`]->_10393
create _10402-[:`CONNECTS_TO`]->_10404
create _10402-[:`RUNS_ON`]->_10403
create _10403-[:`IS_IN`]->_10073
create _10403-[:`RUNS_ON`]->_10392
create _10404-[:`IS_IN`]->_10073
create _10404-[:`RUNS_ON`]->_10405
create _10405-[:`RUNS_ON`]->_10392
create _10406-[:`IS_IN`]->_10085
create _10407-[:`IS_IN`]->_10085
create _10407-[:`RUNS_ON`]->_10157
create _10407-[:`ALOWS`]->_10408
create _10408-[:`IS_IN`]->_10085
create _10409-[:`IS_IN`]->_10085
create _10409-[:`RUNS_ON`]->_10157
create _10409-[:`ALOWS`]->_10410
create _10410-[:`IS_IN`]->_10085
create _10411-[:`IS_IN`]->_10085
create _10411-[:`RUNS_ON`]->_10157
create _10411-[:`ALOWS`]->_10412
create _10412-[:`IS_IN`]->_10085
create _10413-[:`IS_IN`]->_10085
create _10413-[:`RUNS_ON`]->_10157
create _10413-[:`ALOWS`]->_10414
create _10414-[:`IS_IN`]->_10085
create _10415-[:`IS_IN`]->_10085
create _10415-[:`RUNS_ON`]->_10157
create _10415-[:`ALOWS`]->_10416
create _10416-[:`IS_IN`]->_10085
create _10417-[:`IS_IN`]->_10085
create _10417-[:`RUNS_ON`]->_10157
create _10417-[:`ALOWS`]->_10418
create _10418-[:`IS_IN`]->_10085
create _10419-[:`IS_IN`]->_10085
create _10419-[:`RUNS_ON`]->_10157
create _10419-[:`ALOWS`]->_10420
create _10420-[:`IS_IN`]->_10085
create _10421-[:`IS_IN`]->_10085
create _10421-[:`RUNS_ON`]->_10157
create _10421-[:`ALOWS`]->_10422
create _10422-[:`IS_IN`]->_10085
create _10423-[:`IS_IN`]->_10085
create _10423-[:`RUNS_ON`]->_10157
create _10423-[:`ALOWS`]->_10424
create _10424-[:`IS_IN`]->_10085
create _10425-[:`IS_IN`]->_10085
create _10425-[:`RUNS_ON`]->_10157
create _10425-[:`ALOWS`]->_10426
create _10426-[:`IS_IN`]->_10085
create _10427-[:`IS_IN`]->_10085
create _10427-[:`RUNS_ON`]->_10157
create _10427-[:`ALOWS`]->_10428
create _10428-[:`IS_IN`]->_10085
create _10429-[:`IS_IN`]->_10085
create _10429-[:`RUNS_ON`]->_10157
create _10429-[:`ALOWS`]->_10430
create _10429-[:`ALOWS`]->_10431
create _10430-[:`IS_IN`]->_10085
create _10431-[:`IS_IN`]->_10085
create _10432-[:`IS_IN`]->_10085
create _10432-[:`RUNS_ON`]->_10157
create _10432-[:`ALOWS`]->_10433
create _10433-[:`IS_IN`]->_10085
create _10434-[:`IS_IN`]->_10085
create _10434-[:`RUNS_ON`]->_10157
create _10434-[:`ALOWS`]->_10435
create _10434-[:`ALOWS`]->_10436
create _10435-[:`IS_IN`]->_10085
create _10436-[:`IS_IN`]->_10085
create _10437-[:`IS_IN`]->_10085
create _10437-[:`RUNS_ON`]->_10157
create _10437-[:`ALOWS`]->_10438
create _10438-[:`IS_IN`]->_10085
create _10439-[:`IS_IN`]->_10085
create _10439-[:`RUNS_ON`]->_10157
create _10439-[:`ALOWS`]->_10440
create _10440-[:`IS_IN`]->_10085
create _10441-[:`IS_IN`]->_10085
create _10441-[:`RUNS_ON`]->_10157
create _10441-[:`ALOWS`]->_10442
create _10442-[:`IS_IN`]->_10085
create _10443-[:`IS_IN`]->_10085
create _10443-[:`RUNS_ON`]->_10157
create _10443-[:`ALOWS`]->_10444
create _10443-[:`ALOWS`]->_10445
create _10444-[:`IS_IN`]->_10085
create _10445-[:`IS_IN`]->_10085
create _10446-[:`IS_IN`]->_10085
create _10446-[:`RUNS_ON`]->_10157
create _10446-[:`ALOWS`]->_10447
create _10447-[:`IS_IN`]->_10085
create _10448-[:`IS_IN`]->_10085
create _10448-[:`RUNS_ON`]->_10157
create _10448-[:`ALOWS`]->_10449
create _10449-[:`IS_IN`]->_10085
create _10450-[:`IS_IN`]->_10085
create _10450-[:`RUNS_ON`]->_10157
create _10450-[:`ALOWS`]->_10451
create _10451-[:`IS_IN`]->_10085
create _10452-[:`IS_IN`]->_10085
create _10452-[:`RUNS_ON`]->_10157
create _10452-[:`ALOWS`]->_10453
create _10453-[:`IS_IN`]->_10085
create _10454-[:`IS_IN`]->_10085
create _10454-[:`RUNS_ON`]->_10157
create _10454-[:`ALOWS`]->_10455
create _10455-[:`IS_IN`]->_10085
create _10456-[:`IS_IN`]->_10085
create _10456-[:`RUNS_ON`]->_10157
create _10456-[:`ALOWS`]->_10457
create _10457-[:`IS_IN`]->_10085
create _10458-[:`IS_IN`]->_10085
create _10458-[:`RUNS_ON`]->_10157
create _10458-[:`ALOWS`]->_10459
create _10459-[:`IS_IN`]->_10085
create _10460-[:`IS_IN`]->_10085
create _10460-[:`RUNS_ON`]->_10157
create _10460-[:`ALOWS`]->_10461
create _10461-[:`IS_IN`]->_10085
create _10462-[:`IS_IN`]->_10085
create _10462-[:`RUNS_ON`]->_10157
create _10462-[:`ALOWS`]->_10463
create _10463-[:`IS_IN`]->_10085
create _10464-[:`IS_IN`]->_10085
create _10464-[:`RUNS_ON`]->_10157
create _10464-[:`ALOWS`]->_10465
create _10465-[:`IS_IN`]->_10085
create _10466-[:`IS_IN`]->_10085
create _10466-[:`RUNS_ON`]->_10157
create _10466-[:`ALOWS`]->_10467
create _10467-[:`IS_IN`]->_10085
create _10468-[:`IS_IN`]->_10085
create _10468-[:`RUNS_ON`]->_10157
create _10468-[:`ALOWS`]->_10469
create _10469-[:`IS_IN`]->_10085
create _10470-[:`IS_IN`]->_10085
create _10470-[:`RUNS_ON`]->_10157
create _10470-[:`ALOWS`]->_10471
create _10471-[:`IS_IN`]->_10085
create _10472-[:`IS_IN`]->_10085
create _10472-[:`RUNS_ON`]->_10157
create _10472-[:`ALOWS`]->_10473
create _10472-[:`ALOWS`]->_10474
create _10473-[:`IS_IN`]->_10085
create _10474-[:`IS_IN`]->_10085
create _10475-[:`IS_IN`]->_10085
create _10475-[:`RUNS_ON`]->_10157
create _10475-[:`ALOWS`]->_10476
create _10476-[:`IS_IN`]->_10085
create _10477-[:`IS_IN`]->_10085
create _10477-[:`RUNS_ON`]->_10157
create _10477-[:`ALOWS`]->_10478
create _10478-[:`IS_IN`]->_10085
create _10479-[:`IS_IN`]->_10085
create _10479-[:`RUNS_ON`]->_10157
create _10479-[:`ALOWS`]->_10480
create _10480-[:`IS_IN`]->_10085
create _10481-[:`IS_IN`]->_10085
create _10481-[:`RUNS_ON`]->_10157
create _10481-[:`ALOWS`]->_10482
create _10482-[:`IS_IN`]->_10085
create _10483-[:`IS_IN`]->_10085
create _10483-[:`RUNS_ON`]->_10157
create _10483-[:`ALOWS`]->_10484
create _10484-[:`IS_IN`]->_10085
create _10485-[:`IS_IN`]->_10085
create _10485-[:`RUNS_ON`]->_10157
create _10485-[:`ALOWS`]->_10486
create _10486-[:`IS_IN`]->_10085
create _10487-[:`IS_IN`]->_10085
create _10487-[:`RUNS_ON`]->_10157
create _10487-[:`ALOWS`]->_10488
create _10488-[:`IS_IN`]->_10085
create _10489-[:`IS_IN`]->_10085
create _10489-[:`RUNS_ON`]->_10157
create _10489-[:`ALOWS`]->_10490
create _10489-[:`ALOWS`]->_10491
create _10490-[:`IS_IN`]->_10085
create _10491-[:`IS_IN`]->_10085
create _10492-[:`IS_IN`]->_10085
create _10492-[:`RUNS_ON`]->_10157
create _10492-[:`ALOWS`]->_10493
create _10493-[:`IS_IN`]->_10085
create _10494-[:`IS_IN`]->_10085
create _10494-[:`RUNS_ON`]->_10157
create _10494-[:`ALOWS`]->_10495
create _10494-[:`ALOWS`]->_10496
create _10495-[:`IS_IN`]->_10085
create _10496-[:`IS_IN`]->_10085
create _10497-[:`IS_IN`]->_10085
create _10497-[:`RUNS_ON`]->_10157
create _10497-[:`ALOWS`]->_10498
create _10498-[:`IS_IN`]->_10085
create _10499-[:`IS_IN`]->_10085
create _10499-[:`RUNS_ON`]->_10157
create _10499-[:`ALOWS`]->_10500
create _10500-[:`IS_IN`]->_10085
create _10501-[:`IS_IN`]->_10085
create _10501-[:`RUNS_ON`]->_10157
create _10501-[:`ALOWS`]->_10502
create _10502-[:`IS_IN`]->_10085
create _10503-[:`IS_IN`]->_10085
create _10503-[:`RUNS_ON`]->_10157
create _10503-[:`ALOWS`]->_10504
create _10504-[:`IS_IN`]->_10085
create _10505-[:`IS_IN`]->_10085
create _10505-[:`RUNS_ON`]->_10507
create _10506-[:`IS_IN`]->_10085
create _10506-[:`RUNS_ON`]->_10507
create _10507-[:`IS_IN`]->_10085
create _10507-[:`RUNS_ON`]->_10170
create _10508-[:`IS_IN`]->_10085
create _10508-[:`CONNECTS_TO`]->_10150
create _10508-[:`CONNECTS_TO`]->_10505
create _10508-[:`RUNS_ON`]->_10149
create _10509-[:`IS_IN`]->_10085
create _10509-[:`CONNECTS_TO`]->_10154
create _10509-[:`CONNECTS_TO`]->_10506
create _10509-[:`RUNS_ON`]->_10149
create _10510-[:`IS_IN`]->_10085
create _10510-[:`RUNS_ON`]->_10507
create _10511-[:`IS_IN`]->_10085
create _10511-[:`RUNS_ON`]->_10507
create _10512-[:`IS_IN`]->_10085
create _10512-[:`CONNECTS_TO`]->_10505
create _10512-[:`CONNECTS_TO`]->_10514
create _10512-[:`RUNS_ON`]->_10513
create _10513-[:`IS_IN`]->_10085
create _10513-[:`RUNS_ON`]->_10170
create _10514-[:`IS_IN`]->_10085
create _10514-[:`RUNS_ON`]->_10281
;
commit
