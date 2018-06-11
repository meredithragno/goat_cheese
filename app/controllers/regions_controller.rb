class RegionsController < ApplicationController
  def index
    @regions = Region.all

    render("regions/index.html.erb")
  end

  def show
    @region = Region.find(params[:id])

    render("regions/show.html.erb")
  end

  def new
    @region = Region.new

    render("regions/new.html.erb")
  end

  def create
    @region = Region.new

    @region.address = params[:address]
    @region.name = params[:name]

    save_status = @region.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/regions/new", "/create_region"
        redirect_to("/regions")
      else
        redirect_back(:fallback_location => "/", :notice => "Region created successfully.")
      end
    else
      render("regions/new.html.erb")
    end
  end

  def edit
    @region = Region.find(params[:id])

    render("regions/edit.html.erb")
  end

  def update
    @region = Region.find(params[:id])

    @region.address = params[:address]
    @region.name = params[:name]

    save_status = @region.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/regions/#{@region.id}/edit", "/update_region"
        redirect_to("/regions/#{@region.id}", :notice => "Region updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Region updated successfully.")
      end
    else
      render("regions/edit.html.erb")
    end
  end

  def destroy
    @region = Region.find(params[:id])

    @region.destroy

    if URI(request.referer).path == "/regions/#{@region.id}"
      redirect_to("/", :notice => "Region deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Region deleted.")
    end
  end
end
