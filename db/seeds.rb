
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}"))
end

event = Event.create({
  date: Date.parse("2015-06-13"),
  location: "Mansion House, Clifton, Bristol, UK",
  active: true,
  title: "Adam & Cerys",
  partner_one: "Adam",
  partner_two: "Cerys",
  venue_name: "Mansion House",
  venue_address_line_one: "Clifton Down",
  venue_address_city: "Bristol",
  venue_address_state: "Bristol",
  venue_address_zip: "BS8 3LJ",
  venue_address_country: "United Kingdom",
  venue_body: """
Both the ceremony and reception will be held at The Mansion House located in the heart of Clifton.
We're *hoping* for an outdoor ceremony in the venues beautiful gardens.
  """,
  venue_directions: """
**From Dorset:** Take the A350 road via Shaftesbury, Warminster and Bath *appox 2hrs 30min*.

**From elsewhere:** To get directions follow the instructions on the map below.

The Mansion House is located beween the Clifton suspension bridge and Bristol Zoo. **From the portway** take the
road up to Clifton and then take the first right keeping left at the fork and continue for 150 yards. **From the
suspension bridge** heading into Clifton take the second left and continue down Canynge Road.

Mansion House Bristol, Clifton Down, Bristol, BS8 3LJ
  """
})

venue_photos = VenuePhoto.create([
  { event_id: event.id, file: seed_image("venue_photos/1.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/2.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/3.jpg") },
  { event_id: event.id, file: seed_image("venue_photos/4.jpg") }
])

event.primary_venue_photo = venue_photos.last.id
event.save!

butlers = Group.create({
  event_id: event.id
})

owens = Group.create({
  event_id: event.id
})

ian = Guest.create({
  name: "Ian Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

mary = Guest.create({
  name: "Mary Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: butlers.id,
  event_id: event.id
})

bryan = Guest.create({
  name: "Bryan Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})

joyce = Guest.create({
  name: "Joyce Owen",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: owens.id,
  event_id: event.id
})

leon = Guest.create({
  name: "Leon Butler",
  rsvp: true,
  invited_to_ceremony: true,
  invited_to_evening: true,
  event_id: event.id
})

leons_guest = Guest.create({
  rsvp: false,
  invited_to_ceremony: true,
  invited_to_evening: true,
  group_id: leon.group.id,
  event_id: event.id
})
