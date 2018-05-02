require 'test_helper'

class SubjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save a Subject without name" do
    subject = Subject.new description: 'This is the descrption of a sample subject', author_id: users(:user1).id
    assert_not subject.save, "Subject was saved without name"
  end

  test "should not save a Subject without description" do
    subject = Subject.new name:'Biology', author_id: users(:user1).id
    assert_not subject.save, "Subject was saved without description"
  end

  test "should not save a Subject without author" do
    subject = Subject.new description: 'This is the descrption of a sample subject', name:'Biology'
    assert_not subject.save, "Subject was saved without author"
  end
end
