$('form').on('click', ".remove_event_record", function(event){
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('.lecture_row').hide();
  return event.preventDefault();
});

$('form').on('click', ".remove_ticket_record", function(event){
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('.ticket_row').hide();
  return event.preventDefault();
});

$('form').on('click', '.add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time));
  return event.preventDefault();
});

$('.select2_speakers').select2();

$('.select2_ticket_type').select2();

$('#datepicker input').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    calendarWeeks: true,
    autoclose: true
});

