# Concurrency 

This example illustrates the use of fibers and channels. It's cooperative multitasking. 

```playground
ball = Channel(String).new
​
spawn do
  puts "I'm pitching..."
  ball.send("Toss")
  puts "I pitched it!"
end
​
puts "I'm waiting for a pitch..."
message = ball.receive
puts "I caught the #{message}!"
```