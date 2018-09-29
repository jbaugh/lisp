require 'minitest/autorun'
require_relative '../src/evaluator'

class EvaluatorTest < Minitest::Test
  def test_evaluator_numeric
    ast = 1
    assert_equal Evaluator.new.eval(ast), 1
  end

  def test_evaluator_quote
    ast = [:quote, 1]
    assert_equal Evaluator.new.eval(ast), [1]
  end

  def test_evaluator_if
    ast = [:if, [:<, 1, 2], 1, 2]
    assert_equal Evaluator.new.eval(ast), 1
  end

  def test_evaluator_addition
    ast = [:+, 1, 2, 3, 4]
    assert_equal Evaluator.new.eval(ast), 10
  end

  def test_evaluator_define
    asts = [[:define, :r, 10], [:define, :pi, 3.14], [:*, :pi, [:*, :r, :r]]]
    evaluator = Evaluator.new
    asts.each do |ast|
      evaluator.eval(ast)
    end
  end
end
