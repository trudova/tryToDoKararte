Feature: jsonPath object in karate

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario: To test the get end point with JSONPath
    Given path '/normal/webapi/all'
    When method get
    Then status 200
   # karate.jsonPath(doc, jsonPath expression)
    * def jobTitle = karate.jsonPath(response, "$[?(@.jobId == 1)].jobTitle")
    * def jobDescription = karate.jsonPath(response, "$[?(@.jobId == 1)].jobDescription")
    * def experience = karate.jsonPath(response, "$[?(@.jobId == 1)].experience")
    And print "jsonPath to jobTitle====>", jobTitle
    And print "jsonPath to jobDescription====>", jobDescription
    And print "jsonPath to experience====>", experience