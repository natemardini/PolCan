class HouseSession < ActiveRecord::Base
  attr_accessible :legislature, :session, :opening, :ending, :seatcount, :dissolved
  
  # Associations
  has_many :bills
  has_many :motions
  has_many :house_groups
  has_many :messages
  has_many :oral_questions
  has_many :forums
  
  # Methods
  def self.current_session
    where('ending > ?', DateTime.now).first
  end
  
  def self.last_session!
    order('ending DESC').first
  end
  
  def self.open_session
    new_session = self.new(opening: DateTime.now, dissolved: false)
    last_session = self.last_session!
    # If the last session returns nil, then this is the first session in the game
    if last_session.nil?
      new_session.legislature = 40
      new_session.session = 1
      new_session.ending = 15.week.since(DateTime.now)
      new_session.seatcount = 308
    else
      # If the last session was dissolved, then this is a new Parliament
      if last_session.dissolved == true
        new_session.legislature = last_session.legislature + 1
        new_session.session = 1
        new_session.ending = 15.week.since(DateTime.now)
        new_session.seatcount = last_session.seatcount
      else
        # If not, then this is a new session of the same Parliament
        new_session.legislature = last_session.legislature
        new_session.session = last_session.session + 1
        new_session.ending = last_session.ending
        new_session.seatcount = last_session.seatcount
      end
    end 
    new_session.save
  end
  
end

# TODO: Add discussion fora

# == Schema Information
#
# Table name: house_sessions
#
#  id          :integer         not null, primary key
#  legislature :integer
#  session     :integer
#  opening     :datetime
#  ending      :datetime
#  seatcount   :integer
#  dissolved   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

