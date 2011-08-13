class Senate < ActiveRecord::Base
  
  def vote(bill)
    if rand(100) >= 20
      attendees = [*15..self.seatcount].sample
      
      if bill.bill_type == 1 or bill.confidence == true
         swing = attendees * rand(15)/100
         yeavote = (attendees * [*63..100].sample/100) - swing
         absentvote = rand(attendees - yeavote) * [*5..20].sample/100
         nayvote = attendees - (yeavote + absentvote)
         return { :yeas => yeavote, :nays => nayvote, :abstains => absentvote, :presence => attendees }
      else
        # logic for every other legislations
        if bill.member.party(:letters => 'CPC')
          # proportion of attendees being liberals and tories
          tories = @tory_senators * rand(100)/100
          liberals = @liberal_senators * rand(55)/100
          indies = (attendees - (tories + liberals)).abs
          # size of swing votes
          lib_swing = liberals * rand(35)/100
          tory_swing = tories * rand(10)/100
          indies_yea = indies * rand(50)/100
          indies_nay = indies * rand(50)/100
          # calculate tallies
          yeavote = tories + lib_swing + indies_yea - tory_swing
          nayvote = liberals + tory_swing + indies_nay - lib_swing
          absentvote = (attendees - (yeavote + nayvote)).abs 

          # return result with a message ?
          return { :yeas => yeavote, :nays => nayvote, :abstains => absentvote, :presence => attendees }
        elsif bill.member.party(:letters => 'LPC')
          # proportion of attendees being liberals and tories
          tories = @tory_senators * rand(55)/100
          liberals = @liberal_senators * rand(100)/100
          indies = (attendees - (tories + liberals)).abs
          # size of swing votes
          lib_swing = liberals * rand(10)/100
          tory_swing = tories * rand(35)/100
          indies_yea = indies * rand(50)/100
          indies_nay = indies * rand(50)/100
          # calculate tallies
          yeavote = liberals + tory_swing + indies_yea - lib_swing
          nayvote = tories + lib_swing + indies_nay - tory_swing
          absentvote = (attendees - (yeavote + nayvote)).abs 

          # return result with a message ?
          return { :yeas => yeavote, :nays => nayvote, :abstains => absentvote, :presence => attendees }
        else
          if rand(100) >= 23
            # proportion of attendees being liberals and tories
            tories = @tory_senators * rand(100)/100
            liberals = @liberal_senators * rand(100)/100
            indies = (attendees - (tories + liberals)).abs
            # size of swing votes
            lib_swing = liberals * rand(35)/100
            tory_swing = tories * rand(35)/100
            indies_yea = indies * rand(50)/100
            indies_nay = indies * rand(50)/100
            # calculate tallies
            if rand(100) > 50
              yeavote = tories + lib_swing + indies_yea - tory_swing
              nayvote = liberals + tory_swing + indies_nay - lib_swing
            else
              yeavote = liberals + tory_swing + indies_yea - lib_swing
              nayvote = tories + lib_swing + indies_nay - tory_swing
            end
            absentvote = (attendees - (yeavote + nayvote)).abs
            # return result with a message ?
            return { :yeas => yeavote, :nays => nayvote, :abstains => absentvote, :presence => attendees }
          end
        end
      end
    end
  end
      
      
end

# == Schema Information
#
# Table name: senates
#
#  id                   :integer         not null, primary key
#  seatcount            :integer
#  liberal_senators     :integer
#  tory_senators        :integer
#  independent_senators :integer
#  created_at           :datetime
#  updated_at           :datetime
#

