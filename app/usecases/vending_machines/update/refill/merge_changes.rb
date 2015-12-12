module VendingMachines
  module Update
    module Refill
      class MergeChanges < UseCase::Base

        def before
          @vending_machine = VendingMachine.where(id: context.params["id"]).first
          context.vending_machine = @vending_machine
        end

        def perform
          @vending_machine.change.merge!(context.params["vending_machine"]["change"]) { |key, vending_machine_value, params_value|
            vending_machine_value.to_i + params_value.to_i
          }
        end

      end
    end
  end
end
