module VendingMachines
  module Update
    module GetItem
      class CheckMoney < UseCase::Base

        def before
          context.money_inserted = context.params["money_inserted"].to_f
          context.item = Item.where(id: context.params["vending_machine"]["items_attributes"]["0"]["id"]).first
        end

        def perform
          failure(:money_inserted, "Not enough money inserted") if context.money_inserted - context.item.price < 0
        end

      end
    end
  end
end
