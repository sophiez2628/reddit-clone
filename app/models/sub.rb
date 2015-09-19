# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base

  validates :title, :description, :moderator_id, presence: true

  belongs_to :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id

  has_many :post_subs
  has_many :posts, through: :post_subs, source: :post
  #before_action :moderator_edit_sub #only: :edit



  def moderator_edit_sub

  end

end
