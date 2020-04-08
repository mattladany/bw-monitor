# frozen_string_literal: true

require_relative 'menu'
require_relative 'bandwidth_graph'

module BandwidthMonitor
  module UI
    # The main controller for ncurses interactions.
    class UIController
      attr_reader :menu, :bandwidth_graph

      def initialize
        @menu = Menu.instance
        @bandwidth_graph = BandwidthGraph.instance
      end

      def start
        menu_thread = Thread.new do
          @menu.start
        end

        bandwidth_graph_thread = Thread.new do
          @bandwidth_graph.start
        end

        menu_thread.join
        bandwidth_graph_thread.exit
      end
    end
  end
end
