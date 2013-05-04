class ClusterProject

  attr_reader :project

  def initialize(project)
    @project = project
  end
  
  def cluster
    keywords = @project.keywords.all
    keywords.each do |keyword|
      keyword.cluster!
    end
  end
end
