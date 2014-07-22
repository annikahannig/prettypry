
#
# Prettypry Railtie
# =================
#
# (c) 2014 Matthias Hannig, Trustner GmbH
# 

require 'pry'
require 'pry-rails'

module Prettypry
  class Railtie < Rails::Railtie
    initializer 'prettypry.initialize' do |app|

      # == Configure Pry Prompt to show app name
      app_name = app.class.parent_name.underscore.blueish
      separator = '>'.redish

      main_prompt = proc do |obj, nest_level, _|
        line_num = "[#{_.input_array.size.to_s.blue}]"
        "#{line_num} #{app_name.blueish} #{separator} " 
      end

      wait_prompt = proc do |obj, nest_level, _|
        "#{separator} " 
      end

      Pry.config.prompt = [
        main_prompt, wait_prompt
      ]
      
    end
  end
end

