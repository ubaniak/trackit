class Task < ActiveRecord::Base
    has_many :comments
    has_many :notifications
    belongs_to :department
    belongs_to :status
    belongs_to :creator,
               :class_name => "User",
               :foreign_key => "created_by"

    belongs_to :assigned,
               :class_name => "User",
               :foreign_key => "assigned_to"

    belongs_to :reviewer,
               :class_name => "User",
               :foreign_key => "reviewed_by"

    belongs_to :approver,
               :class_name => "User",
               :foreign_key => "approved_by"

    default_scope :order => "created_at DESC"

    def open_task
        self.update({:status => Status.open})
    end

    def open?
        self.status == Status.open
    end

    def for_review?
        self.status == Status.for_review
    end

    def for_approval?
        self.status == Status.for_approval
    end

    def closed?
        self.status == Status.close
    end

    def current_owner(user)
        self.assigned == user
    end

    def assigned?
        not self.assigned.nil?
    end

    # Approval Stuff
    def current_approver(user)
        self.approver == user
    end

    def send_for_approval
        self.update({:status => Status.for_approval})
    end

    def approver_set?
        not self.approver.nil? 
    end

    def set_approver(id)
        self.update({:approved_by => id})
    end

    def close 
        self.update({:status => Status.close})
    end

    # Review Stuff
    def current_reviewer(user)
        self.reviewer == user
    end

    def reviewer_set?
        not self.reviewer.nil?
    end

    def set_reviewer(id)
        self.update({:reviewed_by => id})
    end

    def send_for_review
       self.update({:status => Status.for_review})
    end

    # My tasks
    def self.all_my_open_tasks(id)
        self.where("assigned_to IS ?", id).joins(:status).where("name LIKE ?", "%Open%")
    end

    def self.all_my_tasks_for_review(id)
        self.where("assigned_to IS ?", id).joins(:status).where("name LIKE ?", "%For Review%")
    end

    def self.all_my_tasks_to_review(id)
        self.where("reviewed_by IS ?", id).joins(:status).where("name LIKE ?", "%For Review%")
    end

    def self.all_my_tasks_for_approval(id)
        self.where("assigned_to IS ?", id).joins(:status).where("name LIKE ?", "%For Approval%")
    end

    def self.all_my_tasks_to_approve(id)
        self.where("approved_by IS ?", id).joins(:status).where("name LIKE ?", "%For Approval%")
    end

    def self.all_my_closed_tasks(id)
        self.where("assigned_to IS ?", id).joins(:status).where("name LIKE ?", "%Close%")
    end

    def self.all_my_late_tasks(id)
        self.where("assigned_to IS ? and due_date < ?", id, DateTime.now)
    end

    # All tasks
    def self.all_open_tasks
        self.joins(:status).where("name LIKE ?", "%Open%")
    end

    def self.all_closed_tasks
        self.joins(:status).where("name LIKE ?", "%Close%")
    end

    def self.all_tasks_for_review
        self.joins(:status).where("name LIKE ?", "%For Review%")
    end

    def self.all_tasks_for_approval
        self.joins(:status).where("name LIKE ?", "%For Approval%")
    end

    def self.all_late_tasks
        self.where("due_date < ?", DateTime.now)
    end

    def self.all_unassigned_tasks
        self.where("assigned_to IS 'nil'")
    end


    def assigned_name
        if !self.assigned.nil?
            return self.assigned.name
        end
        return "Not assigned"
    end

    def reviewer_name
        if !self.reviewer.nil?
            return self.reviewer.name
        end
        return "Not assigned"
    end

    def approver_name
        if !self.approver.nil?
            return self.approver.name
        end
        return "Not assigned"
    end

end
