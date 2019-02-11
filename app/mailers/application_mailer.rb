class ApplicationMailer < ActionMailer::Base
  default from: 'do_not_answer@dani-and-manu.info'
  layout 'mailer'

  def new_request(request_id)

    @request = Request.find_by(id: request_id)
    @user = User.find_by(id: @request.user_id)
    @ride = Ride.find_by(id: @request.ride_id)
    @owner = User.find_by(id: @ride.owner_id)

    mail(to: @owner.email,  subject: "#{@user.first_name} #{@user.last_name} sent you a request for the ride #{@ride.origin} -> #{@ride.destination}!")
  end
end
