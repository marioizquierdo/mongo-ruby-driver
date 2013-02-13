module BSON

  # A reference to another object in a MongoDB database.
  class DBRef
    include Serializable::JSON

    attr_reader :collection, :database, :object_id

    # Create a DBRef. Use this class in conjunction with DB#dereference.
    #
    # @param [ String ] collection The collection name
    # @param [ ObjectId ] object_id The object id.
    # @param [ String ] database The optional database name.
    #
    # @core dbrefs constructor_details
    def initialize(collection, object_id, database = nil)
      @collection, @object_id, @database = collection, object_id, database
    end

    def to_s
      string = "ref: #{collection}, id: #{object_id}"
      string << ", db: #{database}" if database
      string
    end

    def as_json(*)
      json = { "$ref" => collection, "$id" => object_id.to_s }
      json.merge!("$db" => database) if database
      json
    end

    alias :to_hash :to_json
    alias :namespace :collection
  end
end
