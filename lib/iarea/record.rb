require 'yaml'

module IArea

  # represends i-area data
  class Record
    @@data = nil
    attr_accessor :name,:code,:subcode
    
    def initialize(params)
      @code = params[:code]
      @subcode = params[:code]
      @name = params[:name]
    end
    
    def self.find(lat,lng)
      load!

      (2..7).each do |i|
        mesh = Mesh.latlng2mesh lat,lng,i
        n = @@data.detect{ |n|
          n[:mesh][i].any?{ |m| 
            m == mesh 
          }
        }
        return self.new(n) if n
      end
    end

    def self.load!
      return unless @@data.nil?
      f = File.expand_path( File.dirname(__FILE__) + "/../iarea.yml" )
      @@data = YAML.load( open(f).read )
    end

    def self.to_yml
      YAML.dump @@data
    end
  end
end
