require 'test_helper'

class TemperaturesControllerTest < ActionController::TestCase
  setup do
    @temperature = temperatures(:one)
  end
  
  test "should route to temperature" do
    assert_routing '/temperatures/1', {:controller => "temperatures", :action => "show", :id => "1" }
  end
  
  test "should route to temperatures" do
    assert_routing '/temperatures', {:controller => "temperatures", :action => "index" }
  end
  
  test "should route to temperature edit" do
    assert_routing '/temperatures/1/edit', {:controller => "temperatures", :action => "edit", :id => "1" }
  end
  
  test "should route to temperature new" do
    assert_routing '/temperatures/new', {:controller => "temperatures", :action => "new" }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temperatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temperature" do
    assert_difference('Temperature.count') do
      post :create, temperature: @temperature.attributes
    end

    assert_redirected_to temperature_path(assigns(:temperature))
	assert_equal 'Temperature was successfully created.', flash[:notice]
  end

  test "should show temperature" do
    get :show, id: @temperature.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temperature.to_param
    assert_response :success
  end

  test "should update temperature" do
    put :update, id: @temperature.to_param, temperature: @temperature.attributes
    assert_redirected_to temperature_path(assigns(:temperature))
	assert_equal 'Temperature was successfully updated.', flash[:notice]
  end

  test "should destroy temperature" do
    assert_difference('Temperature.count', -1) do
      delete :destroy, id: @temperature.to_param
    end

    assert_redirected_to temperatures_path
  end
end
