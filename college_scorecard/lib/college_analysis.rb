require 'csv'
$LOAD_PATH.unshift("..", __dir__)

class CollegeAnalysis
  attr_reader :analysis_type, :analysis_vars, :database

  def initialize(args)
    @analysis_type = args['type']
    @analysis_vars = args['vars']
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

  def load_data(file_extension)
    data = CSV.open(file_extension, headers: true, header_converters: :symbol)
    data.each do |row|
      database << row.to_hash
    end
  end

end
