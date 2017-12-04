require 'rails_helper'

RSpec.describe Project do
  let(:project) { Project.new }
  let(:task) { Task.new }

  it "considers a project with no tasks to be done" do
    expect(project).to be_done
  end

  it "knows that a project with an incomplete task is not done" do
    project.tasks << task.complete?
    expect(project).to_not be(nil)
  end

  it "marks a project done if the tasks are done" do
    project.tasks << task
    task.mark_completed
    expect(project).to be_done
  end

  describe "estimates" do
    let(:project) { Project.new }
    let(:done) { Task.new(size:2, completed_at: true) }
    let(:small_not_done) { Task.new(size:1) }
    let(:large_not_done) { Task.new(size: 4) }

    before(:example) do
      project.tasks = [done, small_not_done, large_not_done]
    end

    it "can calculate total size" do
      expect(project.total_size).to eq(7)
    end

    it "can clculate remaining size" do
      expect(project.remaining_size).to eq(5)
    end
  end
end
