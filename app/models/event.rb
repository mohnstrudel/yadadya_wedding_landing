class Event < ApplicationRecord
  attr_accessor :date_slug
  has_many :lectures, dependent: :destroy

  accepts_nested_attributes_for :lectures, :allow_destroy => true

  has_many :event_organizers, dependent: :destroy
  has_many :organizers, through: :event_organizers

  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets

  has_many :speakers, through: :lectures

  validates :title, :subtitle, :facebook, :sortable_date, presence: true

  # Это фактичиские билеты. За использование tickets выше - СОРРИ!
  has_many :available_tickets, dependent: :destroy
  accepts_nested_attributes_for :available_tickets, :allow_destroy => true

  has_one :archive

  mount_uploader :mesto_logo, PictureUploader
  mount_uploader :povestka_1_logo, PictureUploader
  mount_uploader :povestka_2_logo, PictureUploader
  mount_uploader :povestka_3_logo, PictureUploader
  mount_uploader :povestka_4_logo, PictureUploader
  mount_uploader :povestka_5_logo, PictureUploader
   
  def self.most_recent
    self.order(sortable_date: :asc).last
  end

  def start_time
    lectures.first.timeframe.split(" - ")[0]
  end

  def end_time
    lectures.last.timeframe.split(" - ")[1]
  end

  def date_slug
    begin
      self.date_slug = self.sortable_date.strftime("%d-%B-%Y")
    rescue
      self.date_slug = nil
    end
  end

  extend FriendlyId
  friendly_id :date_slug, use: :slugged
end
