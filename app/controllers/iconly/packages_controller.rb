require_dependency 'iconly/application_controller'

module Iconly
  class PackagesController < ApplicationController
    before_action :require_sign_in
    before_action :set_package, only: :destroy

    def index
      @packages = current_user.packages.order(:name)
    end

    def new
      @package = Package.new
    end

    def create
      @package = current_user.packages.build(package_params)

      if @package.save
        redirect_to packages_url, notice: 'Package was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @package.destroy
      redirect_to packages_url, notice: 'Package was successfully destroyed.'
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
