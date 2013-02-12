class BlocksController < ApplicationController
  unloadable

  before_filter :find_project,:authorize, :except=>[:edit_home]
  before_filter :require_admin, :only =>[:edit_home]

  def edit_overview
    list = OverviewBlock.find_all_by_project_id(@project)
    @current_blocks=list ? list.collect{|b| b.name} : []
    if request.post?
      blocks = params[:blocks]
      blocks = [] unless blocks
      to_remove = @current_blocks - blocks
      to_remove.each do |block|
        OverviewBlock.find_by_name_and_project_id(block, @project.id).destroy
      end
      to_add = blocks - @current_blocks
      to_add.each do |block|
        id = @project.id
        OverviewBlock.new(:project_id => id, :name=>block).save
      end
      redirect_to :controller => 'projects', :action=>'show', :id => @project
    end
  end

  def edit_home
    list = HomeBlock.find(:all)
    @current_blocks=list ? list.collect{|b| b.name} : []
    if request.post?
      blocks = params[:blocks]
      blocks = [] unless blocks
      to_remove = @current_blocks - blocks
      to_remove.each do |block|
        HomeBlock.find_by_name(block).destroy
      end
      to_add = blocks - @current_blocks
      to_add.each do |block|
        HomeBlock.new(:name=>block).save
      end
      redirect_to home_url
    end

  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end