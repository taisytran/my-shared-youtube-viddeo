# frozen_string_literal: true

unless User.any?
  user = User.new(email: 'tai.tran@gmail.com', password: 'password')
  user.save!
end

unless Video.any?
  begin
    url = 'https://www.youtube.com/watch?v=o_lN37OAJ9U'

    yt_url = Yt::URL.new url
    yt_video = Yt::Video.new id: yt_url&.id
    video = Video.new(url: url)

    video.uid = yt_video.id
    video.title = yt_video.title
    video.description = yt_video.description
    video.likes = yt_video.like_count
    video.dislikes = yt_video.dislike_count
    video.user = User.first

    video.save!
  rescue StandardError => exception
    nil
  end
end
