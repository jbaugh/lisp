require_relative 'parser'
require_relative 'evaluator'
require_relative 'environment'

class Vm
  def initialize(env = {})
    @env = Environment.new(env)
    @evaluator = Evaluator.new
    @parser = Parser.new
  end

  def run(code_str)
    codes = code_str.gsub(/\s\s+/, ' ')
                    .gsub('\n', ' ')
                    .gsub(')(', ') (')
                    .gsub(') (', ')\n(')
    codes.split('\n').each do |code|
      @evaluator.eval(@env, @parser.parse(code))
    end
  end

  def peek(key)
    @env.get(key)
  end
end
