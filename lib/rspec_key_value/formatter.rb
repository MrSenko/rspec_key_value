require 'rspec/core/formatters/base_text_formatter'

module RspecKeyValue
  # A simple Rspec formatter which prints the results in the form
  # R:group.sub_group.example_name where R is
  # -1 for PENDING, 0 for FAILED and 1 for PASS result
  class Formatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self,
                                     :example_group_started,
                                     :example_group_finished,
                                     :example_passed,
                                     :example_pending,
                                     :example_failed,
                                     :dump_summary,
                                     :dump_failures,
                                     :dump_pending,
                                     :seed

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

    def dump_summary(summary); end

    def dump_failures(notification); end

    def dump_pending(notification); end

    def seed(notification); end

    private

    def clean_string(text)
      text.strip.downcase.gsub(/[^\w.]+/, '_')
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
