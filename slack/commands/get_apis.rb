require "httparty"
module Slack
    module Commands
        class GetApis < SlackRubyBot::Commands::Base
            command 'get_last_api' do |client, data, _match|
                response = HTTParty.get('https://swagger-apis.herokuapp.com/latest_api')
                id = response.parsed_response["request"]["id"]
                title = response.parsed_response["request"]["title"]
                project = response.parsed_response["request"]["collection_name"]
                link = "https://api-docs.vinyas.im/try_request/#{id}"

                client.say(channel: data.channel,text: "Latest Api is #{title} from #{project} \n #{link}")
            end

            command 'say_hello' do |client, data, _match|
                client.say(channel: data.channel, text: HelloText.say_hello)
            end

            command 'say' do |client, data, _match|
                client.say(channel: data.channel, text: "You Said#{_match[:expression]}")
            end

            command 'get' do |client ,data, _match|
                response = HTTParty.get("https://swagger-apis.herokuapp.com/search_requests?search=#{_match[:expression]}")
                @text = []
                response.parsed_response["requests"].each do |res|
                    id = res["id"]
                    title = res["title"]
                    project = res["collection_name"]
                    link = "https://api-docs.vinyas.im/try_request/#{id}"
                    @text << "#{title} from #{project} \n #{link} \n"
                end
                client.say(channel: data.channel,text: @text.to_sentence )
            end

        end
    end
end

class HelloText
    def self.say_hello
      'Hello! This is a Bot!'
    end
end