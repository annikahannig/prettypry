
#
# PrettyPry Pry Configuration
# ===========================
#

require 'pry'
require 'coolline'
require 'coderay'
require 'hirb'

module Prettypry
  class << self

    # == Configure pry input to use coolline
    Pry.config.input = Coolline.new do |c|
      c.transform_proc = proc do
        CodeRay.scan(c.line, :ruby).term
      end

      c.completion_proc = proc do
        word = c.completed_word
        Object.constants.map(&:to_s).select { |w| w.start_with? word }
      end
    end

    # == Configure pry output
    Pry.config.print = proc do |output, value|
      return if Hirb::View.view_or_page_output(value)
      pretty = value.ai(indent: 2)
      Pry::Helpers::BaseHelpers.stagger_output("=> #{pretty}", output)
    end

  end
end

