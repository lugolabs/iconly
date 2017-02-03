require_dependency 'iconly/application_controller'

module Iconly
  class PackagesController < ApplicationController
    before_action :set_package, only: :destroy

    def new
      store_path_after_create_package
      @package = Package.new
    end

    def create
      @package = current_user.packages.build(package_params)
      @package.icon_files_required = true

      if @package.save
        redirect_to path_after_create_package, notice: 'Great, more new shiny icons in the bag!'
      else
        render :new
      end
    end

    def share
      @package.update(shared: !@package.shared)
    end

    def destroy
      @package.destroy
      redirect_to (request.referer || projects_url), notice: 'Package is now gone'
    end

    private

    def set_package
      @package = current_user.packages.friendly.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:name, icon_files: [])
    end

    def store_path_after_create_package
      session.delete :path_after_create_package
      session[:path_after_create_package] = request.referer if request.referer.present?
    end

    def path_after_create_package
      session[:path_after_create_package] || projects_url
    end
  end
end
