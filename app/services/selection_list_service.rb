class SelectionListService
  def self.call(user)
    instance = self.new(user)
    instance.load_selection_list
  end


  def load_selection_list
    users = new_users_near_me
    users += [user_that_liked_me] if user_that_liked_me
    users.uniq
  end


  private


  def initialize(current_user)
    @current_user = current_user
  end


  def new_users_near_me
    except_users = liked_users + users_didnt_like_me + [@current_user.id]
    User.where.not(id: except_users)
        .where("#{distance_formula} < 15000")
        .select("users.*, #{distance_formula} as distance")
        .limit(10)
  end


  def liked_users
    @current_user.likes_given.map { |like| like.likee.id }
  end


  def users_didnt_like_me
    @current_user.likes_earned.where(liked: false).map { |like| like.liker.id }
  end


  def distance_formula
    "ST_Distance_sphere(st_makepoint(users.longitude, users.latitude), 
                        st_makepoint(#{@current_user.longitude}, #{@current_user.latitude}))"
  end


  def user_that_liked_me
    User.joins(:likes_given)
        .where(likes: { likee_id: @current_user.id, liked: true })
        .where.not(id: liked_users)
        .select("users.*, #{distance_formula} as distance")
        .first
  end
end