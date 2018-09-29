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
      # Gets the test condition, the if-true expression, and the if-false expression
      _, test, conseq, alt = expr
      # Tests the condition, and gets the next code to execute based on condition
      expr = eval(test, env) ? conseq : alt
      # Executes the correct code path
      eval(expr, env)
    elsif expr[0] == :define
      
    elsif expr[0] == :lambda
      _, params, e = expr
      # Evaluates the lambda in the context of this environment
      lambda { |*args| self.eval(e, env.merge(Hash[params.zip(args)])) }
    else
      # Handles a list expression
      code = eval(expr[0], env)
      # Gets remaining arguments, and evaluates them
      args = expr[1..-1].map{ |arg| eval(arg, env) }
      # Calls function found in code, passing in evaluated arguments
      code.(*args)
    end
  end
end
