require 'test_helper'

class StUsersControllerTest < ActionController::TestCase
  setup do
    @st_user = st_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:st_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create st_user" do
    assert_difference('StUser.count') do
      post :create, st_user: { height: @st_user.height, name: @st_user.name, sex: @st_user.sex, total_calorie_in: @st_user.total_calorie_in, total_calorie_out: @st_user.total_calorie_out, weight: @st_user.weight }
    end

    assert_redirected_to st_user_path(assigns(:st_user))
  end

  test "should show st_user" do
    get :show, id: @st_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @st_user
    assert_response :success
  end

  test "should update st_user" do
    patch :update, id: @st_user, st_user: { height: @st_user.height, name: @st_user.name, sex: @st_user.sex, total_calorie_in: @st_user.total_calorie_in, total_calorie_out: @st_user.total_calorie_out, weight: @st_user.weight }
    assert_redirected_to st_user_path(assigns(:st_user))
  end

  test "should destroy st_user" do
    assert_difference('StUser.count', -1) do
      delete :destroy, id: @st_user
    end

    assert_redirected_to st_users_path
  end
end
