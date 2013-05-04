class Keyword < ActiveRecord::Base
  belongs_to :project
  attr_accessible :content, :munged_content

  def cluster!
    self.munged_content = BCrypt::Password.create(content, :cost => cost_factor)
    save!
  end

  private

  def cost_factor
    12
  end
end
