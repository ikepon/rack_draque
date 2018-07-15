def draque(arg)
  return 200, {'one' => '1', 'Content-Type' => 'text/plain'}, "Welcome to the World of Draque!!".chars
end

run method(:draque)
