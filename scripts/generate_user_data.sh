#!/bin/bash

# Arrays of sample first and last names
first_names=("John" "Jane" "Alice" "Bob" "Charlie" "Daisy" "Edward" "Fiona" "George" "Hannah" 
             "Isabella" "Jack" "Katherine" "Liam" "Mia" "Nathan" "Olivia" "Paul" "Quinn" "Rachel" 
             "Sam" "Tina" "Uma" "Victor" "Wendy" "Xander" "Yvonne" "Zach" "Abigail" "Ben" 
             "Catherine" "David" "Eleanor" "Frank" "Grace" "Henry" "Ivy" "James" "Kara" 
             "Leo" "Madeline" "Nora" "Oscar" "Penelope" "Quincy" "Ruby" "Steven" "Tara" 
             "Ulysses" "Violet" "Walter" "Xenia" "Yara" "Zane" "Aaron" "Bella" "Carter" 
             "Diana" "Evan" "Faith" "Gavin" "Hazel" "Ian" "Julia" "Kyle" "Lucy" "Mason" 
             "Nina" "Owen" "Piper" "Reed" "Sophie" "Trent" "Ursula" "Vince" "Willow" "Xavier" 
             "Zoe" "Amelia" "Elijah" "Sophia" "Michael" "Aiden" "Emily" "Daniel" "Madison" 
             "Matthew" "Emma" "Lucas" "Avery" "Logan" "Sofia" "Caleb" "Harper" "Isaac" "Ella" 
             "Mila" "Evelyn" "Aurora" "Aria" "Stella" "Zoe" "Lily" "Nova" "Layla" "Ellie" 
             "Lillian" "Nora" "Hazel" "Violet" "Aurora" "Savannah" "Audrey" "Bella" "Claire" 
             "Skylar" "Paisley" "Everly" "Anna" "Caroline" "Maya" "Genesis" "Emilia" "Kennedy" 
             "Ruby" "Serenity" "Autumn" "Ariana" "Everleigh" "Kaylee" "Violet" "Naomi" "Luna" 
             "Victoria" "Isla" "Samantha" "Sadie" "Skylar" "Leah" "Lydia" "Elliana" "Adeline" 
             "Brooklyn" "Addison" "Josephine" "Delilah" "Arya" "Raelynn" "Athena" "Juliana" 
             "Eliana" "Ivy" "Natalia" "Quinn" "Nevaeh" "Alice" "Liliana" "Alina" "Valentina" 
             "Kehlani" "Aliyah" "Gabriella" "Cora" "Bailey" "Andrea" "Emerson" "Valeria" 
             "Everly" "Rylee" "Aubrey" "Kayla" "Marley" "Amaya" "Brielle" "Reagan" "Josie" 
             "Jade" "Arianna" "Elena" "Aspen" "Alivia" "Teagan" "Sloane" "Presley" "Logan" 
             "Trinity" "Tessa" "Finley" "Kimberly" "Vivienne" "Faith" "Madilyn" "Ember" 
             "Sabrina" "Aspen" "Phoebe" "Ruth" "Remi" "Peyton" "Amari" "Emory" "Joy" "Hope" 
             "Zariyah" "Armani" "Keira" "Anastasia" "Aspyn" "Angelina" "Michelle" "Zara" 
             "Elise" "Blakely" "Winter" "Wren" "Charleigh" "Fiona" "Aspen" "Aleah" "Annalise")

