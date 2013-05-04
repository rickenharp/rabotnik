class KeywordImport
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def initialize(attributes = {})
    @keywords = attributes[:keywords]
    if attributes[:project]
      @project = attributes[:project]
    end
    if attributes[:project_id]
      @project = Project.find attributes[:project_id]
    end
  end

  def persisted?
    false
  end

  def keywords
    @keywords
  end

  def import
    @keywords.split("\n").compact.each do |keyword|
      @project.keywords.create(content: keyword)
    end
  end
end
