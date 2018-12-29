module SelectionListService
  def self.call(user, page: 1)
    @current_user = user
    @page = page
    users = load_selection_list
    users += [user_that_liked_me] if user_that_liked_me
    users.uniq
  end


  private


  def self.load_selection_list
    except_users = liked_users + users_didnt_like_me + [@current_user.id]
    User.where.not(id: except_users)
        .where("#{distance_formula} < 15000")
        .select("users.*, #{distance_formula} as distance")
        .paginate(page: @page, per_page: 10)
  end


  def self.liked_users
    @current_user.likes_given.map { |like| like.likee.id }
  end


  def self.users_didnt_like_me
    @current_user.likes_earned.where(liked: false).map { |like| like.liker.id }
  end


  def self.distance_formula
    "ST_Distance_sphere(st_makepoint(users.longitude, users.latitude), 
                        st_makepoint(#{@current_user.longitude}, #{@current_user.latitude}))"
  end


  def self.user_that_liked_me
    User.includes(:likes_given)
        .where(likes: { likee_id: @current_user.id, liked: true })
        .where.not(id: liked_users)
        .select("users.*, #{distance_formula} as distance")
        .first
  end
end