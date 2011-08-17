# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# One day, Chad said: Let there be provinces!

Province.create([{name: 'Aberta', letters: 'Alta.'}, 
                 {name: 'British Columbia', letters: 'B.C.'},
                 {name: 'Manitoba', letters: 'Man.'}, 
                 {name: 'New Brunswick', letters: 'N.B.'}, 
                 {name: 'Newfoundland and Labrador', letters: 'Nfld.'},
                 {name: 'Northwest Territories', letters: 'N.T.'},
                 {name: 'Nova Scotia', letters: 'N.S.'}, 
                 {name: 'Nunavut', letters: 'Nu.'}, 
                 {name: 'Ontario', letters: 'Ont.'},
                 {name: 'Prince Edward Island', letters: 'P.E.I.'},
                 {name: 'Quebec', letters: 'Que.'}, 
                 {name: 'Saskatchewan', letters: 'Sask.'}, 
                 {name: 'Yukon', letters: 'Yk.'}])

# And it was good, then he decided to create ridings...

ridings = File.open("#{Rails.root}/db/ridinglist.txt")
ridings.each { |riding| Riding.create(name: riding.strip) }
ridings.close

# And told each riding that it must be part of a province

Province.find(1).ridings << Riding.find((1..28).to_a)     # To Alberta
Province.find(2).ridings << Riding.find((29..64).to_a)    # To British Columbia
Province.find(3).ridings << Riding.find((65..78).to_a)    # To Manitoba
Province.find(4).ridings << Riding.find((79..86).to_a)    # To New Brunswick
Province.find(5).ridings << Riding.find((87..95).to_a)    # To Newfoundland and Labrador
Province.find(6).ridings << Riding.find(96)               # To the Northwest Territories
Province.find(7).ridings << Riding.find((97..107).to_a)   # To Nova Scotia
Province.find(8).ridings << Riding.find(108)              # To Nunavut
Province.find(9).ridings << Riding.find((109..214).to_a)  # To Ontario 
Province.find(10).ridings << Riding.find((215..218).to_a) # To Prince Edward Island
Province.find(11).ridings << Riding.find((219..293).to_a) # To Quebec
Province.find(12).ridings << Riding.find((294..307).to_a) # To Saskatchewan
Province.find(13).ridings << Riding.find(308)             # To Yukon

# But all was not well in Canada, not without dancing and partying!

Party.create([{long_name: "Conservative Party", short_name: "Conservative", letters: "CPC"},
              {long_name: "Liberal Party", short_name: "Liberal", letters: "LPC"},
              {long_name: "New Democratic Party", short_name: "N.D.P.", letters: "NDP"},
              {long_name: "Bloc Quebecois", short_name: "Bloc", letters: "BQ"},
              {long_name: "Green Party", short_name: "Green", letters: "GPC"}])    
              
# And then the Senate was born from this primordial world!

Senate.create(seatcount: 105, liberal_senators: 45, tory_senators: 55, independent_senators: 4)

# Thus he turned his eye to the Commons and told them: "Organize Thee!"
  # access_level : 1 -> MP, 2 -> Critic, 3 -> Whip, 4 -> House Leader
  # 5 -> Leader, 6 -> Minister, 7 -> PM, 8 -> Editor, 9 -> Speaker, 10 -> GG
Role.create([{long_name: "Member of Parliament", short_name: "M.P.", access_level: 1},
             {long_name: "Opposition Critic", short_name: "Critic", access_level: 2},
             {long_name: "Chief Party Whip", short_name: "Whip", access_level: 3},
             {long_name: "House Leader", short_name: "House Leader", access_level: 4},
             {long_name: "Party Leader", short_name: "Leader", access_level: 5},
             {long_name: "Minister of the Crown", short_name: "Minister", access_level: 6},
             {long_name: "Prime Minister of Canada", short_name: "Prime Minister", access_level: 7},
             {long_name: "Editor-in-Chief", short_name: "Editor", access_level: 8},
             {long_name: "Speaker of the House of Commons", short_name: "Speaker", access_level: 9},
             {long_name: "Governor General of Canada", short_name: "Governor General", access_level: 10}])
             
# For testing only

Member.create(email: 'ianto@torchwood.com', password: 'torchwood', first_name: 'Ianto', last_name: 'Jones')
