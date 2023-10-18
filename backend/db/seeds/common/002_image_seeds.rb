# frozen_string_literal: true

avatar = 'Images::Avatar'

data = [
  {
    id: ENV.fetch('USER_AVATAR_DEFAULT'),
    type: avatar
  }
]

Image.import(
  data.map(&Image.method(:new)),
  on_duplicate_key_ignore: true
)
