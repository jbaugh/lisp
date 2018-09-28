require 'minitest/autorun'
require_relative '../src/parser'

class LispTest < Minitest::Test
  def test_parser1
    program = '(begin (define r 10) (* pi (* r r)))'
    tokens = ['begin', ['define', 'r', 10], ['*', 'pi', ['*', 'r', 'r']]]
    assert_equal Parser.new(program).parse, tokens
  end

  def test_parser2
    program = '(+ 1 2)'
    tokens = ['+', 1, 2]
    assert_equal Parser.new(program).parse, tokens
  end

  def test_parser3
    program = '1'
    tokens = 1
    assert_equal Parser.new(program).parse, tokens
  end

  def test_parser4
    program = 'foo'
    tokens = 'foo'
    assert_equal Parser.new(program).parse, tokens
  end
end
