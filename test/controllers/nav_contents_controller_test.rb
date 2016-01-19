require 'test_helper'

class NavContentsControllerTest < ActionController::TestCase
  setup do
    @nav_content = nav_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nav_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nav_content" do
    assert_difference('NavContent.count') do
      post :create, nav_content: { content_id: @nav_content.content_id }
    end

    assert_redirected_to nav_content_path(assigns(:nav_content))
  end

  test "should show nav_content" do
    get :show, id: @nav_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nav_content
    assert_response :success
  end

  test "should update nav_content" do
    patch :update, id: @nav_content, nav_content: { content_id: @nav_content.content_id }
    assert_redirected_to nav_content_path(assigns(:nav_content))
  end

  test "should destroy nav_content" do
    assert_difference('NavContent.count', -1) do
      delete :destroy, id: @nav_content
    end

    assert_redirected_to nav_contents_path
  end
end
