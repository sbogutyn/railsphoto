class UzytkownicyController < ApplicationController
  def new
    @uzytkownik = Uzytkownik.new
  end
  
  def create
    @uzytkownik = Uzytkownik.new(params[:uzytkownik])
    if @uzytkownik.save
      flash[:notice] = "Rejestracja zakończona pomyślnie."
      redirect_to root_url
    else
      render :action => 'new'
    end  
  end

  def edit
    @uzytkownik = current_user
  end

  def update
    @uzytkownik = current_user
    if @uzytkownik.update_attributes(params[:uzytkownik])
      flash[:notice] = "Pomyślna edycja profilu."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end

end
