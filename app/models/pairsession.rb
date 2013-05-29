class Pairsession < ActiveRecord::Base
  attr_accessible :note, :technologies, :start_time, :end_time, :user_id, :date

  belongs_to :user

  def self.get_for_date(date)
    self.where('date = ?', date)
  end

  def self.get_sessions_dates
    self.all.map { |p| p.date }
  end
end
