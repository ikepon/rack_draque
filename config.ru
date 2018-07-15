require "./draque"

class UpDown
  def initialize(app)
    @app = app
  end

  def call(env)
    @app.call(env)
  end
end

use UpDown

run method(:draque)
