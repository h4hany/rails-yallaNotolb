require 'test_helper'

class OrdrsControllerTest < ActionController::TestCase
  setup do
    @ordr = ordrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordr" do
    assert_difference('Ordr.count') do
      post :create, ordr: { invited: @ordr.invited, joined: @ordr.joined, menu: @ordr.menu, ofrom: @ordr.ofrom, otype: @ordr.otype, status: @ordr.status, user_id: @ordr.user_id }
    end

    assert_redirected_to ordr_path(assigns(:ordr))
  end

  test "should show ordr" do
    get :show, id: @ordr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ordr
    assert_response :success
  end

  test "should update ordr" do
    patch :update, id: @ordr, ordr: { invited: @ordr.invited, joined: @ordr.joined, menu: @ordr.menu, ofrom: @ordr.ofrom, otype: @ordr.otype, status: @ordr.status, user_id: @ordr.user_id }
    assert_redirected_to ordr_path(assigns(:ordr))
  end

  test "should destroy ordr" do
    assert_difference('Ordr.count', -1) do
      delete :destroy, id: @ordr
    end

    assert_redirected_to ordrs_path
  end
end
