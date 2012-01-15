Musician.create!(
  :seeding => true,
  :first_name => "Miles",
  :last_name => "Davis",
  :born_on => "1926-05-26",
  :died_on => "1991-09-28",
  :instrument => Instrument["Trumpet"],
  :prominence => 1,
  :featured => true,
  :remote_avatar_url => "http://host3.images.cdn.fotopedia.com/flickr-2193453631-medium.jpg",
  :biography => <<-END
Spare ribs flank jowl corned beef ham short ribs t-bone rump tenderloin, biltong ground round beef ribs. Rump salami meatball, pastrami shankle ham hock beef ribs ribeye. Rump tri-tip shoulder ball tip, chicken pastrami salami capicola pork loin fatback pig. Biltong frankfurter spare ribs salami. Short loin brisket andouille chuck. Filet mignon short loin turducken jowl chuck, ball tip drumstick pig hamburger rump meatloaf. Flank corned beef frankfurter hamburger brisket short loin.

h2. Styles

* Bebop
* Bossa-Nova
* Ballad

You can also try this chord here:
{{ Cmaj7#11 }}

h2. Other Information

Spare ribs flank jowl corned beef ham short ribs t-bone rump tenderloin, biltong ground round beef ribs. Rump salami meatball, pastrami shankle ham hock beef ribs ribeye. Rump tri-tip shoulder ball tip, chicken pastrami salami capicola pork loin fatback pig. Biltong frankfurter spare ribs salami. Short loin brisket andouille chuck. Filet mignon short loin turducken jowl chuck, ball tip drumstick pig hamburger rump meatloaf. Flank corned beef frankfurter hamburger brisket short loin.
  END
).tap do |m|
  m.update_attribute(:famous, true)
  m.update_attribute(:has_profile, true)
end

Musician.create!(
  :seeding => true,
  :first_name => "Oscar",
  :last_name => "Peterson",
  :born_on => "1925-08-05",
  :died_on => "2007-12-23",
  :instrument => Instrument["Piano"],
  :prominence => 2,
  :featured => true,
  :remote_avatar_url => "http://host1.images.cdn.fotopedia.com/flickr-448361338-medium.jpg",
  :biography => <<-END
Spare ribs flank jowl corned beef ham short ribs t-bone rump tenderloin, biltong ground round beef ribs. Rump salami meatball, pastrami shankle ham hock beef ribs ribeye. Rump tri-tip shoulder ball tip, chicken pastrami salami capicola pork loin fatback pig. Biltong frankfurter spare ribs salami. Short loin brisket andouille chuck. Filet mignon short loin turducken jowl chuck, ball tip drumstick pig hamburger rump meatloaf. Flank corned beef frankfurter hamburger brisket short loin.

h2. Styles

* Bebop
* Bossa-Nova
* Ballad

You can also try this chord here:
{{ Cmaj7#11 }}

h2. Other Information

Spare ribs flank jowl corned beef ham short ribs t-bone rump tenderloin, biltong ground round beef ribs. Rump salami meatball, pastrami shankle ham hock beef ribs ribeye. Rump tri-tip shoulder ball tip, chicken pastrami salami capicola pork loin fatback pig. Biltong frankfurter spare ribs salami. Short loin brisket andouille chuck. Filet mignon short loin turducken jowl chuck, ball tip drumstick pig hamburger rump meatloaf. Flank corned beef frankfurter hamburger brisket short loin.
  END
).tap do |m|
  m.update_attribute(:famous, true)
  m.update_attribute(:has_profile, true)
end

