class KomentarzeController < ApplicationController
before_filter :require_user, :except => [:show, :index, :create, :new]
  
  def index
    @komentarze = Komentarz.all
  end
  
  def show
    @komentarz = Komentarz.find(params[:id])
  end
  
  def new
    @komentarz = Komentarz.new
  end
  
  def create
    @zdjecie = Zdjecie.find(params[:zdjecie_id])
    @komentarz = @zdjecie.komentarze.create!(params[:komentarz])
    redirect_to @zdjecie
  end

  
  def edit
    @komentarz = Komentarz.find(params[:id])
  end
  
  def update
    @komentarz = Komentarz.find(params[:id])
    if @komentarz.update_attributes(params[:komentarz])
      flash[:notice] = "Komentarz zaktualizowany."
      redirect_to @komentarz
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @komentarz = Komentarz.find(params[:id])
    @komentarz.destroy
    flash[:notice] = "Komentarz został usunięty."
    redirect_to komentarze_url
  end
end
