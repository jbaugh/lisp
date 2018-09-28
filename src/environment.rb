class Environment
  OPERATORS = %i[== != < <= > >= + - * /]

  def initialize(extra = {})
    @env = {

    }.merge(extra)
  end

  def read(key)
    @env[key]
  end
end
