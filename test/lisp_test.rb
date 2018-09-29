require 'minitest/autorun'
require_relative '../src/lisp'

class LispTest < Minitest::Test
  def test_lisp_numeric
    ast = 1
    assert_equal Lisp.new({}).eval(ast), 1
  end
end
