Musician.create!(
  :first_name => "Miles",
  :last_name => "Davis",
  :born_on => "1926-05-26",
  :died_on => "1991-09-28",
  :instrument => Instrument["Trumpet"],
  :prominence => 1,
  :remote_avatar_url => "http://host3.images.cdn.fotopedia.com/flickr-2193453631-medium.jpg",
  :biography => %{
    Widely considered one of the most influential musicians of the 20th century, Miles Davis was, with his musical groups, at the forefront of several major developments in jazz music, including bebop, cool jazz, hard bop, modal jazz, and jazz fusion. Many well-known musicians rose to prominence as members of Davis' ensembles, including saxophonists
  }
).tap do |m|
  m.update_attribute(:famous, true)
  m.update_attribute(:has_profile, true)
end

Musician.create!(
  :first_name => "Oscar",
  :last_name => "Peterson",
  :born_on => "1925-08-05",
  :died_on => "2007-12-23",
  :instrument => Instrument["Piano"],
  :prominence => 2,
  :remote_avatar_url => "http://host1.images.cdn.fotopedia.com/flickr-448361338-medium.jpg",
  :biography => %{
    He was called the "Maharaja of the keyboard" by Duke Ellington, "O.P." by his friends.[1] [2] He released over 200 recordings, won seven Grammy Awards, and received other numerous awards and honours over the course of his career. He is considered to have been one of the greatest jazz pianists of all time,[3] having played thousands of live concerts to audiences worldwide in a career lasting more than 60 years.
  }
).tap do |m|
  m.update_attribute(:famous, true)
  m.update_attribute(:has_profile, true)
end
