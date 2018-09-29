class Environment
  ARITHMETIC_OPS = %i(== != < <= > >= + - * /).freeze

  def initialize(extra = {})
    @env = built_in_funcs.merge(extra)

    # Defines lambdas for the operators
    ARITHMETIC_OPS.inject({}) do |_scope, operator|
      @env.merge!(operator => lambda { |*args| args.inject(&operator) })
    end
  end

  def get(key)
    @env[key]
  end

  def set(key, val)
    @env[key] = val
  end

  def merge(opts = {})
    @env.merge!(opts)
  end

  protected

  def built_in_funcs
    {
      true:   lambda { |*_list| true },
      false:  lambda { |*_list| false },
      list:   lambda { |*list| Array(list) },
      null?:  lambda { |list| list.empty? },
      min:    lambda { |*list| list.min },
      max:    lambda { |*list| list.max },
      eq?:    lambda { |*list| list.inject(&:==) },
      car:    lambda { |*list| list[0] },
      cdr:    lambda { |*list| list.drop 1 },
      cons:   lambda { |(e, cell), _| [e] + cell }
    }
  end
end
