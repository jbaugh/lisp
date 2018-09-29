require_relative 'environment'

class Lisp
  def initialize(env = {})
    @env = Environment.new(env)
  end

  def eval(expr, env = @env)
    if expr.is_a? Numeric
      expr
    elsif expr.is_a? Symbol
      env.get(expr)
    elsif expr[0] == :quote
      expr[1..-1]
    elsif expr[0] == :if
      
    elsif expr[0] == :define
      
    elsif expr[0] == :lambda
      
    else
      
    end
  end
end
