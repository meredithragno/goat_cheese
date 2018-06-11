class ProducersController < ApplicationController
  def index
    @producers = Producer.page(params[:page]).per(10)

    render("producers/index.html.erb")
  end

  def show
    @tasting = Tasting.new
    @producer = Producer.find(params[:id])

    render("producers/show.html.erb")
  end

  def new
    @producer = Producer.new

    render("producers/new.html.erb")
  end

  def create
    @producer = Producer.new

    @producer.regions_id = params[:regions_id]
    @producer.name = params[:name]

    save_status = @producer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/producers/new", "/create_producer"
        redirect_to("/producers")
      else
        redirect_back(:fallback_location => "/", :notice => "Producer created successfully.")
      end
    else
      render("producers/new.html.erb")
    end
  end

  def edit
    @producer = Producer.find(params[:id])

    render("producers/edit.html.erb")
  end

  def update
    @producer = Producer.find(params[:id])

    @producer.regions_id = params[:regions_id]
    @producer.name = params[:name]

    save_status = @producer.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/producers/#{@producer.id}/edit", "/update_producer"
        redirect_to("/producers/#{@producer.id}", :notice => "Producer updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Producer updated successfully.")
      end
    else
      render("producers/edit.html.erb")
    end
  end

  def destroy
    @producer = Producer.find(params[:id])

    @producer.destroy

    if URI(request.referer).path == "/producers/#{@producer.id}"
      redirect_to("/", :notice => "Producer deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Producer deleted.")
    end
  end
end
