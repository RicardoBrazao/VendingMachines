module VendingMachines
  module Update
    module Refill
      class MergeItems < UseCase::Base

        def perform
          context.vending_machine.items.each do |item|
            params_item = context.params["vending_machine"]["items_attributes"].detect {|idx, params_item| params_item["id"].to_i == item.id }
            item.quantity += params_item[1]["quantity"].to_i
          end
        end

      end
    end
  end
end
