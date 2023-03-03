require "test_helper"

class ProfileusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profileuser = profileusers(:one)
  end

  test "should get index" do
    get profileusers_url, as: :json
    assert_response :success
  end

  test "should create profileuser" do
    assert_difference("Profileuser.count") do
      post profileusers_url, params: { profileuser: { avatar: @profileuser.avatar, birthdate: @profileuser.birthdate, firstname: @profileuser.firstname, lastname: @profileuser.lastname, phone: @profileuser.phone, user_id: @profileuser.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show profileuser" do
    get profileuser_url(@profileuser), as: :json
    assert_response :success
  end

  test "should update profileuser" do
    patch profileuser_url(@profileuser), params: { profileuser: { avatar: @profileuser.avatar, birthdate: @profileuser.birthdate, firstname: @profileuser.firstname, lastname: @profileuser.lastname, phone: @profileuser.phone, user_id: @profileuser.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy profileuser" do
    assert_difference("Profileuser.count", -1) do
      delete profileuser_url(@profileuser), as: :json
    end

    assert_response :no_content
  end
end
