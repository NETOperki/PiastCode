module UsersHelper
  def gravatar_for(user)
    id_hash = Digest::MD5::hexdigest(user.email.downcase)
    url = "https://gravatar.com/avatar/#{id_hash}?s=256"
    image_tag(url, alt: user.name, class: "gravatar")
  end
end
