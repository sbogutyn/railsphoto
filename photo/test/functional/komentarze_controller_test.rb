require 'test_helper'

class KomentarzeControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Komentarz.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Komentarz.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Komentarz.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to komentarz_url(assigns(:komentarz))
  end
  
  def test_edit
    get :edit, :id => Komentarz.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Komentarz.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Komentarz.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Komentarz.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Komentarz.first
    assert_redirected_to komentarz_url(assigns(:komentarz))
  end
  
  def test_destroy
    komentarz = Komentarz.first
    delete :destroy, :id => komentarz
    assert_redirected_to komentarze_url
    assert !Komentarz.exists?(komentarz.id)
  end
end
