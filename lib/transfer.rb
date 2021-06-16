require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
      #binding.pry
  end

  def execute_transaction
    if self.valid? && self.sender.balance > self.amount && self.status == "pending"
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if (self.status == "complete")
    @status = "reversed"
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    end
  end
end
