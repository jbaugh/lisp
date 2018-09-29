class Parser
  def parse(code)
    @code = code
    parse_tokens(tokenize)
  end

  protected

  # Splits the code into logical chunks
  def tokenize
    @code.gsub(/\s\s+/, ' ')
         .gsub('(', ' ( ')
         .gsub(')', ' ) ')
         .split(' ')
  end

  # Once we have tokens, we want to break them down into an Abstract
  # Syntax Tree.
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

  # Used for parsing nested expressions.
  # We go through each token, adding it to a nested list, and then terminate
  # when a closing paren ')' is reached.
  def parse_expression(tokens)
    list = []
    list << parse_tokens(tokens) while tokens.first != ')'
    tokens.shift
    list
  end

  # Returns the atom equivalent of the token
  def atom(token)
    if token[/\.\d+/]
      token.to_f
    elsif token[/\d+/]
      token.to_i
    elsif token == "'"
      :quote
    else
      token.to_sym
    end
  end
end
