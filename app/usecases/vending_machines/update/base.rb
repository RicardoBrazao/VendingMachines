module VendingMachines
  module Update
    class Base < UseCase::Base
      depends CheckMoney, CalculateChange, UpdateMachine
    end
  end
end
