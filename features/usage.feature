Feature: CLI usage

  Scenario: prints the usage when -h argument is given
    When I successfully run `mmve -h`
    Then the output must contain exactly:
      """
      Usage: mmve [ path ... ]
      """
