module VendingMachines
  module Update
    module GetItem
      class Base < UseCase::Base
        depends CheckMoney, CalculateChange, UpdateMachine
      end
    end
  end
end
