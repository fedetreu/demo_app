require_relative '../base_agent'

module Agents
  module Utilities
    # Stubbed agent to fetch financial data from Google Sheets
    class FinancialDataExtractionUtilityAgent < BaseAgent
      def call(ticker:, snippet_id:, metric:)
        # Placeholder for Google ADK integration to fetch sheet data
        nil
      end
    end
  end
end
