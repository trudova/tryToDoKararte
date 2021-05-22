Feature: GET end point response validation using file

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'


  Scenario: to get the data in the JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # create the variable of the external file
    * def actualResponse = read("../jsonGetRespons.json")
    And match response == actualResponse
    And print "File ==>", actualResponse

  Scenario: to get the data in the JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # create the variable of the external file
    * def actualResponse = read("../xmlResponse.xml")
    And match response == actualResponse
    And print "File ==>", actualResponse