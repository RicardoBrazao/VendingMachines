$.vendingMachines = {
  show: function() {
    $('body').modalmanager('loading');
    var $modal = $('#myModal');

    setTimeout(function() {
      $modal.modal().find('.modal-body').html('<div>Holy Guacamole!!!</div>');
    }, 1000);

  }
}