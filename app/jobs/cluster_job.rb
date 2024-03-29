class ClusterJob
  @queue = :default

  def self.perform(project_id)
    project = Project.find(project_id)
    clusterer = ClusterProject.new(project)
    clusterer.cluster
    project.finish_clustering
  end
end
