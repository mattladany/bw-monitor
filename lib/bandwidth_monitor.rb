require_relative 'bwm/version'
require_relative 'bwm/ui/menu'
require 'curses'

module BandwidthMonitor
  class Error < StandardError; end

  def init_curses

    # start ncurses
    Curses.noecho
    Curses.init_screen
    Curses.start_color
    Curses.stdscr.keypad = true
    Curses.curs_set(0)
  end

  def run

    init_curses

    win1 = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols - 2, 0, 0)
    win1.box('|', '-')
    win1.setpos(2, 2)
    win1.addstr('hello')
    win1.refresh

    menu_thread = Thread.new do
      Menu.instance.start
    end

    menu_thread.join

  ensure
    Curses.close_screen
  end
end
