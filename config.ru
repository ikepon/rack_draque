def draque(env)
  return 200, {'one' => '1', 'Content-Type' => 'text/html'}, body(env)
end

def body(env)
  ["<h1>Welcome to the World of Draque!!</h1>"] +
    env.map { |k,v| "<p>%s => %s</p>" % [k, v] }
end

run method(:draque)
