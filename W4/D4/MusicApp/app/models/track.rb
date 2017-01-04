# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean          default("false"), not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  belongs_to :album
  has_one :band, through: :album, source: :band
  has_many :notes, dependent: :destroy

  validates :album, :lyrics, :name, :ord, presence: true
end
