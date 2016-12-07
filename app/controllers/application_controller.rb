class ApplicationController < ActionController::Base
	before_filter :getMenuNav, :getJumbotron, :getBlocks
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    def getMenuNav
			@sectNav = Section.where("menu_display = true").order(order: :asc)
  		#@pageNav = Page.where("menu_display = true && is_published = true").order(order: :asc)
		end

	def getPagesNav
		name = params[:t]
		id = Section.find_by_name(name).id
		##
		@pageNave = Page.display_by_section(id)
		if @pageNave.any?
			output = {'result' => @pageNave}.to_json
			render :json => output
		else
			render nothing: true, status: :service_unavailable
		end
	end

  	def getJumbotron
  		@jumbotron  = Block.where("position = 'jumbotron' ")
  	end

  	def getBlocks
  		@b = Block.where("position = 'block' ").order(order: :asc)
  	end

  end
