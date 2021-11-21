Feature: Calculating retirement age
	As an application user, I want to enter in the age and month I was born,
	then be provided with my full retirement age and the month and year this
	will occur.

  # Valid input scenarios
  Scenario: User provides valid birth month and birth year (1900 - 1942)
    Given The program is prompting the user for birth year and birth month
    When The user enters a birth year from 1900 to 1942
    And The user enters a valid birth month
    Then The program should display to the user a retirement age of 65 and 8 months
    And The program should use the values to calculate and display the retirement date.

  Scenario: User provides valid birth month and birth year (1943 - 1954)
    Given The program is prompting the user for birth year and birth month
    When The user enters a birth year from 1943 to 1954
    And The user enters a valid birth month
    Then The program should display to the user a retirement age of 66 and 0 months
    And The program should use the values to calculate and display the retirement date.

  Scenario Outline: User provides valid birth month and birth year
    Given The program is prompting the user for birth year and birth month
    When The user enters a birth year of "<year>"
    And The user enters a valid birth month
    Then The program should display to the user a retirement age of "<result>"
    And The program should use the values to calculate and display the retirement date.

    Examples: Outputs
      | year | result |
      | 1955 | 66 and 2 months |
      | 1956 | 66 and 4 months |
      | 1957 | 66 and 6 months |
      | 1958 | 66 and 8 months |
      | 1959 | 66 and 10 months |

#  Scenario: User provides valid birth month and birth year (1956)
#    Given The program is prompting the user for birth year and birth month
#    When The user enters a birth year of 1956
#    And The user enters a valid birth month
#    Then The program should display to the user a retirement age of 66 and 4 months
#    And The program should use the values to calculate and display the retirement date.
#
#  Scenario: User provides valid birth month and birth year (1957)
#    Given The program is prompting the user for birth year and birth month
#    When The user enters a birth year of 1957
#    And The user enters a valid birth month
#    Then The program should display to the user a retirement age of 66 and 6 months
#    And The program should use the values to calculate and display the retirement date.
#
#  Scenario: User provides valid birth month and birth year (1958)
#    Given The program is prompting the user for birth year and birth month
#    When The user enters a birth year of 1958
#    And The user enters a valid birth month
#    Then The program should display to the user a retirement age of 66 and 8 months
#    And The program should use the values to calculate and display the retirement date.
#
#  Scenario: User provides valid birth month and birth year (1959)
#    Given The program is prompting the user for birth year and birth month
#    When The user enters a birth year of 1959
#    And The user enters a valid birth month
#    Then The program should display to the user a retirement age of 66 and 10 months
#    And The program should use the values to calculate and display the retirement date.

  Scenario: User provides valid birth month and birth year (>=1960)
    Given The program is prompting the user for birth year and birth month
    When The user enters a birth year of 1960 or later
    And The user enters a valid birth month
    Then The program should display to the user a retirement age of 67 and 0 months
    And The program should use the values to calculate and display the retirement date.

  Scenario: User provides valid birth month and birth year
    Given The user's provided birth month and the full retirement age's months are greater than 12 when combined
    When The program calculates the retirement date
    And The user enters a valid birth month
    Then The year of retirement should increase by 1 and the month of retirement should decrease by 12
    And The month of retirement should be between 1 and 12.

    # Invalid input scenarios
  Scenario: User provides invalid birth year value (<1900)
    Given The program is prompting the user for birth year
    When The user provides a year of birth prior to 1900
    Then The program should raise a ValueError

  Scenario: User provides invalid birth year value (> present year)
    Given The user enters {2022} for birth year
    When The user calculates retirement age
    Then The program should raise a ValueError

  Scenario: User provides invalid birth month value (<1 or >12)
    Given The program is prompting the user for birth month
    When The user enters a birth month value less than 1 or greater than 12
    Then The program should raise a ValueError

  Scenario: User provides invalid birth month or birth year values
    Given The program is prompting the user for birth year or birth month
    When The user provides a non integer value
    Then The program should raise a ValueError
