class CodeBreakers

  def initials(name)
    name_array = name.split
    initials = name_array.map { |name| name[0]  }
    initials.join
  end

  def caeser_cipher(key, message)
    characters = message.split("")
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
