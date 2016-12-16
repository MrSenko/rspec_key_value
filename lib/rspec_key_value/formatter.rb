require "rspec/core/formatters/base_text_formatter"

module RspecKeyValue
  class Formatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self,
      :example_group_started,
      :example_group_finished,
      :example_passed,
      :example_pending,
      :example_failed

    def initialize(output)
      super(output)
      @groups = []
    end

    def example_group_started(notification)
      @groups.push clean_string(notification.group.description)
    end

    def example_group_finished(_notification)
      @groups.pop
    end

    def example_passed(passed)
      description = clean_string(passed.example.description)
      output.puts "1:#{current_group}.#{description}"
    end

    def example_pending(pending)
      description = clean_string(pending.example.description)
      output.puts "-1:#{current_group}.#{description}"
    end

    def example_failed(failure)
      description = clean_string(failure.example.description)
      output.puts "0:#{current_group}.#{description}"
    end

    private

    def clean_string(text)
      text.strip.downcase.gsub /[^\w.]+/, '_'
    end

    def current_group
      clean_string @groups.join('.')
    end
  end
end
