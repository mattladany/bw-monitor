# frozen_string_literal: true

require_relative 'ui/ui'

require 'curses'

module ThroughputMonitor
  class Error < StandardError; end
  # The CLI class is in charge of all command line interface processing as
  # well as starting the curses app if all logic passes. Note: This is closely
  # modeled after the rubocop gem's CLI class, at
  # https://github.com/rubocop-hq/rubocop/blob/master/lib/rubocop/cli.rb.
  class CLI
    STATUS_SUCCESS = 0
    STATUS_FAILURE = 1
    def initialize; end

    # Initialize the curses screen.
    def init_curses
      # start ncurses
      Curses.noecho
      Curses.init_screen
      Curses.start_color
      Curses.stdscr.keypad = true
    end

    # The entry point to the application. First parse the command line
    # arguments and then run the curses application until it is killed or quit.
    #
    # @param args [Array<String>] command line arguments
    # @return [Integer] the status code after processing the execution
    #   parameters.
    def run(args = ARGV)
      ready_to_run = process_arguments(args)
      if ready_to_run
        run_app
        return STATUS_SUCCESS
      end
      STATUS_FAILURE
    end

    def process_arguments(_args); end

    def run_app
      init_curses
      ui = UI::UIController.new
      ui.start
    ensure
      Curses.close_screen
    end
  end
end
