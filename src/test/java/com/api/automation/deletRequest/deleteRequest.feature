@smoke
Feature: To test the delete end point

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario: delete the job entry using job id
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    Given path "/normal/webapi/remove/" + createId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    Given path '/normal/webapi/find'
    And params { id: '#(createId)' , jobTitle: "Software Engg - 2"}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: delete the job entry using job id DELETE TWICE
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    Given path "/normal/webapi/remove/" + createId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 200
    Given path "/normal/webapi/remove/" + createId
    And headers {Accept: 'application/json'}
    When method delete
    Then status 404

  Scenario: to demo requests chaining
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    * def jobID = postRequest.responseJobID
    * def jobTitle = postRequest.responseJobTitle

    * def jobDesk = 'why people to stupid'
    Given path '/normal/webapi/update/details'
    And params {id: '#(jobID)' , jobTitle: '#(jobTitle)', jobDescription: '#(jobDesk)' }
    And headers {Accept: 'application/json'}
    When method patch
    Then status 200
    * def jobID = response.jobId
    * def jobTitle = response.jobTitle
    Given path '/normal/webapi/find'
    And params {id: '#(jobID)' , jobTitle: '#(jobTitle)'}
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.jobDescription == jobDesk
