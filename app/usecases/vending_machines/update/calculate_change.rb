module VendingMachines
  module Update
    class CalculateChange < UseCase::Base

      def before
        @vending_machine = VendingMachine.where(id: context.params["id"]).first
        context.vending_machine = @vending_machine
      end

      def perform
        money_diference = (context.money_inserted - context.item.price).round(2)
        total_change = 0
        change = @vending_machine.change.clone
        change.reverse_each do |change_value, change_amount|
          change_amount = change_amount.to_i
          if change_amount != 0
            coin_amount, money_diference = money_diference.divmod(change_value.to_f)
            next if coin_amount == 0
            if(coin_amount > change_amount)
              money_diference += ((coin_amount-change_amount)*change_value.to_f).round(2)
              coin_amount = change_amount
            end
            money_diference = money_diference.round(2)
            total_change += (change_value.to_f*coin_amount)
            change_left = (change_amount - coin_amount).to_s
            change[change_value] = change_left
          end
        end
        if money_diference != 0
          failure(:money_inserted, "The machine can't provide that much change.")
        else
          @vending_machine.change = change
        end
        context.total_change = total_change.round(2)
      end

    end
  end
end
