require "json"
require "open-uri"

def start_api
  puts "Please write the Github username."
  username = gets.chomp
  json = open("https://api.github.com/users/#{username}").read
  user = JSON.parse(json)
  # puts user
  puts "Info about this Github user:"
  sleep(1)
  puts " - this Github account was created in #{user["created_at"]}"
  if user["name"] != nil
    sleep(1)
    puts " - name: #{user["name"]}"
  end
  if user["location"] != nil
    sleep(1)
    puts " - lives in #{user["location"]}"
  end
  if user["company"] != nil
    sleep(1)
    puts " - works in #{user["company"]}"
  end
  if user["blog"] != ""
    sleep(1)
    puts " - has this blog: #{user["blog"]}"
  end
  if user["email"] != nil
    sleep(1)
    puts " - email: #{user["email"]}"
  end
  if user["hireable"] != nil
    sleep(1)
    puts " - is currently looking for a job"
  end
  if user["bio"] != nil
    sleep(1)
    puts " - more about this user: #{user["bio"]}"
  end
end

puts "Want to have info on some Github user?"
decision = gets.chomp

if ["y", "yes"].include? decision.downcase
  puts "Ok, so let's start!"
  start_api
elsif ["n", "no"].include? decision.downcase
  puts "Ok, see you next time."
else
  puts "#{decision} is an incorrect answer."
end

