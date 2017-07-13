# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User: firstname:string lastname:string email:string username:string password:string created_at:timestamp updated_at:timestamp
User.destroy_all
User.create([
    { firstname:"Valeci", lastname:"Nobre", email:"nobre@gmail.com", username:"val", password:"pass123" },
    { firstname:"Edik", lastname:"Choukhachian", email:"edo@gmail.com", username:"edo", password:"mass123" },
    { firstname:"Michael", lastname:"Perez", email:"mike@gmail.com", username:"FreshOceans", password:"gass123" },
    { firstname:"Monique", lastname:"Bolosan", email:"mbolo@gmail.com", username:"Olympia", password:"bass123" },
    { firstname:"Natasha", lastname:"Perez", email:"nyu@gmail.com", username:"NYU", password:"lass123" }
])
#
# Port: location:string created_at:timestamp updated_at:timestamp
Port.destroy_all
Port.create([
    { location:"Busan, South Korea" },
    { location:"Los Angeles, U.S.A." },
    { location:"Jebel Ali, Dubai, United Arab Emirates" },
    { location:"Antwerp, Belgium" },
    { location:"Hamburg, Germany" },
    { location:"Shanghai, China"},
    { location:"New York-New Jersey, U.S.A."},
    { location:"Felixstowe, U.K."},
    { location:"Santos, Brazil"},
    { location:"Balboa, Panama"}
])

# Boat: user_id:integer, port_id:integer, name:string, amount_of_containers:integer created_at:timestamp updated_at:timestamp
Boat.destroy_all
Boat.create([
    { user_id:1, port_id:1, name:"Yasuo", amount_of_containers:10 },
    { user_id:2, port_id:2, name:"Kha'zix", amount_of_containers:25 },
    { user_id:3, port_id:3, name:"Ezreal", amount_of_containers:7 },
    { user_id:4, port_id:4, name:"Lee Sin", amount_of_containers:14 },
    { user_id:5, port_id:5, name:"Lucian", amount_of_containers:62 }
])

# Job: user_id:integer, port_origin_id:integer, port_destination_id:integer, description:string, amount_of_containers:integer, cost:integer created_at:timestamp updated_at:timestamp
Job.destroy_all
Job.create([
    { user_id:1, port_origin_id:1, port_destination_id:3, description:"Silicon Chips", amount_of_containers:10, cost:1000  },
    { user_id:2, port_origin_id:2, port_destination_id:4, description:"Coffee", amount_of_containers:25, cost:2500 },
    { user_id:3, port_origin_id:3, port_destination_id:5, description:"Tea", amount_of_containers:7, cost:700 },
    { user_id:4, port_origin_id:4, port_destination_id:2, description:"Bottled Water", amount_of_containers:14, cost:1400 },
    { user_id:5, port_origin_id:5, port_destination_id:1, description:"Mangos", amount_of_containers:62, cost:6200 }
])

# Comment user_id:integer job_id:integer content:string created_at:timestamp updated_at:timestamp
Comment.destroy_all
Comment.create([
    { user_id:2, job_id:1, content:"Vestibulum tincidunt malesuada tellus." },
    { user_id:3, job_id:2, content:"Morbi in dui quis est" },
    { user_id:3, job_id:3, content:"Sed aliquet risus a tortor." },
    { user_id:4, job_id:4, content:"Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos." },
    { user_id:1, job_id:5, content:"Fusce ac turpis quis ligula lacinia aliquet." },
    { user_id:2, job_id:1, content:"In vel mi sit amet augue congue elementum." },
    { user_id:3, job_id:2, content:"Sed cursus ante dapibus diam." },
    { user_id:4, job_id:3, content:"Ut orci risus, accumsan porttitor, cursus quis, aliquet eget, justo." },
    { user_id:1, job_id:4, content:"Integer id quam." },
    { user_id:2, job_id:5, content:"Proin sodales libero eget ante. Nulla quam. Aenean laoreet. Vestibulum nisi lectus, commodo ac, facilisis ac, ultricies eu, pede." }
])

# BoatJob: boat_id:integer, job_id:integer, created_at:timestamp updated_at:timestamp
BoatJob.destroy_all
BoatJob.create([
    { boat_id:1, job_id:1 },
    { boat_id:2, job_id:3 },
    { boat_id:3, job_id:2 }
])
