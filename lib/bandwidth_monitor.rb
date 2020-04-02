require_relative 'bwm/version'
require_relative 'bwm/ui/menu'
require_relative "bwm/ui/bandwidth_graph"
require "curses"

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

    bandwidth_graph_thread = Thread.new do
      BandwidthGraph.instance.start
    end

    menu_thread = Thread.new do
      Menu.instance.start
    end

    menu_thread.join
    bandwidth_graph_thread.exit

  ensure
    Curses.close_screen
  end
end
