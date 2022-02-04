# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
class Artwork < ApplicationRecord
    validate :unique_artist_title
    # validates :artist_id, uniqueness: { scope: :title }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def unique_artist_title
        matched_work = Artwork.joins(:artist).where(users: {id: self.artist_id}).where(artworks: {title: self.title}).where.not(artworks: {id: self.id})
        raise 'Artist/artwork title already exists' unless matched_work.empty?
    end

end
