Article.destroy_all
Coach.destroy_all
Program.destroy_all
ProgramImage.destroy_all
Review.destroy_all
School.destroy_all
User.destroy_all

schools_for_seeding = [
  {name: 'University of West Florida',
    location: 'Pensacola, FL', tuition: rand(14358..34594), location_population: rand(14358..34594), mascot: 'Argonauts', enrollment: rand(5000..15000)},
  {name: 'Christian Brothers University',
    location: 'Memphis, TN', tuition: rand(14358..34594), location_population: rand(14358..34594), mascot: 'Argonauts', enrollment: rand(5000..15000)},
  {name: 'Delta State University',
    location: 'Cleveland, MS' , tuition: rand(14358..34594), location_population: rand(14358..34594), mascot: 'Argonauts', enrollment: rand(5000..15000)},
  {name: 'Lee University',
    location: 'Cleveland, TN', tuition: rand(14358..34594), location_population: rand(14358..34594), mascot: 'Argonauts', enrollment: rand(5000..15000)},
  {name: 'Mississippi College',
    location: 'Clinton, MS', tuition: rand(14358..34594), location_population: rand(14358..34594), mascot: 'Argonauts', enrollment: rand(5000..15000)}
]

School.create!(schools_for_seeding)

schools = School.all

users = 15.times.map do
  User.create!(password: "passwords", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, position: ['pitcher', 'catcher', 'left field', 'shortstop', 'diver', 'captain', 'quarterback', 'forward'].sample, school: schools.sample, sport: ['baseball', 'swimming', 'diving', 'basketball', 'football'].sample, admin: false, jersey_number: rand(1..25))
end

User.create!(password: "passwords", first_name: "Kurt", last_name: "Schlueter", email: "kurtbschlueter@gmail.com", position: "captain", school: schools.sample, sport: "BO", admin: false, jersey_number: 8)

articles_for_seeding = [
  {title: '7 things you learn during your first year in your college program',
    body: '7. When you step on campus your new teammates are evaluating you

    The beginning of the year is a glorified tryout period. You’ll quickly learn that voluntary workouts and scrimmages a 100 percent mandatory. During these sessions, your teammates will be assessing where you are on the talent totem pole. If they sense weakness, they will be quick to take advantage of this when practices begin.

    6. Everything you do will be watched, and watched closely
    The watchful eye of campus extends far beyond your performance on game day. As an athlete, people are always watching you. Everything from your social media, accounts, to what you did at the bar will be analyzed and scrutinized. When you make a mistake, it will be magnified and when you do well, people will tell you how great you are. Don’t read into either.

    5. Promises made to you during recruiting don’t always hold true.
    It’s common for coaches to tell you what you want to hear during your recruitment to convince you to sign with their school. When you arrive on campus don’t be surprised if things are a little different than what you expected. Work hard to put yourself in the best situation to be successful.

    4. Players that fit the system best will play over more talented players
    You may have had a system that was tailored to your skill set at your previous school, but in college coaches are looking for the right lineup to help the team win. Sometimes players that fit the system best will play over players considered to be more talented.

    3. Your past reputation means nothing
    When you arrive on campus nobody cares about your prior accomplishments. If you are a notable recruit that just means the expectations will be higher for you when the season starts. When you get to school, you have to reestablish yourself. Don’t expect to be given anything because of your past reputation. The bigger your reputation coming in, the bigger the target on your back.

    2. A Full scholarship doesn’t pay for everything
    The extent of what your scholarship covers depends greatly on the budget of the school. Often times a “full scholarship” will only cover tuition, and housing. It’s important to know all the financial details of your scholarship before signing.

    1. Scholarships are not 4 years long
    It is a common misconception that once you sign your scholarship, you are locked in for  4 years. Scholarships are only valid for 1 year and the athletic program has the discretion to renew, reduce, or terminate the scholarship at the end of the year for any reason.',
    user: users.sample,
    media: File.open("app/assets/images/article_images/1.jpg"),
    subtitle: 'Florida led to SEC Championship byhighly touted recruiting class'},
  {title: '5 Benefits of Being a College Athlete',
    body: "Being a college athlete is unique opportunity that provides numerous benefits, below are a look at some of the top benefits of being a college athlete.

      5. Meaningful Friendships and Relationships
      You develop strong relationships with your teammates from all the time you spend together. Athletes from different teams are  part of the same social circles creating a sense of community the different teams. You’ll support the other teams during big games / playoff runs and develop healthy relationships with the other athletes at your school. The members of your team will become your closest friends. From the dance-offs in the locker room, to fighting through preseason conditioning, many athletes develop friendships with their teammates that last a lifetime.

      4. Campus Popularity
      No matter the size of the school, being an athlete on campus provides you with popularity on campus. The larger the school, the more “celebrity” status. Faculty, staff, and student body members will know a lot about you before you even step on campus. You’re an instantly a recognizable face on campus and playing the “athlete” card allows for numerous perks.

      3. Ability to stay in shape
      This is something you won’t fully appreciate until you are no longer are required to wake up for 6am conditioning and report to afternoon weights. As an athlete your training regime allows your body to stay in great shape. You’ll also develop strong nutritional and training habits that are beneficial beyond your playing days.

      2. Earning a degree with little to no debt.
      According to the Wall Street Journal, the average college student now graduates roughly $35,000 in debt.  Athletes are able to earn the same education as their peers for a fraction of the cost. This is an immeasurable benefit as it allows a quicker path to financial freedom in the years after graduating.

      1. Ability to keep playing the sport you love.
      As any athlete will tell you, you won’t be able to play the sport you love for the rest of your life. Even those who make it to the professional level must eventually transition to life after sports. Student-athletes are provided with the unique opportunity to compete at a high level and represent their campus in competition.  Playing a sport in college is a once in a lifetime opportunity that produces life-long memories.",
      user: users.sample,
      media: File.open("app/assets/images/article_images/2.jpg"),
      subtitle: 'Florida led to SEC Championship byhighly touted recruiting class'},
  {title: 'JerseyTalk Releases at West Florida',
    body: "JerseyTalk has released at the University of West Florida allowing college athletes from 2011 and after to provide a review on their college program. Reviews cover the program’s head coach, facilities, education and location. After writing a review, athletes can debate topics on current and former teammates as well as answer questions from recruits and fans in the Discussion area.

      Make sure to stay connected as the site will soon be open for other schools in the Gulf South Conference.

      West Florida teams:

      Men’s Basketball
      Women’s Basketball
      Men’s Soccer
      Women’s Soccer
      Baseball
      Softball
      Volleyball
      Men’s Tennis
      Women’s Tennis
      Swimming & Diving",
      user: users.sample,
      media: File.open("app/assets/images/article_images/3.jpg"),
    subtitle: 'Florida led to SEC Championship byhighly touted recruiting class'}
  ]

