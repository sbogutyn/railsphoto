class GalerieController < ApplicationController
before_filter :require_user, :except => [:show]
  def index
    @galerie = Galeria.all(:conditions => {:autor => current_user[:login] } ,:include => :zdjecia)
  end
  
  def tag
    @zdjecia = Zdjecie.tagged_with(params[:id], :on => :tags)
    tag_cloud
  end

  def tag_cloud
    @tags = Zdjecie.tag_counts_on(:tags)
  end  
  
  
  def show
    if current_user
      @galerie = Galeria.all(:conditions => {:autor => current_user[:login] }, :include => :zdjecia)
    end
    @galeria = Galeria.find(params[:id], :include => :zdjecia)
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
