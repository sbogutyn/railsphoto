require 'test_helper'

class ZdjeciaControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Zdjecie.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Zdjecie.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Zdjecie.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to zdjecie_url(assigns(:zdjecie))
  end
  
  def test_edit
    get :edit, :id => Zdjecie.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Zdjecie.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Zdjecie.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Zdjecie.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Zdjecie.first
    assert_redirected_to zdjecie_url(assigns(:zdjecie))
  end
  
  def test_destroy
    zdjecie = Zdjecie.first
    delete :destroy, :id => zdjecie
    assert_redirected_to zdjecia_url
    assert !Zdjecie.exists?(zdjecie.id)
  end
end
