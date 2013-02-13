module BSON
  module Serializable
    module JSON

      # Serializes the object into valid JSON. The object must override as_json
      # if any special behaviour is needed.
      #
      # @return [ String ] The JSON representation of this object.
      def to_json(*args)
        as_json.to_json(*args)
      end
    end
  end
end
