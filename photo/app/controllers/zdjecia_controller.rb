class ZdjeciaController < ApplicationController

  def index
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
    @zdjecie = Zdjecie.find(params[:id])
    @komentarze = @zdjecie.komentarze.all
  end
  
  def new
    @zdjecie = Zdjecie.new
  end
  
  def create
    @zdjecie = Zdjecie.new(params[:zdjecie])
    if @zdjecie.save
      flash[:notice] = "Pomyślnie dodano zdjęcie!"
      redirect_to @zdjecie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @zdjecie = Zdjecie.find(params[:id])
  end
  
  def update
    @zdjecie = Zdjecie.find(params[:id])
    if @zdjecie.update_attributes(params[:zdjecie])
      flash[:notice] = "Pomyślnie zmieniono zdjęcie."
      redirect_to @zdjecie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @zdjecie = Zdjecie.find(params[:id])
    @zdjecie.destroy
    flash[:notice] = "Zdjęcie zostało zniszczone."
    redirect_to zdjecia_url
  end
end
