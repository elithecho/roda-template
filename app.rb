# frozen_string_literal: true

class App < Roda
  plugin :json, classes: [Array, Hash]#, Sequel::Model]

  route do |r|
    # r.public
    # r.assets

    r.root do
      { status: APP_ENV }
    end
  end
end
