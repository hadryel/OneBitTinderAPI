class MatchNotificationJob < ApplicationJob
  queue_as :default

  def perform(match)
    send_notification(match.matcher, match.matchee)
    send_notification(match.matchee, match.matcher)
  end


  private


  def send_notification(user, match_with)
    MatchNotificationChannel.broadcast_to "match_notification_#{user.id}",
      message: "Você deu um Match com #{match_with.name}"
  end
end
