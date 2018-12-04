class MatchNotificationJob < ApplicationJob
  queue_as :default

  def perform(match)
    puts "Matcher = #{match.matcher.name}"
    puts "Matchee = #{match.matchee.name}"
  end
end
