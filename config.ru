require "./draque"

class UpDown
  def initialize(arg)

  end

  def call(arg)
    return 200, {'Content-Type' => 'text/html'}, "Hello, from UpDown".chars
  end
end

use UpDown

run method(:draque)
