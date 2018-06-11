class TastingsController < ApplicationController
  before_action :current_user_must_be_tasting_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_tasting_user
    tasting = Tasting.find(params[:id])

    unless current_user == tasting.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @tastings = Tasting.page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@tastings.where.not(:location_latitude => nil)) do |tasting, marker|
      marker.lat tasting.location_latitude
      marker.lng tasting.location_longitude
      marker.infowindow "<h5><a href='/tastings/#{tasting.id}'>#{tasting.cheeses_id}</a></h5><small>#{tasting.location_formatted_address}</small>"
    end

    render("tastings/index.html.erb")
  end

  def show
    @tasting = Tasting.find(params[:id])

    render("tastings/show.html.erb")
  end

  def new
    @tasting = Tasting.new

    render("tastings/new.html.erb")
  end

  def create
    @tasting = Tasting.new

    @tasting.cheeses_id = params[:cheeses_id]
    @tasting.user_id = params[:user_id]
    @tasting.location = params[:location]
    @tasting.notes = params[:notes]
    @tasting.producers_id = params[:producers_id]
    @tasting.rating = params[:rating]

    save_status = @tasting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tastings/new", "/create_tasting"
        redirect_to("/tastings")
      else
        redirect_back(:fallback_location => "/", :notice => "Tasting created successfully.")
      end
    else
      render("tastings/new.html.erb")
    end
  end

  def edit
    @tasting = Tasting.find(params[:id])

    render("tastings/edit.html.erb")
  end

  def update
    @tasting = Tasting.find(params[:id])

    @tasting.cheeses_id = params[:cheeses_id]
    @tasting.user_id = params[:user_id]
    @tasting.location = params[:location]
    @tasting.notes = params[:notes]
    @tasting.producers_id = params[:producers_id]
    @tasting.rating = params[:rating]

    save_status = @tasting.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/tastings/#{@tasting.id}/edit", "/update_tasting"
        redirect_to("/tastings/#{@tasting.id}", :notice => "Tasting updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Tasting updated successfully.")
      end
    else
      render("tastings/edit.html.erb")
    end
  end

  def destroy
    @tasting = Tasting.find(params[:id])

    @tasting.destroy

    if URI(request.referer).path == "/tastings/#{@tasting.id}"
      redirect_to("/", :notice => "Tasting deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Tasting deleted.")
    end
  end
end
