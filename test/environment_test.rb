require 'minitest/autorun'
require_relative '../src/environment'

class EnvironmentTest < Minitest::Test
  def test_environment_extends_passed_in
    opts = { foo: 'a' }
    assert_equal Environment.new(opts).read(:foo), 'a'
  end

  def test_environment_read_on_invalid_key
    opts = { foo: 'a' }
    assert_nil Environment.new(opts).read(:bar)
  end
end
