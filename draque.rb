module Draque
  @@routes = { get:{} }

  def draque(env)
    path = env['PATH_INFO']
    if res = @@routes[:get][path]
      res.call(env)
    else
      [ 404, headers, not_found ]
    end
  end

  def get(path, &blk)
    @@routes[:get][path] = blk
  end
end

Object.send(:include, Draque)

get '/draque' do
  [ 200, headers, draque_body ]
end

get '/' do |env|
  [ 200, headers, top_body(env) ]
end

def headers
  {'Content-Type' => 'text/html'}
end

def top_body(env)
  ["<h1>Welcome to the World of Draque!!</h1>"] +
    env.map { |k,v| "<p>%s => %s</p>" % [k, v] }
end

def draque_body
  ["<img src='http://www.dqx.jp/storage/img/top/main_visual.png'>"]
end

def not_found
  ["<img src='https://a248.e.akamai.net/assets.github.com/images/modules/404/parallax_octocat.png?1329921026'>", "<img src='https://a248.e.akamai.net/assets.github.com/images/modules/404/parallax_errortext.png?1329921026'>"]
end
