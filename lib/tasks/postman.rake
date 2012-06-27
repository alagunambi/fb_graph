require 'rack/oauth2'

namespace :postman do
  desc "Send message"
  task :send => :environment do
    @messages = Parcel.where("schedule <= ?", Time.now)
    if @messages != nil
      @messages.each do |message|
        if message.status != 1
          p "status success"
          if message.category == 2
            p "category success"
            app = FbGraph::Application.new(Facebook.config[:client_id], :secret => Facebook.config[:client_secret])
            app.get_access_token
            user = FbGraph::User.new(message.from, :access_token => app.access_token)
            user = user.fetch
            # client = Facebook# .auth(callback_facebook_url).client
            # client.authorization_code = params[:code]
            # access_token = client.access_token! :client_auth_body
            # user = FbGraph::User.me(access_token).fetch
            # authenticate Facebook.identify(user)

             user.feed!(
             :message => message.message,
             :link => "https://www.udproducts.in",
             :picture => "http://udproducts.in/sites/default/files/pl.jpg",
             :description => "We, at UDProducts can create, deploy and maintain customized applications which can be capitalized to improve your business solutions. We develop feature rich applications considering the industry standards and industry evolution which..",
             :name => message.title
           )
            # for to in message.contact_lists.map(&:contact)
              
              # Postman.fb_message(message.user.email, message.to, message.body).deliver
              # puts "Sending to " + to
            # end
              message.status = 1
            if message.save
              puts "Mail sent and status update"
            else
              puts "Mail sent failed! "
            end
          else
            #else part
          end
        end
      end
    else
    	puts "Onnume ila!!"
    end
  end
end






