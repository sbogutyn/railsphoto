class UzytkownikSessionsController < ApplicationController
  def new
    @uzytkownik_session = UzytkownikSession.new
  end

  def create
    @uzytkownik_session = UzytkownikSession.new(params[:uzytkownik_session])
    if @uzytkownik_session.save
      redirect_to galerie_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @uzytkownik_session = UzytkownikSession.find
    @uzytkownik_session.destroy
    redirect_to root_url
  end

end
