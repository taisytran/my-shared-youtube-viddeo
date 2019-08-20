# frozen_string_literal: true

Yt.configure do |config|
  config.api_key = ENV.fetch('GOOGLE_API_KEY') { 'AIzaSyCo6WK0g9xmZQGKMluapAlgYV4zMUF10Sk' }
end
