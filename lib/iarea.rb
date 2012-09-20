require "iarea/version"
require "iarea/mesh"
require "iarea/record"

module IArea
  def load!
    Record.load!
  end

  def find(lat,lng)
    Record.find(lat,lng)
  end

  module_function :load!,:find
end
