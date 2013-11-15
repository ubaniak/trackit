class Notification < ActiveRecord::Base
    belongs_to :user
    belongs_to :task
    
    default_scope :order => "created_at DESC"

    def self.my_notifications(id)
      self.where("user_id = ?", id).limit(10)
    end

    def self.create_task(task)
        n = self.new
        n.user = task.creator
        n.task = task
        n.message = "#{n.user.name} has created a new task"
        n.save
    end

    def self.assign_task(task)
        n = self.new
        n.user = task.assigned
        n.task = task
        n.message = "#{n.user.name} has been assigned a task"
        n.save
    end

    def self.change_due_date(task, old_date)
        n = self.new
        n.user = task.assigned
        n.task = task
        if old_date.nil?
            n.message = "#{n.user.name} has set the due date for task"
        else
            n.message = "#{n.user.name} changed the due date from 
            #{old_date.strftime("%Y %B %d, %I %M %p")} to 
            #{task.due_date.strftime("%Y %B %d, %I %M %p")} for task"
        end
        n.save
    end

    def self.set_reviewer(task)
        sender = self.new
        sender.user = task.assigned
        sender.task = task
        sender.message = "#{sender.user.name} has assigned #{task.reviewer.name} a task to review"
        sender.save

        reveiver = self.new
        reveiver.user = task.reviewer
        reveiver.task = task
        reveiver.message = "#{sender.user.name} has assigned you as a reviewer for a task"
        reveiver.save
    end

    def self.send_for_review(task)
        sender = self.new
        sender.user = task.assigned
        sender.task = task
        sender.message = "#{sender.user.name} has sent #{task.reviewer.name} a task to review"
        sender.save

        reveiver = self.new
        reveiver.user = task.reviewer
        reveiver.task = task
        reveiver.message = "#{sender.user.name} has sent you a task to review"
        reveiver.save
    end

    def self.set_approver(task)
        sender = self.new
        sender.user = task.reviewer
        sender.task = task
        sender.message = "#{sender.user.name} has assigned #{task.approver.name} a task to approve"
        sender.save

        reveiver = self.new
        reveiver.user = task.approver
        reveiver.task = task
        reveiver.message = "#{sender.user.name} has assigned you as an approver for a task"
        reveiver.save
    end

    def self.send_for_approval(task)
        sender = self.new
        sender.user = task.reviewer
        sender.task = task
        sender.message = "#{sender.user.name} has sent a task for approval"
        sender.save

        receiver = self.new
        receiver.user = task.approver
        receiver.task = task
        receiver.message = "#{sender.user.name} has sent you a task for approval"
        receiver.save
    end

    def self.reopen_task(task, user)
        re_opened = self.new
        re_opened.user = user
        re_opened.task = task
        re_opened.message = "#{re_opened.user.name} repoened a task"
        re_opened.save

        assigned = self.new
        assigned.user = task.assigned 
        assigned.task = task
        assigned.message = "#{re_opened.user.name} repoened a task you where assigned to"
        assigned.save
    end

    def self.close_task(task, user)
        n = self.new
        n.user = user 
        n.task = task
        n.message = "#{n.user.name} closed task"
        n.save
    end

    def self.set_department(task, user)
        n = self.new
        n.user = user 
        n.task = task
        n.message = "#{n.user.name} changed the department for task"
        n.save
    end
end
