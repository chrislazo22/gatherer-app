require 'rails_helper'

RSpec.describe CreatesProject do
  it "creates a project given a name" do
    creator = CreatesProject.new(name: "Project Qarth")
    creator.build
    expect(creator.project.name).to eq("Project Qarth")
  end
end
