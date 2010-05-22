class KategorieController < ApplicationController
before_filter :require_user, :except => [:show, :index]
 
  def index
    @kategorie = Kategoria.all
    @pierwsza = Kategoria.find(1 , :include => [:zdjecia])
  end
  
  def show
    @kategorie = Kategoria.all
    @wybrana = Kategoria.find(params[:id], :include => [:zdjecia])
  end
  
  def new
    @kategoria = Kategoria.new
  end
  
  def create
    @kategoria = Kategoria.new(params[:kategoria])
    if @kategoria.save
      flash[:notice] = "Successfully created kategoria."
      redirect_to @kategoria
    else
      render :action => 'new'
    end
  end
  
  def edit
    @kategoria = Kategoria.find(params[:id])
  end
  
  def update
    @kategoria = Kategoria.find(params[:id])
    if @kategoria.update_attributes(params[:kategoria])
      flash[:notice] = "Successfully updated kategoria."
      redirect_to @kategoria
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @kategoria = Kategoria.find(params[:id])
    @kategoria.destroy
    flash[:notice] = "Successfully destroyed kategoria."
    redirect_to kategorie_url
  end
end
