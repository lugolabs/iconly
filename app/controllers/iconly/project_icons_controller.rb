require_dependency 'iconly/application_controller'

module Iconly
  class ProjectIconsController < ApplicationController
    before_action :set_project

    def create
      @project.project_icons.create(icon_id: params[:icon_id])
      head :no_content
    end

    def destroy
      project_icon = @project.project_icons.find_by(icon_id: params[:id])
      project_icon.destroy if project_icon
      head :no_content
    end

    private

    def set_project
      @project = current_user.projects.friendly.find(params[:project_id])
    end
  end
end
