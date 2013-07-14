module Insulate
  def self.root
    @insulate_root ||= "#{File.dirname(__FILE__)}/../"
  end
end

require 'insulate/version'
require 'insulate/action_controller_filters'
require 'insulate/rails/engine'
