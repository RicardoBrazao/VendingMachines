module VendingMachines
  module Update
    module Refill
      class CheckMaximumChangeCapacity < UseCase::Base

        def perform
          total_change = 0
          context.vending_machine.change.each do |change_value, change_amount|
            total_change+= (change_value.to_f*change_amount.to_i).round(2)
          end

          if total_change > context.vending_machine.max_change
            failure(:max_change, "The maximum change capacity was surpassed.")
          end

        end

      end
    end
  end
end
