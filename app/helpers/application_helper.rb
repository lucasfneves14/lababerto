module ApplicationHelper
	def profile_avatar_select(user)
	  return image_tag user.attachment.url,
	                   id: 'image-preview',
	                   class: 'img-responsive rounded-circle profile-image' if user.attachment.present?
	  image_tag 'user.jpg', id: 'image-preview',
	                                  class: 'img-responsive rounded-circle profile-image'
	end
end
