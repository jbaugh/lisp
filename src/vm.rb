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
    codes = sanitize_code(code_str)
    # We want to return last executed result
    output = nil
    codes.split('\n').each do |code|
      output = @evaluator.eval(@env, @parser.parse(code))
    end
    output
  end

  def sanitize_code(code_str)
    code_str.gsub(/\s\s+/, ' ')
            .gsub('\n', ' ')
            .gsub(')(', ') (')
            .gsub(') (', ')\n(')
  end

  def repl(prompt = '> ')
    while true
      print prompt
      program = gets

      begin
        puts run(program)
      rescue Exception => ex
        puts ex
      end
    end
  end

  def peek(key)
    @env.get(key)
  end
end
