require 'csv'
$LOAD_PATH.unshift("..", __dir__)

class CollegeAnalysis
  attr_reader :database

  def initialize
    @database = []
    load_data("2013_college_scorecards.csv")
    #
    # if analysis_type == "by_state"
    #   by_state(analysis_vars)
    # end

  end

  def by_state(state)
    schools = database.find_all do |row|
      row[:stabbr] == state
    end
    schools.map do |school|
      school[:instnm]
    end
  end

  def by_high_fac_salary(num)
    schools = database.sort_by do |row|
      -row[:avgfacsal].to_i
    end
    schools[0..num-1].map do |school|
      school[:instnm]
    end
  end

  def by_median_debt(range)
    schools = database.find_all do |row|
      row[:grad_debt_mdn].to_i > range.first && row[:grad_debt_mdn].to_i < range.last
    end
    schools.map do |school|
      school[:instnm] + " ($#{school[:grad_debt_mdn]})"
    end
  end

  def load_data(file_extension)
    data = CSV.open(file_extension, headers: true, header_converters: :symbol)
    data.each do |row|
      database << row.to_hash
    end
  end

end
