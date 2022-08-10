require "test_helper"

class MenuitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @menuitem = menuitems(:one)
  end

  test "should get index" do
    get menuitems_url
    assert_response :success
  end

  test "should get new" do
    get new_menuitem_url
    assert_response :success
  end

  test "should create menuitem" do
    assert_difference("Menuitem.count") do
      post menuitems_url, params: { menuitem: { menu_id: @menuitem.menu_id, name: @menuitem.name } }
    end

    assert_redirected_to menuitem_url(Menuitem.last)
  end

  test "should show menuitem" do
    get menuitem_url(@menuitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_menuitem_url(@menuitem)
    assert_response :success
  end

  test "should update menuitem" do
    patch menuitem_url(@menuitem), params: { menuitem: { menu_id: @menuitem.menu_id, name: @menuitem.name } }
    assert_redirected_to menuitem_url(@menuitem)
  end

  test "should destroy menuitem" do
    assert_difference("Menuitem.count", -1) do
      delete menuitem_url(@menuitem)
    end

    assert_redirected_to menuitems_url
  end
end
