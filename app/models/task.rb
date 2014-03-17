class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :user
  validates_size_of :title, minimum: 3, maximum: 255

  def status
    if completed_at?
      "completed"
    else
      "pending"
    end
  end
end
