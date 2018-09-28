class Parser
  def initialize(code)
    @code = code
  end

  def parse
    parse_tokens(tokenize)
  end

  protected

  def tokenize
    @code.gsub(/\s\s+/, ' ')
         .gsub('(', ' ( ')
         .gsub(')', ' ) ')
         .split(' ')
  end

  def parse_tokens(tokens)
    return if tokens.empty?

    token = tokens.shift

    if '(' == token
      parse_expression(tokens)
    elsif ')' == token
      raise 'unexpected )'
    else
      atom(token)
    end
  end

  def parse_expression(tokens)
    list = []

    while tokens.first != ')'
      list << parse_tokens(tokens)
    end
    tokens.shift

    list
  end

  def atom(token)
    if token[/\.\d+/]
      token.to_f
    elsif token[/\d+/]
      token.to_i
    else
      token.to_s
    end
  end
end
