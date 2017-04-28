Feature: CLI usage

  Scenario: prints the usage when -h argument is given
    When I successfully run the program with argument -h
    Then the output must contain exactly:
      """
      Usage: mmve path [path ...]

      options:

          -h, --help                       print this message
          -V, --version                    print version
      """

  Scenario: prints the usage when no argument is given
    When I run the program
    Then the exit status must be 64
    And the output must contain exactly:
      """
      Usage: mmve path [path ...]

      options:

          -h, --help                       print this message
          -V, --version                    print version
      """
