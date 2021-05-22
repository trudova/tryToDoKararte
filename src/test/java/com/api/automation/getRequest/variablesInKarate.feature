Feature: Variables Creation in Karate Framework
# <Gherkin_Keyword> <def> <Variable_name> =<Value>
  Background: creating and Initializing Variables
    * def app_name = "Google"
    * def page_lode_timeout = 20
    
 Scenario: To create a variable
   Given def var_int = 10
   And def var_str = "karate"
   Then print "Int_Variable ==>", var_int
   And  print "String_Variable ==>", var_str
   # another syntax using *
  # * <def > <variable_name> =<value>
  * def var_int2 = var_int + 10
   And print "new Var using *", var_int2
  And print "goloble var here ", var_int2 + page_lode_timeout
  And print "another global var comes from background", app_name

   # varibles from one scenario not reachable in the another scenario ,
   # we have to pass them in background if the want to re use them