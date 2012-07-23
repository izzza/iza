module CommentsHelper

  def find_user(id)
    user = User.find(id)
    return user
  end
end
