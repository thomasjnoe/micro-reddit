require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup 
  	@user = User.new(username: "TestUser", email: "testuser@testuser.biz")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "username should be present" do
  	@user.username = "       "
  	assert_not @user.valid?
  end

  test "username should not be longer than 50 characters" do
  	@user.username = "a" * 51
  	assert_not @user.valid?
  end

  test "username should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.username = @user.username.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "email should be present" do
    @user.email = "       "
    assert_not @user.valid?
  end

  test "email should not be longer than 255 characters" do
    @user.email = "a" * 255
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email validation should accept valid email addresses" do 
    valid_addresses = %w[valid@address.com ThIsIsVaLiD@tEsT.com
                         some_valid_address@something.gov.biz oh.no@lol.tv]
    valid_addresses.each do |v|
      @user.email = v
      assert @user.valid?, "#{v} should be a valid email address."
    end
  end

  test "email validation should reject invalid email addresses" do 
    invalid_addresses = %w[not_valid@address ThIsIsNotVaLiD@tEsT@
                         some_non_valid_address uhoh@comma,com plus@plus+plus.com]
    invalid_addresses.each do |i|
      @user.email = i
      assert_not @user.valid?, "#{i} should be an invalid email address."
    end
  end
end
