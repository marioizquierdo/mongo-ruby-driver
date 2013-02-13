# encoding: utf-8
require 'test_helper'
require 'json'

class MaxKeyTest < Test::Unit::TestCase

  def test_as_json_converts_to_strict_json
    max_key = BSON::MaxKey.new
    assert_equal({ "$maxKey" => 1 }, max_key.as_json)
  end

  def test_to_json_converts_to_strict_json
    max_key = BSON::MaxKey.new
    assert_equal "{\"$maxKey\":1}", max_key.to_json
  end
end
