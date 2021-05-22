Feature: ran the post request
  Scenario: To create the Job Entry in JSON format
    Given url _url
    And path _path
    And request {  "jobId": '#(_id)',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    * def responseJobID = response.jobId
    * def responseJobTitle = response.jobTitle
