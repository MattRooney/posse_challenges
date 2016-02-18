class PersonDatabase
	attr_reader :people_array

	def initialize(people_array)
		@people_array = people_array
	end

	def add(person_info)
		person = Person.new(person_info)
		people_array << person
	end
end