Article.create!(articles_for_seeding)

coaches = 50.times.map do
  Coach.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, alma_mater: ["University of Notre Dame", 'University of West Florida', 'Duke University'].sample, gender: ['male', 'female'].sample, wins: rand(1..50), losses: rand(1..50), year_started: [2001, 2005, 1977].sample, ncaa_appearances: rand(0..10), conference_titles: rand(0..5), recruiting_state1: 'Illinois', recruiting_state2: 'Florida', recruiting_state3: 'Georgia', seasons: rand(1..5))
end

schools.each do |school|
  school.programs.create(sport: "Men's Basketball", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Women's Basketball", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Men's Soccer", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Women's Soccer", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Baseball", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Softball", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Volleyball", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Men's Tennis", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Women's Tennis", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
  school.programs.create(sport: "Swimming & Diving", school: school, coach: coaches.pop, facility_name: ['The Complex', 'Pool', 'The Roof', 'Arena'].sample, facility_capacity: rand(2000..10000), gear: 'Nike', rivals: 'Valdosta State, Delta State', conference: 'Gulf South Conference', record_last_season: '18-7', national_titles: 0, conference_titles: 5, website: 'http://www.goargos.com/')
end

coaches = Coach.all
programs = Program.all

programs.each do |program|
  5.times do
    program.reviews.create(user: users.sample, coach: program.coach, school: program.school, hc_player_relationships: rand(1..5), hc_player_development: rand(1..5), hc_recruiting: rand(1..5), hc_pro_connections: rand(1..5), hc_sport_knowledge: rand(1..5), hc_would_play_with_again: [true, false].sample, hc_comments: 'Coach Hancock is a professional. He knows how to treat his athletes and get the best out of them.', f_main_arena: rand(1..5), f_home_atmosphere: rand(1..5), f_weight_room: rand(1..5), f_locker_room: rand(1..5), f_training_facility: rand(1..5), f_comments: 'I like out facilities I think that they have good equipment and standards for school this size.', l_program_tradition: rand(1..5), l_community_interest: rand(1..5), l_weather: rand(1..5), l_nightlife: rand(1..5), l_comments: 'Pensacola is amazing and the school is close to everything.', e_school_difficulty: rand(1..5), e_academic_support: rand(1..5), e_school_reputation: rand(1..5), e_graduated: [true, false].sample, e_comments: "The education at UWF is challenging where I use my my maximum capacities in class yet not exceeding to where I'm completely clueless and unable to do well in class.", conference_rival: 'UWF', toughest_conference_place_to_play: 'Gulf South Conference')
  end
end
