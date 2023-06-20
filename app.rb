# frozen_string_literal: true

class App < Roda
  plugin :json, classes: [Array, Hash]#, Sequel::Model]

  route do |r|
    r.root do
      { status: 'ok' }
    end
  end
end
