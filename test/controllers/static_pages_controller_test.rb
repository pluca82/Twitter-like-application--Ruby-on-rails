require 'test_helper'

def setup 
   @base_title = "Ruby On Rails Sample App"
end

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title" , "Ruby on Rails Sample App"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title" , "Help | Ruby on Rails  Sample App"
  end

  test "shoud get about" do 
    get about_path
    assert_response :success
    assert_select "title" , "About | Ruby on Rails Sample App"
  end 

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title" , "Contact | Ruby on Rails Sample App"
  end
end
