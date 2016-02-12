class CodeBreakers

  def initials(names)
    initials = names.map { |name| name[0]  }
    initials.join
  end

  def caeser_cipher(message)
    key = message.shift.to_i
    words = message
    characters = words.flat_map do |word|
      word.split("")
    end
    shifted_chars = characters.map do |char|
      if char[/[a-z]/]
        modulo(char, key, 97..122).chr
        # (char.ord + key).chr
      elsif char[/[A-Z]/]
        modulo(char, key, 65..90).chr
      else
        char
      end
    end
    shifted_chars.join
  end

  def modulo(char, shift, range)
    ((char.ord + shift) - range.first) % range.count + range.first
  end

end

if __FILE__ == $PROGRAM_NAME
  pizza = CodeBreakers.new
  flag = ARGV[0]
  variables = ARGV[1..-1]

  if flag == "initials"
    puts pizza.initials(variables)
  elsif flag == "caeser_cipher"
    puts pizza.caeser_cipher(variables)
  end
end
