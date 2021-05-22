Feature:  update the job entry by put request

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"
  Scenario: To update the Job Entry for exiting job in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {  "jobId": '#(id)',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId":'#(id)',
      "jobTitle":"Software Engg - 3",
      "jobDescription":"To develop andriod application and Web Application",
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron",
        "Google"
      ],
      "project":[
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        },
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        }
      ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'

  Scenario: To update the Job Entry for exiting job in JSON format
    # Create a new Job Entry
    # Update the Job Entry using PUT request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {  "jobId": '#(getRandomValue())',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId":'#(id)',
      "jobTitle":"Software Engg - 3",
      "jobDescription":"To develop andriod application and Web Application",
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron",
        "Google"
      ],
      "project":[
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        },
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        }
      ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 404

  Scenario: To update the Job Entry by Using other feature file
    # creating the connection to the post feature using call keyword
    Given call read("../createJobEntry.feature")
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId":123,
      "jobTitle":"Software Engg - 3",
      "jobDescription":"To develop andriod application and Web Application",
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron",
        "Google"
      ],
      "project":[
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        },
        {
           "projectName":"Movie App",
           "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
           ]
        }
      ]
      }
      """
    And headers {Accept : 'application/json', Content-Type: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 123)].project")
    And print projectArray
    And match projectArray[0] == '#[2]'