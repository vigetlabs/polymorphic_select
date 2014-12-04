$(function() {
  $(document).on('change', 'select[data-polymorphic]', function() {
    var $select    = $(this),
        marker     = $select.data('polymorphic'),
        $selected  = $select.find(':selected'),
        type       = $selected.closest('optgroup').data('polymorphic-type');

    $('input[data-polymorphic=' + marker + ']').attr('value', type);
  });
});
