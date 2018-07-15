class Fixnum
  def call(arg)
    return 200, {'one' => '1', 'Content-Type' => 'text/plain'}, "Welcome to ONE".chars
  end
end

run 1
