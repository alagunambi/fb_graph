class Postman < ActionMailer::Base

  def fb_message(from, to, message) 
    mail(:to => to, :from => from, :subject => "Your friend has sent you a message through PlanLater", :body => message) 
  end

end
