# frozen_string_literal: true

require_relative 'menu'
require_relative 'throughput_graph'

module ThroughputMonitor
  module UI
    # The main controller for ncurses interactions.
    class UIController
      attr_reader :menu, :throughput_graph

      def initialize
        @menu = Menu.instance
        @throughput_graph = ThroughputGraph.instance
      end

      def start
        menu_thread = Thread.new do
          @menu.start
        end

        throughput_graph_thread = Thread.new do
          @throughput_graph.start
        end

        menu_thread.join
        throughput_graph_thread.exit
      end
    end
  end
end
