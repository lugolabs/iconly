require_dependency 'iconly/application_controller'

module Iconly
  class PackagesController < ApplicationController
    before_action :require_sign_in
    before_action :set_package, only: :destroy

    def index
      @packages = Icon.all_packages(current_user.id, params[:q])
    end

    def new
      @package = Package.new
    end

    def create
      @package = current_user.packages.build(package_params)

      if @package.save
        redirect_to packages_url, notice: 'Great, more new shiny icons in the bag!'
      else
        render :new
      end
    end

    def share
      @package.update(shared: !@package.shared)
    end

    def destroy
      @package.destroy
      redirect_to packages_url, notice: 'Package is now gone'
    end

    private

    def set_package
      @package = current_user.packages.friendly.find(params[:id])
    end

    def package_params
      params.require(:package).permit(:name, :shared)
    end
  end
end
