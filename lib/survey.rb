class Survey < ActiveRecord::Base

  has_many(:questions)
    validates(:topic,{:presence => true, :length => {:maximum => 50}})
    before_save(:downcase_topic)


    private
    def downcase_topic
      self.topic=(topic().downcase())
    end
end
