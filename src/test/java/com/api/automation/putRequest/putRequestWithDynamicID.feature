Feature: update the file with usage of another feature file dynamically

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario: To update the Job Entry by Using other feature file
  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file using shared context
    # <Gherkin keyword> <call> <read(<location of file>)>
    #Given call read("../createJobEntry.feature")
    * def postRequest = call read("../createJobEntry.feature")
    And print "Calling Feature == > ", postRequest.id
    And print "Calling Feature == > ", postRequest.getRandomValue()
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
      "jobId":'#(postRequest.id)',
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
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'


  Scenario:  pass var values from current feature and run put
  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file using shared context
    # <Gherkin keyword> <call> <read(<location of file>)>
    #Given call read("../createJobEntry.feature")
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(id)'}
    And print "Calling Feature == > ", postRequest.id
    And print "Calling Feature == > ", postRequest.getRandomValue()
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