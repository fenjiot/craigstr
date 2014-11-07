class Admin::RegionsController < Admin::BaseController
  def index
    @regions = Region.all
  end
end
