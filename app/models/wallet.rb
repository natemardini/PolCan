class Wallet < ActiveRecord::Base
  belongs_to :member
  belongs_to :party
  has_many :transactions
  
  # Use this method to change popularity level
  def modify_popularity(amount, reason)
    if @popularity + amount > 100
      # Calculate party and member shares
      party_share = (@popularity + amount) - 100
      member_share = amount - party_share
      # Crease a transactin for the member
      self.transactions << Transaction.create( :type => 1, :item => reason, :amount => member_share )
      @popularity = (@popularity + member_share).abs
      # Create a transaction for the party
      self.member.party.wallet.transactions << Transaction.create( :type => 1, :item => "#{self.member.name}'s increase in popularity has enhanced people's perception of the party!", :amount => party_share )
      self.member.party.wallet.popularity += party_share   
    else
      self.transactions << Transaction.create( :type => 1, :item => reason, :amount => amount )
      @popularity = (@popularity + amount).abs
    end
  end
  
  # Use this method to transact cash
  def transact(amount, reason, receiver = nil)
    if receiver != nil
      reception = Member.find_by_email(receiver)
      if !reception.exist?
        reception = Party.find_by_letters(receiver)
      end 
      if reception.exist?
        self.transactions << Transaction.create( :type => 2, :item => reason, :amount => -amount )
        @cash += -amount
        reception.wallet.transactions << Transaction.create( :type => 2, :item => reason, :amount => amount )
        reception.wallet.cash += amount
      end
    else
      self.transactions << Transaction.create( :type => 2, :item => reason, :amount => amount )
      @cash += amount
    end  
  end
    
  def generate_daily_cash
    # Generate an increase (or decrease) in cash based on popularity
    case @popularity
    when 0..10
      increase = -35
    when 11..20
      increase = -20
    when 21..30
      increase = -10
    when 31..40
      increase = 1
    when 41..50
      increase = 10
    when 51..60
      increase = 40
    when 61..70
      increase = 80
    when 71..80
      increase = 135
    when 81..90
      increase = 160 
    when 91..100
      increase = 200
    end
    # Generate a message based on daily cash increase
    if increase > 0
      message = "You're popular! Donations to your riding association are trickling in!"
    elsif increase < 0
      message = "Your popularity has sunk too low for people to care, your expenses outweigh any donations,"
    else 
      message = "Your donations barely cover your expenses."
    end
    # Perform the transaction and update wallet
    self.transactions << Transaction.create( :type => 2, :item => message, :amount => increase )
    @cash += increase
  end
      
end

# == Schema Information
#
# Table name: wallets
#
#  id         :integer         not null, primary key
#  popularity :integer
#  cash       :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

