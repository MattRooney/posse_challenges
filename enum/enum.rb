class Enum

  def self.any?(array, condition)
    array.each do |e|
      return true if condition.call(e)
    end
    return false
  end

  def self.select(array, condition)
    array.each_with_object([]) do |e, r|
      r << e if condition.call(e)
    end
  end

  def self.map(array, condition)
    array.each_with_object([]) do |e, r|
      r << condition.call(e)
    end
  end

  def self.reject(array, condition)
    array.each_with_object([]) do |e, r|
      r << e if !condition.call(e)
    end
  endgit 


end
