require 'test_helper'

class ControlBarsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_bars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_bar" do
    assert_difference('ControlBar.count') do
      post :create, :control_bar => { }
    end

    assert_redirected_to control_bar_path(assigns(:control_bar))
  end

  test "should show control_bar" do
    get :show, :id => control_bars(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => control_bars(:one).to_param
    assert_response :success
  end

  test "should update control_bar" do
    put :update, :id => control_bars(:one).to_param, :control_bar => { }
    assert_redirected_to control_bar_path(assigns(:control_bar))
  end

  test "should destroy control_bar" do
    assert_difference('ControlBar.count', -1) do
      delete :destroy, :id => control_bars(:one).to_param
    end

    assert_redirected_to control_bars_path
  end
end
