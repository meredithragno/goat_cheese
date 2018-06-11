class CheesesController < ApplicationController
  def index
    @q = Cheese.ransack(params[:q])
    @cheeses = @q.result(:distinct => true).includes(:tastings, :users, :regions, :producers).page(params[:page]).per(10)

    render("cheeses/index.html.erb")
  end

  def show
    @tasting = Tasting.new
    @cheese = Cheese.find(params[:id])

    render("cheeses/show.html.erb")
  end

  def new
    @cheese = Cheese.new

    render("cheeses/new.html.erb")
  end

  def create
    @cheese = Cheese.new

    @cheese.name = params[:name]
    @cheese.milk = params[:milk]
    @cheese.age = params[:age]
    @cheese.variety = params[:variety]
    @cheese.regions_id = params[:regions_id]
    @cheese.producers_id = params[:producers_id]

    save_status = @cheese.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheeses/new", "/create_cheese"
        redirect_to("/cheeses")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheese created successfully.")
      end
    else
      render("cheeses/new.html.erb")
    end
  end

  def edit
    @cheese = Cheese.find(params[:id])

    render("cheeses/edit.html.erb")
  end

  def update
    @cheese = Cheese.find(params[:id])

    @cheese.name = params[:name]
    @cheese.milk = params[:milk]
    @cheese.age = params[:age]
    @cheese.variety = params[:variety]
    @cheese.regions_id = params[:regions_id]
    @cheese.producers_id = params[:producers_id]

    save_status = @cheese.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cheeses/#{@cheese.id}/edit", "/update_cheese"
        redirect_to("/cheeses/#{@cheese.id}", :notice => "Cheese updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cheese updated successfully.")
      end
    else
      render("cheeses/edit.html.erb")
    end
  end

  def destroy
    @cheese = Cheese.find(params[:id])

    @cheese.destroy

    if URI(request.referer).path == "/cheeses/#{@cheese.id}"
      redirect_to("/", :notice => "Cheese deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cheese deleted.")
    end
  end
end
