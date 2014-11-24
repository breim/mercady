class Market < ActiveRecord::Base

	# Validations
	validates :address, presence: true
	validates :cnpj, presence: true
	validates :name, presence: true

	# GeoCodeGem	
	geocoded_by :address do |obj, results|
		if geo = results.first
	      # populate your model
	    	if geo.state["State of"]
	    		geo.state["State of"] = ""
	    	end
	    	obj.latitude = geo.latitude
	    	obj.longitude = geo.longitude
	    	obj.city    = geo.city
	    	obj.state = geo.state
		else
	  		obj.address == nil
	  	end
	end
	after_validation :geocode, :if => :address_changed?


end
