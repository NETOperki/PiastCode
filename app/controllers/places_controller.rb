
class PlacesController < ApplicationController

	require 'google_maps_service'


	def js_map
    event = Event.find_by(id: params[:id])
    pos = event.where.split ','

    render :json => {lat: pos.first.to_f, lng: pos.second.to_f}

  	end
  	@users = User.all
	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude
end

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
			"Potańcówka"
		when 8
			"Bieganie"
		when 9
			"Jazda na rowerze"
		when 10
			"Koszykówka"
		when 11
			"Piłka nożna"


	end

	#def link
	#	"https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDsq2YWONMgdg-13qxa1IOxanjb7vs-VPs"+"&location="+get_points+"&radius="+radius
	#end

end
