require 'test_helper'

class VendingMachinesControllerTest < ActionController::TestCase
  setup do
    @vending_machine = vending_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vending_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vending_machine" do
    assert_difference('VendingMachine.count') do
      post :create, vending_machine: {  }
    end

    assert_redirected_to vending_machine_path(assigns(:vending_machine))
  end

  test "should show vending_machine" do
    get :show, id: @vending_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vending_machine
    assert_response :success
  end

  test "should update vending_machine" do
    patch :update, id: @vending_machine, vending_machine: {  }
    assert_redirected_to vending_machine_path(assigns(:vending_machine))
  end

  test "should destroy vending_machine" do
    assert_difference('VendingMachine.count', -1) do
      delete :destroy, id: @vending_machine
    end

    assert_redirected_to vending_machines_path
  end
end
