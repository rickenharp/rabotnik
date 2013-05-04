class KeywordsController < ApplicationController
  # GET /keywords
  # GET /keywords.json
  before_filter :set_project

  def set_project
    if params['project_id']
      @project = Project.find(params['project_id'])
    end
  end
  def index
    @keywords = @project.keywords.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @keywords }
    end
  end

  # GET /keywords/1
  # GET /keywords/1.json
  def show
    @keyword = Keyword.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @keyword }
    end
  end

  # GET /keywords/new
  # GET /keywords/new.json
  def new
    @keyword = @project.keywords.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @keyword }
    end
  end

  # GET /keywords/1/edit
  def edit
    @keyword = @project.keywords.find(params[:id])
  end

  # POST /keywords
  # POST /keywords.json
  def create
    
    @keyword = @project.keywords.build(params[:keyword])

    respond_to do |format|
      if @keyword.save
        format.html { redirect_to [@project, @keyword], notice: 'Keyword was successfully created.' }
        format.json { render json: @keyword, status: :created, location: [@project, @keyword] }
      else
        format.html { render action: "new" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /keywords/1
  # PUT /keywords/1.json
  def update
    @keyword = @project.keywords.find(params[:id])

    respond_to do |format|
      if @keyword.update_attributes(params[:keyword])
        format.html { redirect_to [@project, @keyword], notice: 'Keyword was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy
    @keyword = @project.keywords.find(params[:id])
    @keyword.destroy

    respond_to do |format|
      format.html { redirect_to project_keywords_url(@project) }
      format.json { head :no_content }
    end
  end

  def cluster
    Resque.enqueue(ClusterJob,@project.id)
    redirect_to project_keywords_url(@project), :notice => "Project is being clustered"
  end
end
