class Pairsession < ActiveRecord::Base
  attr_accessible :note, :technologies, :start_time, :end_time, :user_id, :date

  belongs_to :user

  def self.get_for_date(date)
    self.where('date = ?', date).map do |p|
      result = p.attributes
      result[:username] = p.user.username
      result[:timezone] = p.user.timezone

      result
    end
  end

  def self.get_sessions_dates
    self.all.map { |p| p.date }
  end

  def self.get_last(number_of_sessions)
    self.order('created_at DESC').limit(5)
  end
end
