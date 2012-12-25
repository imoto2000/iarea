
module IArea
  class Prefecture
    @@data = nil
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def iareas
      self.class.load!
      @@data.select{ |d|
        d[:prefecture] == name
      }.map { |d|
        IArea.from_code(d[:code],d[:subcode])
      }
    end

    def cities
      self.class.load!
      @@data.select{ |c|
        c[:name] == name
      }.map{ |c|
        IArea.from_code(c[:code],c[:subcode])
      }
    end
    
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

    def self.all
      load!
      @@data.map {  |d|
        d[:prefecture]
      }.uniq.map { |name|
        self.new name
      }
    end
    
  end
end
