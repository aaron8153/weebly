require 'test_helper'

class ImageContentsControllerTest < ActionController::TestCase
  setup do
    @image_content = image_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_content" do
    assert_difference('ImageContent.count') do
      post :create, image_content: { content_id: @image_content.content_id, target: @image_content.target, uri: @image_content.uri }
    end

    assert_redirected_to image_content_path(assigns(:image_content))
  end

  test "should show image_content" do
    get :show, id: @image_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_content
    assert_response :success
  end

  test "should update image_content" do
    patch :update, id: @image_content, image_content: { content_id: @image_content.content_id, target: @image_content.target, uri: @image_content.uri }
    assert_redirected_to image_content_path(assigns(:image_content))
  end

  test "should destroy image_content" do
    assert_difference('ImageContent.count', -1) do
      delete :destroy, id: @image_content
    end

    assert_redirected_to image_contents_path
  end
end
