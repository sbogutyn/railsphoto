require 'test_helper'

class GalerieControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Galeria.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Galeria.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Galeria.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to galeria_url(assigns(:galeria))
  end
  
  def test_edit
    get :edit, :id => Galeria.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Galeria.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Galeria.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Galeria.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Galeria.first
    assert_redirected_to galeria_url(assigns(:galeria))
  end
  
  def test_destroy
    galeria = Galeria.first
    delete :destroy, :id => galeria
    assert_redirected_to galerie_url
    assert !Galeria.exists?(galeria.id)
  end
end
