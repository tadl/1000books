class MainController < ApplicationController
  respond_to :html, :json, :js, :only => [:show_list]
  def index
  end

  def sign_up
  	if params['parent_name'] && params['parent_card']
  		@parent_name = params['parent_name']
  		@parent_card = params['parent_card']
  	end
  end

  def save_kid
  	if params['parent_name'] && params['parent_card'] && params['kid_name']
  		if Kid.exists?(parent_id: params['parent_card'], name: params['kid_name'])
  			@message = 'already registered'
  		else
  			kid = Kid.new
  			kid.name = params['kid_name']
  			kid.parent_name = params['parent_name']
  			kid.parent_id = params['parent_card']
  			kid.book_count = 0
  			kid.save
  			@message = 'success'
  		end
  	else
  		@message = 'missing feilds'
  	end
  	respond_to do |format|
  	    format.js
  	end		
  end

end
