require_relative 'person'

class PersonDatabase
	attr_reader :people_array

	def initialize(people_array)
		@people_array = people_array
	end

	def add(person_info)
		person = Person.new(person_info)
		people_array << person
	end

	def delete(argument)
		@people_array.delete_if do |person|
			person[argument.keys.first] == argument.values.first
		end
	end

	def find_all_by(argument)
		@people_array.find_all do |person|
			person[argument.keys.first] == argument.values.first
		end
	end

	def find_all_csv(argument)
		@people_array.map do |person|
			person[argument.keys.first]
		end.join(", ")
	end

	def count_things(argument)
		@people_array.count do |person|
			person[argument.keys.first] == argument.values.first
		end
	end


end
