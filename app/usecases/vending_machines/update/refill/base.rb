module VendingMachines
  module Update
    module Refill
      class Base < UseCase::Base
        depends MergeChanges, CheckMaximumChangeCapacity,
                MergeItems, CheckMaximumItemsCapacity,
                UpdateMachine
      end
    end
  end
end