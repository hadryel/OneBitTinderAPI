class MatchNotificationJob < ApplicationJob
  queue_as :default

  def perform(like)
    puts "Liker = #{like.liker.name}"
    puts "Likee = #{like.likee.name}"
  end
end
