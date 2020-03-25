require_relative "bwm/version"
require_relative "bwm/ui/menu"
require "ui"

module BandwidthMonitor
  class Error < StandardError; end
  # Your code goes here...

  def run
    begin

      # start ncurses
      Curses.noecho
      Curses.init_screen
      Curses.start_color
      Curses::stdscr.keypad = true
      Curses.curs_set(0)

      win1 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols - 2, 0, 0)
      win1.box('|', '-')
      win1.setpos(2, 2)
      win1.addstr('hello')
      win1.refresh

      menu_thread = Thread.new do
        menu = Menu.new
        menu.start
      end


      menu_thread.join

    ensure
      Curses.close_screen
    end
  end
end
