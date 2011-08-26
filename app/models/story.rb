class Story < ActiveRecord::Base
  # Accessibles
  attr_accessible :subject, :body, :member_id, :newspic, :newspic_cache, :category, :remote_newspic_url
  
  # Associations
  belongs_to :member
  
  # Picture
  mount_uploader :newspic, NewspicUploader
  
  # Methods
  def category_name
    case category
      when 1
        "OOC - Game News"
      when 2
        "OOC - Real News"
      when 3
        "National Post"
      when 4
        "Globe & Mail"
      when 5
        "Hansard"
    end
  end
    
end


# == Schema Information
#
# Table name: stories
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  body       :text
#  category   :integer
#  member_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  newspic    :string(255)
#

