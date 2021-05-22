Feature: To Execute the javaScript functions

  Scenario: execute JavaScript function with and without param
    * def getIntValue = function(){return 10;}
    Then print "FunctionValue===>", getIntValue()
    * def getRandomValue = function() { return Math.floor((100) * Math.random());}
    And print "random value ====>>>", getRandomValue()
    * def getStringValue = function(arg1) { return "Hello" + arg1 ;}
    Then print "parammetarased function ===> ", getStringValue(" World")