last_names=("Smith" "Johnson" "Williams" "Jones" "Brown" "Davis" "Miller" "Wilson" "Moore" "Taylor" 
            "Anderson" "Thomas" "Jackson" "White" "Harris" "Martin" "Thompson" "Garcia" "Martinez" "Robinson" 
            "Clark" "Rodriguez" "Lewis" "Lee" "Walker" "Hall" "Allen" "Young" "King" "Wright" 
            "Scott" "Green" "Baker" "Adams" "Nelson" "Hill" "Ramirez" "Campbell" "Mitchell" "Roberts" 
            "Carter" "Phillips" "Evans" "Turner" "Torres" "Parker" "Collins" "Edwards" "Stewart" "Flores" 
            "Morris" "Nguyen" "Murphy" "Rivera" "Cook" "Rogers" "Morgan" "Peterson" "Cooper" "Reed" 
            "Bailey" "Bell" "Gomez" "Kelly" "Howard" "Ward" "Cox" "Diaz" "Richardson" "Wood" 
            "Watson" "Brooks" "Bennett" "Gray" "James" "Reyes" "Cruz" "Hughes" "Price" "Myers" 
            "Long" "Foster" "Sanders" "Ross" "Morales" "Powell" "Sullivan" "Russell" "Ortiz" "Jenkins" 
            "Gutierrez" "Perry" "Butler" "Barnes" "Fisher" "Henderson" "Coleman" "Simmons" "Patterson" "Jordan" 
            "Reynolds" "Hamilton" "Graham" "Kim" "Gonzalez" "Alexander" "Ramos" "Wallace" "Griffin" "West" 
            "Cole" "Hayes" "Chavez" "Gibson" "Bryant" "Ellis" "Stevens" "Murray" "Ford" "Marshall" 
            "Owens" "Mcdonald" "Harrison" "Ruiz" "Kennedy" "Wells" "Alvarez" "Woods" "Mendoza" "Castillo" 
            "Olson" "Webb" "Washington" "Tucker" "Freeman" "Burns" "Henry" "Vasquez" "Snyder" "Simpson" 
            "Crawford" "Jimenez" "Porter" "Mason" "Shaw" "Gordon" "Wagner" "Hunter" "Romero" "Hicks" 
            "Dixon" "Hunt" "Palmer" "Robertson" "Black" "Holmes" "Stone" "Meyer" "Boyd" "Mills" 
            "Warren" "Fox" "Rose" "Rice" "Moreno" "Schmidt" "Patel" "Ferguson" "Nichols" "Herrera" 
            "Medina" "Ryan" "Fernandez" "Weaver" "Daniels" "Stephens" "Gardner" "Payne" "Kelley" "Dunn" 
            "Pierce" "Arnold" "Tran" "Spencer" "Peters" "Hawkins" "Grant" "Hansen" "Castro" "Hoffman" 
            "Hart" "Elliott" "Cunningham" "Knight" "Bradley" "Carroll" "Hudson" "Duncan" "Armstrong" "Berry" 
            "Andrews" "Johnston" "Ray" "Lane" "Riley" "Carpenter" "Perkins" "Aguilar" "Silva" "Richards" 
            "Willis" "Matthews" "Chapman" "Lawrence" "Garza" "Vargas" "Watkins" "Wheeler" "Larson" "Carlson" 
            "Harper" "George" "Greene" "Burke" "Guzman" "Morrison" "Munoz")

# Function to generate a random number within a range
random_number() {
  local min=$1
  local max=$2
  echo $((RANDOM % (max - min + 1) + min))
}

# Generate user data and save to CSV file
generate_user_data() {
  local num_users=$1
  local output_file=$2

  echo "first_name,last_name,email,phone_number" > "$output_file"
  for ((i = 1; i <= num_users; i++)); do
    local first_name=${first_names[$(random_number 0 ${#first_names[@]})]}
    local last_name=${last_names[$(random_number 0 ${#last_names[@]})]}
    local email="${first_name,,}.${last_name,,}@example.com"
    local phone_number=$(printf "+1-%03d-%03d-%04d" $(random_number 100 999) $(random_number 100 999) $(random_number 1000 9999))

    echo "$first_name,$last_name,$email,$phone_number" >> "$output_file"
  done
}

# Default number of users to generate
num_users=100
output_file="../data/user_data.csv"

# Generate user data
generate_user_data $num_users $output_file

echo "User data generated in $output_file"
