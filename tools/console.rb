require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new "Moon Cult", "Denver", 1990, "Shoot for the moon"
cult2 = Cult.new "Star Cult", "Denver", 1995, "Shooting stars"
cult3 = Cult.new "Sun Cult", "Boulder", 1979, "Shine bright"
cult4 = Cult.new "Planet Cult", "Aurora", 2000, "Not Pluto"

follower1 = Follower.new "Bob", 26, "ABCD"
follower2 = Follower.new "Jim", 20, "EFGH"
follower3 = Follower.new "Louis", 30, "IJKL"
follower4 = Follower.new "Mike", 44, "MNOP"
follower5 = Follower.new "Kelly", 37, "QRST"
follower6 = Follower.new "Angela", 30, "UVWX"
follower7 = Follower.new "Ben", 25, "YZ"
follower8 = Follower.new "Haley", 23, "abc"
follower9 = Follower.new "Kristen", 27, "def"
follower10 = Follower.new "Alan", 30, "ghi"
follower11 = Follower.new "Laura", 55, "jkl"
follower12 = Follower.new "Bryce", 41, "mno"
follower13 = Follower.new "Logan", 41, "pqr"
follower14 = Follower.new "Nicole", 41, "st"
follower15 = Follower.new "Kayla", 41, "uv"
follower16 = Follower.new "Nick", 41, "wyxz"

b_o1 = BloodOath.new cult1, follower1, "2010-04-23"
b_o2 = BloodOath.new cult1, follower2, "2007-05-23"
b_o3 = BloodOath.new cult1, follower3, "1990-06-23"
b_o4 = BloodOath.new cult2, follower1, "2001-07-23"
b_o5 = BloodOath.new cult2, follower4, "1998-08-23"
b_o6 = BloodOath.new cult2, follower5, "2016-09-23"
b_o7 = BloodOath.new cult3, follower6, "1980-04-23"
b_o8 = BloodOath.new cult3, follower7, "2009-01-23"
b_o9 = BloodOath.new cult4, follower4, "2010-02-23"
b_o10 = BloodOath.new cult4, follower6, "2000-10-23"
b_o10 = BloodOath.new cult4, follower8, "2000-10-23"
b_o10 = BloodOath.new cult4, follower9, "2000-10-23"
b_o10 = BloodOath.new cult4, follower10, "2000-10-23"
b_o10 = BloodOath.new cult4, follower11, "2000-10-23"
b_o10 = BloodOath.new cult4, follower12, "2000-10-23"
b_o10 = BloodOath.new cult4, follower13, "2000-10-23"
b_o10 = BloodOath.new cult4, follower14, "2000-10-23"
b_o10 = BloodOath.new cult4, follower15, "2000-10-23"
b_o10 = BloodOath.new cult4, follower16, "2000-10-23"


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
