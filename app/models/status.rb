class Status < ActiveRecord::Base
    has_many :tasks

    def self.open
        self.get_status("Open")
    end

    def self.for_review
        self.get_status("For Review")
    end

    def self.for_approval
        self.get_status("For Approval")
    end

    def self.close
        self.get_status("Close")
    end

    private
    def self.get_status(name)
        status = self.where("name LIKE ?", "%#{name}%")
        if not status.empty?
            return status[0]
        else
            Status.create(:name => name)
            status = self.where("name LIKE ?", "%#{name}%")
            return status[0]
        end
    end
end
