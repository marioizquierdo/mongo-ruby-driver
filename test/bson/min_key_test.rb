# encoding: utf-8
require 'test_helper'
require 'json'

class MinKeyTest < Test::Unit::TestCase

  def test_as_json_converts_to_strict_json
    min_key = BSON::MinKey.new
    assert_equal({ "$minKey" => 1 }, min_key.as_json)
  end

  def test_to_json_converts_to_strict_json
    min_key = BSON::MinKey.new
    assert_equal "{\"$minKey\":1}", min_key.to_json
  end
end
