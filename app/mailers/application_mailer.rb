# ApplicationMailerクラスは、メール送信に関連する機能を提供します。
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
