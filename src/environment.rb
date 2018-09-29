class Environment
  OPERATORS = %i[== != < <= > >= + - * /]

  def initialize(extra = {})
    @env = {
      car:    lambda { |*list| list[0] },
      cdr:    lambda { |*list| list.drop 1 },
      cons:   lambda { |(e, cell), _| [e] + cell }
    }.merge(extra)
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
end
