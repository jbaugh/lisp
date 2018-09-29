require 'minitest/autorun'
require_relative '../src/environment'

class EnvironmentTest < Minitest::Test
  def test_environment_extends_passed_in
    opts = { foo: 'a' }
    assert_equal Environment.new(opts).get(:foo), 'a'
  end

  def test_environment_read_on_invalid_key
    opts = { foo: 'a' }
    assert_nil Environment.new(opts).get(:bar)
  end

  def test_environment_set
    env = Environment.new({})
    env.set(:foo, 'a')
    assert_equal env.get(:foo), 'a'
  end

  def test_environment_merge
    env = Environment.new({})
    opts = { foo: 'a', bar: 'b' }
    env.merge(opts)
    assert_equal env.get(:foo), 'a'
    assert_equal env.get(:bar), 'b'
  end
end
