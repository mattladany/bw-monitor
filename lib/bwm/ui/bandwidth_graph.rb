# frozen_string_literal: true

require_relative '../bandwidth/bandwidth'
require 'curses'
require 'singleton'
require 'ascii_chart'

module BandwidthMonitor
  module UI
    class BandwidthGraph
      include Singleton

      attr_reader :graph_window, :title_window, :bandwidth

      def initialize
        @bandwidth = Bandwidth.new

        @graph_window = Curses::Window.new(Curses.lines / 2 - 1, Curses.cols - 2, 0, 0)
#        @window.box('|', '-')
        @graph_window.setpos(5, 0)
#        @window.addstr('hello')
        @graph_window.addstr(AsciiChart.plot((0...40).map { |i|
          Math.cos(i * ((Math::PI * 8) / 90)).round(2) * 10
        }, {height: (Curses.cols / 4)}))

        @graph_window.refresh


        @title_window = Curses::Window.new(1, Curses.cols - 2,
                                           Curses.lines / 2, 0)
#        @title_window.box('|','-')
        @title_window.setpos(0, 3)
        @title_window.addstr('Mb/s')

        @title_window.setpos(0, Curses.cols / 2 - 1)
#        @window.addstr('hello')
        @title_window.addstr("testing1234!")

        @title_window.refresh

      end

      def start
        loop do
        end
      end
    end
  end
end
