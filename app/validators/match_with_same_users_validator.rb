class MatchWithSameUsersValidator < ActiveModel::Validator
  def validate(record)
    if is_there_match_with_users?(record.matcher, record.matchee)
      record.errors.add(:base, "It's not possible to add another Match with same users")
    end
  end


  private


  def is_there_match_with_users?(matcher, matchee)
    matches = Match.where('(matcher_id = :matcher AND matchee_id = :matchee) OR (matcher_id = :matchee AND matchee_id = :matcher)', 
                            matcher: matcher.id, matchee: matchee.id)
    matches.exists?
  end
end