$.items = {
  showPayModal: function(vendingMachinePath) {
    $('#itemListing').modalmanager('loading');

    $.ajax({
      url: vendingMachinePath,
      dataType: 'html'
    }).done($.items.afterDone)

  },

  afterDone: function(html){
    var $modal = $('#itemPayment');
    $('#itemListing').modalmanager('loading');
    $modal.modal().find('.modal-body').html(html);
  },

  payItem: function(){
    $('#itemListing').modalmanager('loading');
    $('#editVendingMachine').submit();
  }
}