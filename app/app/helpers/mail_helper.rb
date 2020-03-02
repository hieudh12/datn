require 'sendgrid-ruby'
require 'json'

module MailHelper
  include SendGrid

  def hello_world
    from = Email.new(email: 'test@example.com')
    subject = 'Hello World from the Twilio SendGrid Ruby Library'
    to = Email.new(email: 'ltlinh3111@gmail.com')
    content = Content.new(type: 'text/plain', value: 'some text here')
    mail = SendGrid::Mail.new(from, subject, to, content)
    # puts JSON.pretty_generate(mail.to_json)
    puts mail.to_json

    sg = SendGrid::API.new(api_key: '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', host: 'https://api.sendgrid.com')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end

  def reset_password user
    from = Email.new(email: 'recipe@info.com')
    subject = 'Reset your password for recipe'
    to = Email.new(email: user.email)
    value = render_to_string(:action => "reset_password_instructions", :layout => false, :assigns => { user: user })
    content = Content.new(type: 'text/html', value: value)
    mail = SendGrid::Mail.new(from, subject, to, content)
    # puts JSON.pretty_generate(mail.to_json)
    puts mail.to_json

    sg = SendGrid::API.new(api_key: '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', host: 'https://api.sendgrid.com')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
  end
end
