require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = I18n.t 'application.title'
    @full_title = -> (name) { "#{I18n.t "static_pages.#{name}.title"} | #{@base_title}" }
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select 'title', @base_title
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select 'title', @full_title[:help]
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select 'title', @full_title[:about]
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select 'title', @full_title[:contact]
  end
end
