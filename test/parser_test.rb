require 'minitest/autorun'
require_relative '../src/parser'

class ParserTest < Minitest::Test
  def test_parser1
    program = '(begin (define r 10) (* pi (* r r)))'
    tokens = [:begin, [:define, :r, 10], [:*, :pi, [:*, :r, :r]]]
    assert_equal Parser.new(program).parse, tokens
  end

  def test_parser2
    program = '(+ 1 2)'
    tokens = [:+, 1, 2]
    assert_equal Parser.new(program).parse, tokens
  end

  def test_parser3
    assert_equal Parser.new('1').parse, 1
  end

  def test_parser4
    assert_equal Parser.new('foo').parse, :foo
  end
end
