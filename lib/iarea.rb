require "iarea/version"
require "iarea/mesh"
require "iarea/record"
require "iarea/prefecture"

module IArea
  def load!
    Record.load!
  end

  def find(lat,lng)
    Record.find(lat,lng)
  end

  def from_code(code,subcode)
    Record.from_code(code,subcode)
  end

  module_function :load!,:find,:from_code
end
