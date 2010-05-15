class GalerieController < ApplicationController
  def index

    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([75.5,-42.56],4)
    @map.overlay_init(GMarker.new([75.6,-42.467],:title => "Hello", :info_window => "Info! Info!"))

    @galerie = Galeria.all
    
    if params[:search]
      @zdjecia = Zdjecie.tagged_with(params[:search], :on => :tags)
      tag_cloud
      
    else
      @zdjecia = Zdjecie.all
      tag_cloud
    end
  end
  
  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
  
  
  def show
    @galeria = Galeria.find(params[:id])
  end
  
    def dodaj_kasuj
    @galeria = Galeria.find(params[:id])
  end
  
  def new
    @galeria = Galeria.new
  end
  
  def create
    @galeria = Galeria.new(params[:galeria])
    if @galeria.save
      flash[:notice] = "Utworzono nową galerię."
      redirect_to @galeria
    else
      render :action => 'new'
    end
  end
  
  def edit
    @galeria = Galeria.find(params[:id])
  end
  
  def update
    @galeria = Galeria.find(params[:id])
    if @galeria.update_attributes(params[:galeria])
      flash[:notice] = "Zaktualizowano galerię."
      redirect_to @galeria
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @galeria = Galeria.find(params[:id])
    @galeria.destroy
    flash[:notice] = "Usunięto galerię."
    redirect_to galerie_url
  end
  
    
end
