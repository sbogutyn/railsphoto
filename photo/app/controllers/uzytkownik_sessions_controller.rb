class UzytkownikSessionsController < ApplicationController
  def new
    @uzytkownik_session = UzytkownikSession.new
  end

  def create
    @uzytkownik_session = UzytkownikSession.new(params[:uzytkownik_session])
    if @uzytkownik_session.save
      flash[:notice] = "Jesteś zalogowany."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @uzytkownik_session = UzytkownikSession.find
    @uzytkownik_session.destroy
    flash[:notice] = "Jesteś wylogowany."
    redirect_to root_url
  end

end
