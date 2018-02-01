require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup 
    @category = Category.new(name: "sports")
    @user = User.new(username: "John", email: "this@isa.test", password: "password", admin: true)
  end
  
  test "category should be valid" do
    sign_in_as(@user,"password")
    assert @category.valid?
  end
  
  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
end