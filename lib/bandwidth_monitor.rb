# frozen_string_literal: true

require_relative 'bwm/version'
require_relative 'bwm/ui/ui'
require 'curses'

# The core module for the throughput-monitor project.
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
    ui = UI::UIController.new
    ui.start
  ensure
    Curses.close_screen
  end

  module_function :run, :init_curses
end
