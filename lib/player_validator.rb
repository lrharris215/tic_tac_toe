class PlayerValidator
  def valid?(choice)
    /\bhuman\b/i.match?(choice) || /\bcomputer\b/i.match?(choice) || /\badvanced\b/i.match?(choice)
  end
end
