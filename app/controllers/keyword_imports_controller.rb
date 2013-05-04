class KeywordImportsController < ApplicationController

  before_filter :set_project

  def set_project
    @project = Project.find(params[:project_id]) 
  end

  def new
    @keyword_import = KeywordImport.new(:project => @project)
  end
  
  def create
    @keyword_import = KeywordImport.new(params[:keyword_import].merge(project: @project))
    if @keyword_import.import
      redirect_to [@project, @keywords], :notice => "Keywords imported"
    else
      render action: new
    end
  end
end
