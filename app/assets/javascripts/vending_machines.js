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

}