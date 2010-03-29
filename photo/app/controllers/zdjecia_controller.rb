class ZdjeciaController < ApplicationController
  def index
    @zdjecia = Zdjecie.all
  end
  
  def show
    @zdjecie = Zdjecie.find(params[:id])
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
