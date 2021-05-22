Feature: validate the schema for JSON

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario: create a job Entry in JSON format
    Given path "/normal/webapi/add"
    And request { "jobId": 12, "jobTitle": "Software Engg", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "comcast"], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite", "Gradle" ] } ] }
    And headers {Accept: "application/json", Content-Type: "application/json" }
    When method post
    Then status 201
    And match response ==
    """
    {
    "jobId": "#number",
    "jobTitle": "#string",
    "jobDescription": "#string",
    "experience": "#[] #string",
    "project": "#[] #object"
}
    """

  Scenario: Validate the schema with fuzzy matchers
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
      # Send the get request
    Then status 200
       # the status code response should be 200
    * def projectSchema = { "projectName": '#string',"technology": '#[] #string' }
    * def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription":'#string',"experience": '#[] #string',"project": '#[] ##(projectSchema)'}
    And match response ==
      """
      '#[] ##(mainSchema)'
      """

