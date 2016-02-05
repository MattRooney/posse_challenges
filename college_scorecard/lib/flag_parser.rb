module FlagParser

  def self.parse_flag(college_analysis)
    flag = ARGV[0]
    if flag == nil

    elsif flag == "by_state"
      college_analysis.by_state(ARGV[1])
    elsif flag == "top_average_faculty_salary"
      college_analysis.by_high_fac_salary(ARGV[1].to_i)
    elsif flag == "median_debt_between"
      college_analysis.by_median_debt(ARGV[1].to_i..ARGV[2].to_i)
    end
  end

end

#
# $ruby college_scorecard.rb median_debt_between 1500 2300
#
# ARGV[0] => "by_median_debt"
# ARGV[1] => "1500"
# ARGV[2] => "2300"
# ARGV[3] => nil
#
#
# if ARGV[0] == "by_state"
#   by_state(ARGV[1])
