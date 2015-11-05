require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup                                                              # set up definition
    @user = User.new(name: "Example User", email: "user@example.com",    #defines user and email
                 password: "foobar", password_confirmation: "foobar")    #defines password
  end
  
  test "should be valid" do                                             # test "the truth" do
    assert @user.valid?                                                 # assert true
  end                                                                   # end
  
  test "name should be present" do                                      # test name
    @user.name = "     "                                                # test presence
    assert_not @user.valid?                                             # assert truth
  end
  
  test "email should be present" do                                     # test email
    @user.email = "     "                                               # test presence
    assert_not @user.valid?                                             # assert truth
  end
  
  test "name should not be too long" do                                 # test name length
    @user.name = "a" * 51                                               # test for > 51 characters
    assert_not @user.valid?                                             # assert truth
  end
  
  test "email validation should reject invalid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email addresses should be unique" do                            # test for user dups
    duplicate_user = @user.dup                                          # define dups
    duplicate_user.email = @user.email.upcase                           # case insensitivity
    @user.save                                                          # action
    assert_not duplicate_user.valid?                                    # assert truth
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid
  end

end