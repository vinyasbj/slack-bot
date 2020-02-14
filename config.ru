$LOAD_PATH.unshift(File.dirname(__FILE__))
require "dotenv"

Dotenv.load

require "slack_bot"

Slack::Bot.run