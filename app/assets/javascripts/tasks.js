$(document).on('turbolinks:load', function() {
  $(function() {
    $('.sortable').sortable({
      connectWith: '.sortable',
      beforeStop: function(e, ui) {
        ui.item.addClass("add-class");
      },
    receive: function(e, ui) {
      var parent_id = $(this).data("id");
      var targetTask = $('.add-class').find('.task_status_update_id');
      taskId = targetTask.val();
      projectId = $('.task_project_id').val();
      $.ajax({
        url: projectId + '/tasks/' + taskId,
        type: 'PATCH',
        remote: 'true',
        data: {
          task: {
            status: parent_id
          }
        }
      })
      .done(function(data) {
      })
      .fail(function(data) {
        alert('タスクを移動できませんでした');
        })
      }
    })
  })
});