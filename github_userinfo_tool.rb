require "json"
require "open-uri"

def start_api
  puts "Please write the Github username."
  username = gets.chomp
  json = open("https://api.github.com/users/#{username}").read
  user = JSON.parse(json)
  puts "Info about this Github user:"
  puts " - this Github account was created in #{user["created_at"]}"
  puts " - name: #{user["name"]}"
  puts " - lives in #{user["location"]}"
  puts " - works in #{user["company"]}"
  puts " - has this blog: #{user["blog"]}"
  puts " - email: #{user["email"]}"
  puts " - looking for a job: #{user["hireable"]}"
  puts " - more about this user: #{user["bio"]}"
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

