require 'pry'
require_relative './bank_account.rb'

class Transfer

attr_accessor :status, :transfer_amount
attr_reader :sender, :receiver

    def initialize(sender, receiver, transfer_amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @transfer_amount = transfer_amount
    end

    def amount 
      @transfer_amount
    end

    def valid?
      receiver.valid? && sender.valid?  ? true : false
    end

    def execute_transaction
        # sender.balance -= transfer_amount
        # receiver.balance += transfer_amount
        
        if @status == "pending" && sender.balance > @transfer_amount
        sender.deposit(-transfer_amount)
        receiver.deposit(+transfer_amount)
        @status = "complete"
        else 
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
    end 

    def reverse_transfer
      if @status == "complete" && receiver.balance > @transfer_amount
        receiver.deposit(-transfer_amount)
        sender.deposit(+transfer_amount)
        @status = "reversed"
        else 
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      # binding.pry
    end 


end
