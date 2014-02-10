module IOSConfig
  module Payload
    class Ota
      
      attr_accessor :url, :challenge
      
      def initialize(attributes = {})
        attributes ||= {}
        attributes.each do |name, value|
          begin
            send("#{name}=", value)
          rescue NoMethodError => e 
            raise ArgumentError, %{"#{name}" is not a valid attribute}
          end
        end        
      end
      
      def build
        p = { 'URL' => @url,
              'Challenge' => @challenge,
              'DeviceAttributes' => ['UDID', 'IMEI', 'ICCID', 'VERSION', 'PRODUCT']
              }
      end

    end
  end
end
