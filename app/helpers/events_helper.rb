module EventsHelper
	def category_to_name(type)
		case type
		when 1 
			"Piwo"
		when 2
			"Jazda na rolkach"
		when 3
			"Bilard"
		when 4
			"Gry komputerowe"
		when 5
			"Jedzenie"
		when 6 
			"Szachy"
		when 7
			"Taniec"
		when 8
			"Bieganie"
		when 9
			"Jazda na rowerze"
		when 10
			"Koszykówka"
		when 11
			"Piłka nożna"
		end
	end
end
