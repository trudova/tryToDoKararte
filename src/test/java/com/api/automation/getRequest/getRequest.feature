Feature: to test GET end point

  Background: set up Base path
    Given url 'https://jobportalkarate.herokuapp.com'
    And print 'background gets accused'

  Scenario: To test the get end point with JSON data to get al the data
    Given path '/normal/webapi/all'
    When method get
  #Send get request
    Then status 200


  Scenario: To test the get end point with JSON data to get al the data
    Given path '/normal/webapi/all'
    When method get
  #Send get request
    Then status 200

  Scenario: To test the get end point with JSON data to get al the data
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
  #Send get request
    Then status 200