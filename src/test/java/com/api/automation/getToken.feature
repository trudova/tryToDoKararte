@ignore
Feature:to get the token for the user
  POST https://jobapplicationjwt.herokuapp.com/users/sign-up
  Scenario: :Register the user and generate the token
    Given url 'https://jobapplicationjwt.herokuapp.com/users/sign-up'
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request {username: '#(username)', password: '#(password)'}
    When method post
    Then status 200
    
    Given url 'https://jobapplicationjwt.herokuapp.com/users/authenticate'
    And headers {Accept: 'application/json', Content-Type: 'application/json'}
    And request {username: '#(username)', password: '#(password)'}
    When method post
    Then status 200
    * def authToken = response.token


