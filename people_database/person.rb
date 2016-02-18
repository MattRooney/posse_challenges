class Person
	attr_accessor :first_name, :last_name, :email, :state

	def initialize(person_info)
		@first_name = person_info[:first_name]
		@last_name = person_info[:last_name]
		@email = person_info[:email]
		@state = sperson_info[:state]
	end

end
