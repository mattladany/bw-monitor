# frozen_string_literal: true
require 'curses'

module BandwidthMonitor
  class Menu
    attr_reader :window

    def initialize()
      @window = Curses::Window.new(3, Curses.cols - 2,
                                   Curses.lines - 3, 1)
      @window.box('|', '-')
      @window.setpos(1,1)
      @window.addstr('Press \'q\' to quit')
      @window.refresh
    end

    def handle_input(str)
      case str
      when "q"
        return false
      end
      @window.setpos(1, Curses.cols - 20)
      @window.addstr("you entered: #{str}")
      @window.refresh
      return true
    end
  end
end
