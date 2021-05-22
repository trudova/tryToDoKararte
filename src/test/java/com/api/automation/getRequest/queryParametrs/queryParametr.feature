Feature: get request using query parameter

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario: get request using query parameter
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    Given path '/normal/webapi/find'
    # first aprouch one by one
#      And param id = createId
#    And param jobTitle = 'Software Engg - 2'
    # second aprouch in the obj
    And params {id: '#(createId)', jobTitle: 'Software Engg - 2'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.jobId == createId

  Scenario: get request using query parameter JOB ID is not present in the application
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    Given path '/normal/webapi/find'
    # first aprouch one by one
      And param id = 123344
    And param jobTitle = 'Software Engg - 2'
    # second aprouch in the obj
   # And params {id: '#(createId)', jobTitle: 'Software Engg - 2'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 404
    #And match response.jobId == createId