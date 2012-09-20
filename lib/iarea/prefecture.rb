
module IArea
  class Prefecture
    @@data = nil
    
    def self.load!
      return unless @@data.nil?
      f = File.expand_path( File.dirname(__FILE__) + "/../prefecture.yml" )
      @@data = YAML.load( open(f).read )
    end
    
    def self.find(code,subcode)
      load!
      d = @@data.detect { |d|
        d[:code] == code and d[:subcode] == subcode
      }
      d[:prefecture]
    end
    
  end
end
