# Define a "dummy" engine in order to make vendor/assets/javascripts/insulate.js available to the app

module Insulate
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
