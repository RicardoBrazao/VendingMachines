$.vendingMachines = {
  show: function(items_path) {
    $('body').modalmanager('loading');

    $.ajax({
      url: items_path,
      dataType: 'html'
    }).done($.vendingMachines.afterDone)

  },

  afterDone: function(html){
    var $modal = $('#itemListing');
    $modal.modal().find('.modal-body').html(html);
  },

  edit: function(edit_path) {
    $('body').modalmanager('loading');

    $.ajax({
      url: edit_path,
      dataType: 'html'
    }).done($.vendingMachines.afterEditDone)
  },

  afterEditDone: function(html) {
    var $modal = $('#refillMachine');
    $modal.modal().find('.modal-body').html(html);
  },

  refill: function() {
    $('#refillMachine').modalmanager('loading');
    $('#refillVendingMachine').submit();
  }

}