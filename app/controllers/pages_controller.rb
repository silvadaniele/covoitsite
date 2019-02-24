class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :validate_complete_user!

  def legal_mentions; end
end
