module Slack
    module Commands
        class GetApis < SlackRubyBot::Commands::Base
            command 'get_last_api' do |client, data, _match|
                client.say(channel: data.channel,text: "this is test api")
            end

            command 'say_hello' do |client, data, _match|
                client.say(channel: data.channel, text: HelloText.say_hello)
            end

        end
    end
end

class HelloText
    def self.say_hello
      'Hello! This is a Bot!'
    end
end