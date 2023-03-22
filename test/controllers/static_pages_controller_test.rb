require 'test_helper'

def setup 
   @base_title = "Ruby On Rails Sample App"
end

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title" , "Ruby on Rails Sample App"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title" , "Help | Ruby on Rails  Sample App"
  end

  test "shoud get about" do 
    get static_pages_about_url
    assert_response :success
    assert_select "title" , "About | Ruby on Rails Sample App"
  end 

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title" , "Contact | Ruby on Rails Sample App"
  end
end
