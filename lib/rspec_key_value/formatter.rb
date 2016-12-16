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
      output.puts example_line(1, passed)
    end

    def example_pending(pending)
      output.puts example_line(-1, pending)
    end

    def example_failed(failure)
      output.puts example_line(0, failure)
    end

    private

    def clean_string(text)
      text.strip.downcase.gsub /[^\w.]+/, '_'
    end

    def current_group(gs = nil)
      gs = @groups unless gs
      clean_string gs.join('.')
    end

    def example_line(result, notification)
      description = clean_string(notification.example.description)
      "#{result}:#{current_group}.#{description}"
    end
  end
end
