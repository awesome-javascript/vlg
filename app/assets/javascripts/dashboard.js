var xhr = null;
var selectedVm = null;
var consoleUrl = null;

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
  $(document).on("ajax:complete", "a.vm-launch-console", function(evt, data, status, xhr) {
    $('#vm-console-iframe').attr('src', data['responseText']);
    consoleUrl = data['responseText'];

    $('#vm-console-modal').modal('show');
  });

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

