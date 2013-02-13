# encoding: utf-8
require 'test_helper'
require 'json'

class DBRefTest < Test::Unit::TestCase

  def setup
    @object_id = BSON::ObjectId.new
  end

  def test_as_json_converts_to_strict_json_with_database
    dbref = BSON::DBRef.new("coll", @object_id, "dbname")
    assert_equal(
      { "$ref" => "coll", "$id" => @object_id.to_s, "$db" => "dbname" },
      dbref.as_json
    )
  end

  def test_as_json_converts_to_strict_json_without_database
    dbref = BSON::DBRef.new("coll", @object_id)
    assert_equal({ "$ref" => "coll", "$id" => @object_id.to_s }, dbref.as_json)
  end

  def test_to_json_converts_to_strict_json_with_database
    dbref = BSON::DBRef.new("coll", @object_id, "dbname")
    assert_equal(
      "{\"$ref\":\"coll\",\"$id\":\"#{@object_id.to_s}\",\"$db\":\"dbname\"}",
      dbref.to_json
    )
  end

  def test_to_json_converts_to_strict_json_without_database
    dbref = BSON::DBRef.new("coll", @object_id)
    assert_equal("{\"$ref\":\"coll\",\"$id\":\"#{@object_id.to_s}\"}", dbref.to_json)
  end

  def test_to_hash_converts_to_strict_json_with_database
    dbref = BSON::DBRef.new("coll", @object_id, "dbname")
    assert_equal(
      { "$ref" => "coll", "$id" => @object_id.to_s, "$db" => "dbname" },
      dbref.to_hash
    )
  end

  def test_to_hash_converts_to_strict_json_without_database
    dbref = BSON::DBRef.new("coll", @object_id)
    assert_equal({ "$ref" => "coll", "$id" => @object_id.to_s }, dbref.to_hash)
  end

  def test_to_s_with_database
    dbref = BSON::DBRef.new("coll", @object_id, "dbname")
    assert_equal("ref: coll, id: #{@object_id.to_s}, db: dbname", dbref.to_s)
  end

  def test_to_s_without_database
    dbref = BSON::DBRef.new("coll", @object_id)
    assert_equal("ref: coll, id: #{@object_id.to_s}", dbref.to_s)
  end
end
