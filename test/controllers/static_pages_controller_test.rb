require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = 'Il mondo di Silvia'
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select 'title', "Benvenuto | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select 'title', "Aiuto | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select 'title', "Informazioni | #{@base_title}"
  end
end
