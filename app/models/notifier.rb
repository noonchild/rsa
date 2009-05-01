
class Notifier < ActionMailer::Base
  def account_confirm( user )
    # Email header info MUST be added here
    recipients user.email
    from "webmail@rockstaralley.com"
    subject "Thank you for registering with RockStarAlley."
    body :activation_code => user.get_code
  end
  
end
