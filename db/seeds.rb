require 'faker'

User.delete_all
Event.delete_all

users = 100.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :birthdate  => Date.today - 15.years - rand(20000).days,
                :password   => 'password' )
end

50.times do
  start_time = Time.now + (rand(61) - 30).days
  end_time   = start_time + (1 + rand(6)).hours

  Event.create!( :user_id    => users[rand(users.length)].id,
                 :name       => Faker::Company.name,
                 :location   => "#{Faker::Address.city}, #{Faker::Address.state_abbr}",
                 :starts_at  => start_time,
                 :ends_at    => end_time )
end

all_events = Event.all
users.each do |user|
  events = all_events.sample(rand(2..10))
  events.each do |event|
    EventAttendance.create!(user: user, event: event)
  end
end
