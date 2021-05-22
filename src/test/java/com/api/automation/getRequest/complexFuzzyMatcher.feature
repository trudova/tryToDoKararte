Feature: GET end point response validation

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'


  Scenario: to get the data in the JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == '#present'
    And match response.[0].jobId == "#? _ ==1"
    And match response.[0].jobTitle == "#string? _.length ==13"

    And match response.[0].experience[0].id == '#notpresent'
    #making sure it is array
    And match response.[0].experience == "#[]"
    #making sure size is 3
    And match response.[0].experience == "#[3]"
    #making sure size is 3 and data type is string
    And match response.[0].experience == "#[3] #string"
    #making sure size is 3 and data type is string and each string has size greater then 2
    And match response.[0].experience == "#[3] #string? _.length() >=2"

    And match response.[0].project[0].projectName == '#ignore'
    And match response.[0].project[0].technology[2] == '#string'
    And match response.[0].project[0].technology =='#array'
    And match response.[0].jobId == '#number'