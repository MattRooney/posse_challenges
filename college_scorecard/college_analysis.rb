require 'csv'

class CollegeAnalysis
  attr_reader :analysis_type, :analysis_vars, :database

  def initialize(args)
    @analysis_type = args['analysis_type']
    @analysis_vars = args['analysis_vars']
    @database = load_data("2013_college_scorecards")
    if analysis_type == "by_state"
      by_state(analysis_vars)
    end
  end

  def by_state(state)
    database.rewind(0)
    schools = database.find_all do |row|
      row[:STABBR] == state
    end

    schools.map do |school|
      school[:INSTM]
    end
  end

  def load_data(file_extension)
    CSV.open(file_extension)
  end



end
