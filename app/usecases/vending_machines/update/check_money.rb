module VendingMachines
  module Update
    class CheckMoney < UseCase::Base

      def before
        @money_inserted = context.money_inserted.to_f
        @item_price = Item.where(id: context.vending_machine["items_attributes"]["0"]["id"]).first.price
      end

      def perform
        failure(:money_inserted, "Not enougth money inserted") if @money_inserted - @item_price < 0
      end

    end
  end
end
