require 'slack'

DaemonKit::Application.running! do |config|
  # Trap signals with blocks or procs
  # config.trap( 'INT' ) do
  #   # do something clever
  # end
  # config.trap( 'TERM', Proc.new { puts 'Going down' } )
end

CONFIG = DaemonKit::Config.load("config.yml")

Slack.configure do |config|
  config.token = CONFIG[:token]
end

auth = Slack.auth_test
DaemonKit.logger.fatal("Authentication Error") unless auth['ok']

client = Slack.realtime

client.on :hello do
  DaemonKit.logger.info("Successfully connected.")
end

client.on :message do |data|
  text = data['text']
  ticket_re = /\B[#]\d{5,6}\b/ #ticket numbers in the format #ddddd(d)

  if text && text != "" && ticket_re =~ text && data['user'] != CONFIG[:botname]
    DaemonKit.logger.info("Ticket # detected")
    match = ticket_re.match(text)
    ticket = match.to_s[1..-1]
    Slack.chat_postMessage channel: data['channel'], as_user: true, text: "Kace Ticket Link: <#{CONFIG[:domain]}/userui/ticket.php?ID=#{ticket}>"
    DaemonKit.logger.info("Kace URL Posted")
  end
end

client.start
