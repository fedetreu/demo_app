require_relative 'base_agent'
require_relative 'section_coordinators/growth_analysis_coordinator_agent'
require_relative 'section_coordinators/solidity_analysis_coordinator_agent'
require_relative 'section_coordinators/risk_analysis_coordinator_agent'
require_relative 'section_coordinators/value_technical_analysis_coordinator_agent'
require_relative 'section_coordinators/external_source_manager_agent'

module Agents
  # Top level agent orchestrating the full report
  class ReportGeneratorAgent < BaseAgent
    def initialize
      super(
        SectionCoordinators::GrowthAnalysisCoordinatorAgent.new,
        SectionCoordinators::SolidityAnalysisCoordinatorAgent.new,
        SectionCoordinators::RiskAnalysisCoordinatorAgent.new,
        SectionCoordinators::ValueTechnicalAnalysisCoordinatorAgent.new,
        SectionCoordinators::ExternalSourceManagerAgent.new
      )
    end

    # Combines outputs from section agents
    def call(context = {})
      report = {
        growth: children[0].call(context),
        solidity: children[1].call(context),
        risk: children[2].call(context),
        value_and_technicals: children[3].call(context)
      }
      report[:external_sources] = children[4].call(context)
      report
    end
  end
end
