require_relative 'environment'

class Evaluator
  def eval(env, expr)
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
      expr = eval(env, test) ? conseq : alt
      # Executes the correct code path
      eval(env, expr)
    elsif expr[0] == :define
      _, var, e = expr
      # Adds the evaluated expression identified by var to the environment
      env.set(var, eval(env, e))
    elsif expr[0] == :lambda
      _, params, e = expr
      # Evaluates the lambda in the context of this environment
      env.merge(Hash[params.zip(args)])
      lambda { |*args| self.eval(env, e) }
    else
      # Handles a list expression
      code = eval(env, expr[0])
      # Gets remaining arguments, and evaluates them
      args = expr[1..-1].map{ |arg| eval(env, arg) }
      # Calls function found in code, passing in evaluated arguments
      code.(*args)
    end
  end
end
