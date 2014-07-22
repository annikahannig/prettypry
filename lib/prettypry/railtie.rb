
#
# Prettypry Railtie
# =================
# 

require 'pry'
require 'pry-rails'

module Prettypry
  class Railtie < Rails::Railtie
    initializer 'prettypry.initialize' do |app|
      
      # == Configure Pry Prompt to show app name
      app_name = app.class.parent_name.underscore

      main_prompt = proc do |obj, nest_level, _|
        "#{app_name}> " 
      end

      wait_prompt = proc do |obj, nest_level, _|
        "> " 
      end

      Pry.config.prompt = [
        main_prompt, wait_prompt
      ]
      
    end
  end
end

