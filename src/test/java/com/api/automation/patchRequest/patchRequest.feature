Feature: patch request for partial update

  Background: create and initialise base URL
    Given url "https://jobportalkarate.herokuapp.com"

  Scenario:update jobEntry patch request for partial update
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    * def jobDesk = "To test andriod  and web based application "
    Given path '/normal/webapi/update/details'
    And params {id: '#(createId)', jobTitle: "Software Engg - 2", jobDescription: '#(jobDesk)'}
    And headers Accept = 'application/json'
    When method patch
    Then status 200
    And  match response.jobDescription == jobDesk
    And print response
@smoke
  Scenario:update jobEntry patch request with missing param
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createId = getRandomValue()
    * def postRequest = call read("../createJobEntryWithVariables.feature"){ _url: 'https://jobportalkarate.herokuapp.com', _path: '/normal/webapi/add', _id: '#(createId)'}
    * def jobDesk = "To test andriod  and web based application "
    Given path '/normal/webapi/update/details'
    And params {id: '#(createId)', jobDescription: '#(jobDesk)'}
    And headers Accept = 'application/json'
    When method patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"
    And print response

