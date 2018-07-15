require "./draque"

class UpDown
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [status, headers, body.reverse]
  end
end

class Fire
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    new_body = ["<div style='background-color:red'>"] + body + ["</div>"]
    [status, headers, new_body]
  end
end

use Fire

use UpDown

run method(:draque)
