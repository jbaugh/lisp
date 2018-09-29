require 'minitest/autorun'
require_relative '../src/lisp'

class LispTest < Minitest::Test
  def test_lisp_numeric
    ast = 1
    assert_equal Lisp.new.eval(ast), 1
  end

  def test_lisp_quote
    ast = [:quote, 1]
    assert_equal Lisp.new.eval(ast), [1]
  end

  def test_lisp_if
    ast = [:if, [:<, 1, 2], 1, 2]
    assert_equal Lisp.new.eval(ast), 1
  end

  def test_lisp_addition
    ast = [:+, 1, 2, 3, 4]
    assert_equal Lisp.new.eval(ast), 10
  end
end
