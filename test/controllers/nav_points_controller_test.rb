require 'test_helper'

class NavPointsControllerTest < ActionController::TestCase
  setup do
    @nav_point = nav_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nav_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nav_point" do
    assert_difference('NavPoint.count') do
      post :create, nav_point: { lat: @nav_point.lat, long: @nav_point.long, nav_content_id: @nav_point.nav_content_id }
    end

    assert_redirected_to nav_point_path(assigns(:nav_point))
  end

  test "should show nav_point" do
    get :show, id: @nav_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nav_point
    assert_response :success
  end

  test "should update nav_point" do
    patch :update, id: @nav_point, nav_point: { lat: @nav_point.lat, long: @nav_point.long, nav_content_id: @nav_point.nav_content_id }
    assert_redirected_to nav_point_path(assigns(:nav_point))
  end

  test "should destroy nav_point" do
    assert_difference('NavPoint.count', -1) do
      delete :destroy, id: @nav_point
    end

    assert_redirected_to nav_points_path
  end
end
