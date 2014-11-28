class Product < ActiveRecord::Base
	# Relations
	belongs_to :user
	belongs_to :market

	# Validation betches
	validates_length_of :name, :in => 4..100
	validates_length_of :description, allow_blank: true, :maximum => 400
	validates_presence_of :market_id
	validates_presence_of :price


	has_attached_file :image, :styles => {
		:large => "512x512" ,
		:medium => "360x360" ,
		:profile => "190x190",
		:small => "110x110",
		:thumb => "50x50",
		:tiny => "30x30"
		},
		:default_url => :set_default_url,
		:url  => "/images/products/:id-:basename.:style.:extension",
		:path => ":rails_root/public/images/products/:id-:basename.:style.:extension"

		validates_attachment :image,
		:content_type => { :content_type => ["image/jpg", "image/png","image/jpeg",] },
		:size => { :in => 0..6144.kilobytes }

		#validates_attachment_presence :image, { message: "O produto deve ter um logo ou imagem em seu cadastro" }
		#----------,

	def set_default_url
		"/img/market_missing.png"
	end

  	extend FriendlyId
  	friendly_id :slug_candidates, use: :slugged

  	def slug_candidates
    	[
	      :name,
	      [:name, :market_id],
	      [:name, :market_id, :user_id],
	      [:name, :market_id, :user_id, :price]
    	]
  	end


end
