require 'test_helper'

class KategorieControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Kategoria.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Kategoria.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Kategoria.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to kategoria_url(assigns(:kategoria))
  end
  
  def test_edit
    get :edit, :id => Kategoria.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Kategoria.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Kategoria.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Kategoria.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Kategoria.first
    assert_redirected_to kategoria_url(assigns(:kategoria))
  end
  
  def test_destroy
    kategoria = Kategoria.first
    delete :destroy, :id => kategoria
    assert_redirected_to kategorie_url
    assert !Kategoria.exists?(kategoria.id)
  end
end
