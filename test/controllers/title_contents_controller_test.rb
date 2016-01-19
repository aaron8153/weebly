require 'test_helper'

class TitleContentsControllerTest < ActionController::TestCase
  setup do
    @title_content = title_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:title_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create title_content" do
    assert_difference('TitleContent.count') do
      post :create, title_content: { content_id: @title_content.content_id, title: @title_content.title }
    end

    assert_redirected_to title_content_path(assigns(:title_content))
  end

  test "should show title_content" do
    get :show, id: @title_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @title_content
    assert_response :success
  end

  test "should update title_content" do
    patch :update, id: @title_content, title_content: { content_id: @title_content.content_id, title: @title_content.title }
    assert_redirected_to title_content_path(assigns(:title_content))
  end

  test "should destroy title_content" do
    assert_difference('TitleContent.count', -1) do
      delete :destroy, id: @title_content
    end

    assert_redirected_to title_contents_path
  end
end
