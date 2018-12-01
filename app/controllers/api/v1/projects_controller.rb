class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit]
  before_action :authorized, only: [:create, :edit]
  def index
    @projects = Project.all
    render json: @projects
  end
  def create
    @project = Project.create(project_params)
    @project.user = current_user
    if @project.save
      render json: { project: ProjectSerializer.new(@project) }, status: :created
    else
      render json: { error: 'failed to create project' }, status: :not_acceptable
    end
  end

  def show
    if find_project
      # render json: {project: @project, comments: {@project.comments, commenters: @project.commenters, voters: @project.voters} 
      render json: @project.to_json(include: {comments: { include: :user}})
    end
  end

  private
  def project_params
    params.require(:project).permit(:slug, :title, :description, :image, :github_url, :demo_url, :views)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end