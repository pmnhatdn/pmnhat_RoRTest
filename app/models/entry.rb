# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
	attr_accessible :user_id,:content, :title
    validates :user_id, presence: true
    validates :content, presence: true
    validates :title, presence: true
	validates :content, :length => { :maximum => 200 }
    belongs_to :user
    default_scope order: 'entries.created_at DESC'
end
