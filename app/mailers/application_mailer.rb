class ApplicationMailer < ActionMailer::Base
  default from: "webmaster@ablog.dev"
  layout 'mailer'
end
