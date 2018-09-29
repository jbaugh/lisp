require_relative 'environment'

class Lisp
  def initialize(env = {})
    @env = Environment.new(env)
  end

  def eval(expr, env = @env)
    if expr.is_a? Numeric
      expr
    elsif expr[0] == :quote
      expr[1..-1]
    end
  end
end
