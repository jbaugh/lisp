require 'minitest/autorun'
require_relative '../src/parser'

class LispTest < Minitest::Test
  def test_tokenizer
    program = '(begin (define r 10) (* pi (* r r)))'
    tokens = ['begin', ['define', 'r', 10], ['*', 'pi', ['*', 'r', 'r']]]
    assert_equal Parser.new(program).parse, tokens
  end
end