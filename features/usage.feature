Feature: CLI usage

  Scenario: prints the usage when -h argument is given
    When I run `mmve -h`
    Then the exit status must be 0
    And the output must contain exactly:
      """
      Usage: mmve [ path ... ]
      """
