class ClusterProject

  attr_reader :project

  def initialize(project)
    @project = project
  end
  
  def cluster
    keywords = @project.keywords.all
    Parallel.each(keywords) do |keyword|
      ActiveRecord::Base.connection.reconnect!
      keyword.cluster!
    end
  end
end
