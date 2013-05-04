class Project < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :progress, :as => :system
  has_many :keywords

  state_machine :initial => :clustered do

    before_transition :needs_clustering => :being_clustered, :do => :reset_progress
    #before_transition :started => :finished, :do => :before_finish
    #before_transition :started => :failed, :do => :before_stall

    event :cluster do
      transition :needs_clustering => :being_clustered
    end

    event :finish_clustering do
      transition :being_clustered => :clustered
    end


    event :invalidate_clustering do
      transition :clustered => :needs_clustering
    end

    state :needs_clustering do
    end

    state :being_clustered do
    end

    state :clustered do
    end

  end

  def reset_progress
    self.class.connection.execute("UPDATE projects SET progress = 0 WHERE id = #{id}")
  end

  def update_progress
    self.class.update_counters(self.id, :progress => 1)
  end

  def percent_done
    (progress / keywords.count.to_f ) * 100
  end
  
end
