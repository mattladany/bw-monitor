# frozen_string_literal: true

require_relative '../bandwidth/bandwidth'
require 'curses'
require 'singleton'
require 'ascii_chart'

module BandwidthMonitor
  module UI
    # The graph window in the ncurses UI.
    class BandwidthGraph
      include Singleton

      attr_reader :graph_window, :x_axis_window, :bandwidth

      def initialize
        @bandwidth = Bandwidth.new

        @graph_window = Curses::Window.new(Curses.lines / 2 - 1,
                                           Curses.cols - 2, 0, 0)

        @x_axis_window = Curses::Window.new(1, Curses.cols - 2,
                                            Curses.lines / 2, 0)
      end

      def start
        initialize_graph
        initialize_x_axis
        loop do
        end
      end

      def initialize_graph
        @graph_window.setpos(3, 0)
        @graph_window.addstr(AsciiChart.plot((0...89).map do |i|
          Math.cos(i * ((Math::PI * 8) / 90)).round(2) * 10
        end, { height: (Curses.cols / 4) }))

        @graph_window.refresh
      end

      def initialize_x_axis
        @x_axis_window.setpos(0, 3)
        @x_axis_window.addstr('Mb/s')

        @x_axis_window.setpos(0, Curses.cols / 2 - 1)
        @x_axis_window.addstr('testing1234!')

        @x_axis_window.refresh
      end
    end
  end
end
