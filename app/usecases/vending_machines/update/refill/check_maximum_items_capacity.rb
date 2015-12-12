module VendingMachines
  module Update
    module Refill
      class CheckMaximumItemsCapacity < UseCase::Base

        def perform
          total_items = 0
          context.vending_machine.items.each do |item|
            total_items+= item.quantity
          end

          if total_items > context.vending_machine.max_capacity
            failure(:max_capacity, "The maximum item capacity was surpassed.")
          end

        end

      end
    end
  end
end
