module Agents
  # Base class for all agents. Provides simple hierarchy helpers
  class BaseAgent
    attr_reader :children

    def initialize(*children)
      @children = children
    end

    # Executes the agent logic and returns output hash
    def call(context = {})
      raise NotImplementedError, 'Subclasses must implement #call'
    end
  end
end
