# frozen_string_literal: true

require 'curses'
require 'singleton'

module BandwidthMonitor
  class Menu
    include Singleton

    attr_reader :window

    def initialize
      @window = Curses::Window.new(3, Curses.cols - 2,
                                   Curses.lines - 3, 1)
      @window.box('|', '-')
      @window.setpos(1, 1)
      @window.addstr('Press \'q\' to quit')
      @window.refresh
    end

    def handle_input(str)
      return false if str.eql? 'q'
      @window.setpos(1, Curses.cols - 20)
      @window.addstr("you entered: #{str}")
      @window.refresh
      true
    end

    def start

      # Loop forever until the 'q' key is pressed
      loop do
        input = @window.getch
        break unless handle_input(input)
      end
    end
  end
end
