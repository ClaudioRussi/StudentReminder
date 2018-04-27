require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "should not save a task without name" do
    task = Task.new description: "Task description", subject_id: subjects(:subject1).id
    assert_not task.save, "Saved the task without name"
  end

  test "should not save a task without description" do
    task = Task.new name: "Task name", subject_id: subjects(:subject1).id
    assert_not task.save, "Saved the task without description"
  end

  test "status should have a default value of 'Active'" do
    task = Task.new name: "Task name", description: "Task description", subject_id: subjects(:subject1).id
    task.save
    task = Task.find_by(name: 'Task name')
    assert (task.status == 'Active'), "Status default value is not Active"
  end

  test "should not save if a Subject is not specified" do
    task = Task.new name: "Task name", description: "Task description"
    assert_not task.save, "Saved the task when the Subject was not specified"
  end
end
