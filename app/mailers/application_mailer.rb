class ApplicationMailer < ActionMailer::Base
  default from: 'do_not_answer@dani-and-manu.info'
  layout 'mailer'

  def new_request(request_id)
    @request = Request.find_by(id: request_id)
    @user = @request.user
    @ride = @request.ride
    @owner = @ride.owner

    mail(to: @owner.email,  subject: "#{@user.first_name} #{@user.last_name} sent you a request for the ride #{@ride.origin} -> #{@ride.destination}!")
  end
end
