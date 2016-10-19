class EventsInJapan::CLI

	def run
		list_events
		choose_event
	end

	def list_events
		puts "Upcoming events this month:"
		EventsInJapan::Event.list_events
	end

	def choose_event
		puts "Which event would you like more info on?"
	end

end