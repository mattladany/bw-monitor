require_relative "bwm/version"
require_relative "bwm/menu"
require "curses"

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

    #  menu_window = Curses::Window.new(3, Curses.cols - 2,
    #                                   Curses.lines - 3, 1)
    #  menu_window.box('|', '-')
    #  menu_window.setpos(1, 1)
    #  menu_window.addstr('Press \'q\' to quit')
    #  menu_window.refresh

      menu = BandwidthMonitor::Menu.new

      loop do
        input = win1.getch  # Waiting for a pressed key to exit
        break if !menu.handle_input(input)
      end

    ensure
      Curses.close_screen
    end
  end
end
