class ApplicationMailerPreview < ActionMailer::Preview
  def new_request
    request = Request.all.sample
    raise "No Request Found!" unless request.present?
    ApplicationMailer.new_request(request.id)
  end
end


