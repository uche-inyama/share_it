module UsersHelper
    def profile_pic(user)
        image_tag(user.photo, alt: user.fullname, class: 'profile-image')
      end
end