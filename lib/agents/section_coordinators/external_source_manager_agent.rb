require_relative '../base_agent'

module Agents
  module SectionCoordinators
    # Collects and formats external citations
    class ExternalSourceManagerAgent < BaseAgent
      def initialize
        super()
        @sources = []
      end

      def add_source(url)
        @sources << url
      end

      def call(context = {})
        @sources.uniq
      end
    end
  end
end
