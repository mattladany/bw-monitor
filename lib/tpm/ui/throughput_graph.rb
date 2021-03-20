# frozen_string_literal: true

require_relative '../throughput/throughput'
require 'curses'
require 'singleton'
require 'ascii_chart'

module ThroughputMonitor
  module UI
    # The graph window in the ncurses UI.
    class ThroughputGraph
      include Singleton

      attr_reader :graph_window, :x_axis_window, :throughput

      def initialize
        @throughput = Throughput.new

        @graph_window = Curses::Window.new(Curses.lines / 2 - 1,
                                           Curses.cols - 2, 0, 0)

        @x_axis_window = Curses::Window.new(1, Curses.cols - 2,
                                            Curses.lines / 2, 0)
      end

      def start
        initialize_x_axis
        throughput_thread = Thread.new do
          @throughput.start
        end
        loop do
          sleep 5
          update_graph
        end
      end

      # TODO
      def update_graph
        @graph_window.setpos(3, 0)
        @graph_window.addstr(AsciiChart.plot(@throughput.download_rate,
                                             { height: (Curses.cols / 4) }))
        #@graph_window.addstr(@throughput.download_rate.to_a.inspect)
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
