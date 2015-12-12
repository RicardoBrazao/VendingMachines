module VendingMachines
  module Update
    class UpdateMachine < UseCase::Base

      def perform
        context.vending_machine.update(vending_machine_params)
      end

      def vending_machine_params
        context.params.require(:vending_machine).permit(:items_attributes => [:id, :quantity])
      end

    end
  end
end
