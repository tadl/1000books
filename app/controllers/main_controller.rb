class MainController < ApplicationController
  respond_to :html, :json, :js, :only => [:show_list]
      $valid_colors = 
      [
        "#C63D0F",
        "#3B3738",
        "#7E8F7C",
        "#005A31",
        "#74AFAD",
        "#D9853B",
        "#E9E581",
        "#7D1935",
        "#4A96AD",
        "#118C4E",
        "#DF3D82",
        "#3F2860",
        "#93B1C6",
        "#342800",
        "#F9A646",
        "#004687",
        "#B81D18"
      ]


  def index
  end

  def sign_up
  	if params['parent_name'] && params['parent_card']
  		@parent_name = params['parent_name']
  		@parent_card = params['parent_card']
  		@already_registered = Kid.where(parent_id: @parent_card)
  	end
  end

  def save_kid
  	if params['parent_name'] != '' && params['parent_card'] != '' && params['kid_name'] != ''
  		if Kid.exists?(parent_id: params['parent_card'], name: params['kid_name'])
  			@message = 'This participant is already registered'
  		else
  			kid = Kid.new
  			kid.name = params['kid_name']
  			kid.parent_name = params['parent_name']
  			kid.parent_id = params['parent_card']
  			kid.book_count = 0
  			kid.save
  			@kid_id = kid.id
  			@parent_name = params['parent_name']
  			@parent_card = params['parent_card']
  			@message = 'success'
  			if params['add_another'] == 'true'
  				@add_another = true
  				@token = params[:token]
  			end
  		end
  	else
  		@message = 'Please complete all fields of this form'
  	end
  	respond_to do |format|
  	    format.js
  	end		
  end

  def update
  	@parent_card = params['parent_card']
  	if params['kid_id']
  		@kid_id = params['kid_id'].to_i
  		@kid = Kid.find(@kid_id)
  	end
  end

  def update_book_count
  	if params['kid_id'] && params['parent_card'] && params['add_books']
  		@kid_id = params['kid_id'].to_i
  		@kid = Kid.find(@kid_id)
  		if @kid.parent_id == params['parent_card']
  			@kid.book_count = @kid.book_count + params['add_books'].to_i
  			@kid.save
  		else
  			@message = "invalid update"
  		end
  	else
  		@message = "missing parameters"
  	end
  	respond_to do |format|
  	    format.js
  	end	
  end

end
