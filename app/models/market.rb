class Market < ActiveRecord::Base

	# Validations
	validates :address, presence: true
	validates :cnpj, presence: true
	validates :name, presence: true
	validates :email, presence: true
	validates :phone, presence: true

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


	has_attached_file :image, :styles => {
		:large => "512x512" ,
		:medium => "360x360" ,
		:small => "110x110",
		:thumb => "50x50",
		:tiny => "30x30"
		},
		:default_url => :set_default_url,
		:url  => "/images/markets/:id-:basename.:style.:extension",
		:path => ":rails_root/public/images/markets/:id-:basename.:style.:extension"

		validates_attachment :image,
		:content_type => { :content_type => ["image/jpg", "image/png","image/jpeg",] },
		:size => { :in => 0..6144.kilobytes }

		validates_attachment_presence :image, { message: "O mercado deve ter um logo ou imagem em seu cadastro" }
		#----------,

	def set_default_url
		"/img/market_missing.png"
	end

  	extend FriendlyId
  	friendly_id :slug_candidates, use: :slugged

  	def slug_candidates
    	[
	      :name,
	      [:name, :state],
	      [:name, :state, :city],
	      [:name, :state, :city, :cnpj]
    	]
  	end

end
