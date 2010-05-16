require 'test_helper'

class MarkeryControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:markery)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create marker" do
    assert_difference('Marker.count') do
      post :create, :marker => { }
    end

    assert_redirected_to marker_path(assigns(:marker))
  end

  test "should show marker" do
    get :show, :id => markery(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => markery(:one).to_param
    assert_response :success
  end

  test "should update marker" do
    put :update, :id => markery(:one).to_param, :marker => { }
    assert_redirected_to marker_path(assigns(:marker))
  end

  test "should destroy marker" do
    assert_difference('Marker.count', -1) do
      delete :destroy, :id => markery(:one).to_param
    end

    assert_redirected_to markery_path
  end
end
