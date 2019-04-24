

//var API_URL = 'http://' + location.host + ':3001/list/'
//  var $table = $('#table').bootstrapTable({url: API_URL})
  var $table = $("#layer_table").bootstrapTable();
  var $modal = $('#modal').modal({show: false})
  var $alert = $('.alert').hide()
  function showModal(title, row_) {
    var row = row_ || {
      id: '',
      name: '',
      stargazers_count: 0,
      forks_count: 0,
      description: ''
    } // default row value
    $modal.data('id', row.id)
    $modal.find('.modal-title').text(title)
    for (var name in row) {
      if (row[name]) {
        $modal.find('input[name="' + name + '"]').val(row[name])
      }
    }
    $modal.modal('show')
  }
  function showAlert(title, type) {
    $alert.attr('class', 'alert alert-' + type || 'success')
      .html('<i class="glyphicon glyphicon-check"></i> ' + title).show()
    setTimeout(function () {
      $alert.hide()
    }, 3000)
  }
  $(function () {
    // create event
    $('.create').click(function () {
      showModal($(this).text())
    })
    $modal.find('.submit').click(function () {
      var row = {}
      $modal.find('input[name]').each(function () {
        row[$(this).attr('name')] = $(this).val()
      })
      $.ajax({
        url: API_URL + ($modal.data('id') || ''),
        type: $modal.data('id') ? 'put' : 'post',
        contentType: 'application/json',
        data: JSON.stringify(row),
        success: function () {
          $modal.modal('hide')
          $table.bootstrapTable('refresh')
          showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item successful!', 'success')
        },
        error: function () {
          $modal.modal('hide')
          showAlert(($modal.data('id') ? 'Update' : 'Create') + ' item error!', 'danger')
        }
      })
    })
  })
//  function queryParams(params) {
//    return {}
//  }
	 function isdeleteFormatter(value) {
		console.log(value);
	   return value=="0"?"否":"是";
	 }
  // update and delete events
  window.actionEvents = {
    'click .update': function (e, value, row) {
      showModal($(this).attr('title'), row)
    },
    'click .remove': function (e, value, row) {
      if (confirm('Are you sure to delete this item?')) {
        $.ajax({
          url: API_URL + row.id,
          type: 'delete',
          success: function () {
            $table.bootstrapTable('refresh')
            showAlert('Delete item successful!', 'success')
          },
          error: function () {
            showAlert('Delete item error!', 'danger')
          }
        })
      }
    }
  }