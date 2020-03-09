module Slack
    class Bot < SlackRubyBot::Bot
        # BASE_URL = "https://swagger-apis.herokuapp.com"
        # DEFAULT_LIMIT = 10
    
        help do
            title "get_last_api"
            desc ""
    
            command :get_latest_api do
                title "get latest api"
                desc "gets the latest api form docs"
                long_desc "gets the latest api form docs"
            end
            
            title "get"
            desc "search api's"

            command :get do
                title "search command"
                desc "gets all the apis based on the keyword"
            end
        end
    end
end
