
class PlacesController < ApplicationController

	require 'google_maps_service'


	def test

		GoogleMapsService.configure do |config|
		  config.key = 'AIzaSyDSi_n0DKUFHcC7d4cbqANACFb_oPvJZ3A'

		end
	end

	def radius
		
	end
	#def link
	#	"https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=AIzaSyDsq2YWONMgdg-13qxa1IOxanjb7vs-VPs"+"&location="+get_points+"&radius="+radius
	#end

	def get_points(loc, radius)
    uri = URI('https://maps.googleapis.com/maps/api/place/nearbysearch/json')
    params = { :key => "AIzaSyDsq2YWONMgdg-13qxa1IOxanjb7vs-VPs" , :location => loc, :radius => radius }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    return res.body
    
  end
end
