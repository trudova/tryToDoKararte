Feature: To create the job entry in the application
  Use POST request normal/webapi/add end point
  Background: create and initialise base URL
   Given url "https://jobportalkarate.herokuapp.com"
   
   
   Scenario: create a job Entry in JSON format
    Given path "/normal/webapi/add"
     And request { "jobId": 12, "jobTitle": "Software Engg", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "comcast"], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite", "Gradle" ] } ] }
     And headers {Accept: "application/json", Content-Type: "application/json" }
     When method post
     Then status 201
     And match response.jobTitle == "Software Engg"
     And print response

  Scenario: create a job Entry in JSON format
    Given path "/normal/webapi/add"
    * def bodyJ = read("/posrData/jobEntry.json")
    And request bodyJ
    And headers {Accept: "application/json", Content-Type: "application/json" }
    When method post
    Then status 201
    And match response.jobTitle == "Software Engg"
    And print response



  Scenario: create a job Entry in XML format
    Given path '/normal/webapi/add'
    * def body = read("/posrData/jobEntryXML.xml")
    And request body
    And headers {Accept : 'application/xml', Content-Type: 'application/xml'}
    When method post
    Then status 201
    And print response
   # And match response/List/item/jobId == "1"

  Scenario: create a job Entry in JSON format using variables
    Given path "/normal/webapi/add"
    * def getjobId = function() { return Math.floor( (100) * Math.random());}
    And request { "jobId": "#(getjobId())", "jobTitle": "Software Engg", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "comcast"], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite", "Gradle" ] } ] }
    And headers {Accept: "application/json", Content-Type: "application/json" }
    When method post
    Then status 201
    And match response.jobTitle == "Software Engg"
    And print response

    # all the sane with xml