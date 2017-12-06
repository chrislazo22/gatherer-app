class CreatesProject
  attr_accessor :name, :project

  def initialize(name)
    @name = ""
  end

  def build
    self.project = Project.new(name: "Project Qarth")
  end
end
