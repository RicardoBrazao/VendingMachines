module VendingMachines
  module Update
    module Refill
      class UpdateMachine < UseCase::Base

        def perform
          context.vending_machine.save
        end


      end
    end
  end
end
