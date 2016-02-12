require('pry')

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

  def the_worst(password, message)
    alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    caps = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
    keys = password.split("")
                   .map { |char| alphabet.index(char) }
    characters = message.split("")
    i = 0
    result = characters.map do |char|
      if char[/[a-z]/]
        index = ( alphabet.index(char) + keys[i] ) - 25
        if i < keys.length - 1
          i += 1
        else
          i = 0
        end
        alphabet[index]
      elsif char[/[A-Z]/]
        index = ( caps.index(char) + keys[i] ) - 25
        if i < keys.length - 1
          i += 1
        else
          i = 0
        end
        caps[index]
      else
        char
      end
    end
    result.join
  end

end
