var xhr = null;
var selectedVm = null;

/* Bind on AJAX events */

function load_vms()
{
  if (xhr != null) return;

  $('loading').show();

  xhr = $.ajax({
    url: '/vm/status',
    type: 'GET',
    async: true,
    success: function(data)
    {
      $('#loading').hide();
      $('#vms tbody').html(data);
      $('#' + selectedVm).addClass('info');
      $('#vms').show();
    }
  });

  xhr = null;
}

load_vms();

$(function()
{
  // setInterval(load_vms, 5000);

  $('#vms').on('click', 'tr', function()
  {
    $('#' + selectedVm).removeClass('info');
    selectedVm = $(this).attr('id');
    $(this).addClass('info');

    $.ajax({
      url: '/vm/' + selectedVm + '/details',
      type: 'GET',
      async: true,
      success: function(data)
      {
        $('#vm-details').html(data);
      }
    });
  });
});
