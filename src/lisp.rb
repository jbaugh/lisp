require_relative 'environment'

class Lisp
  def initialize(env)
    @env = Environment.new(env)
  end

  def eval(expr, env = @env)
    if expr.is_a? Numeric
      expr
    end
  end
end
