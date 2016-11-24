$(document).ready(() => {
  $(".active-check").bind('change',function() {
    $.ajax({
      type: 'PATCH',
      url: window.location.origin + "/admins/toggle_active/" + this.value,
      data: JSON.stringify({
        "active": this.checked
      }),
      processData: false,
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data) {
      console.log(data);
    })
    .fail(console.log)
  });

  $(".full-access-check").bind('change',function() {
    $.ajax({
      type: 'PATCH',
      url: window.location.origin + "/admins/toggle_full_access/" + this.value,
      data: JSON.stringify({
        "full_access": this.checked
      }),
      processData: false,
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data) {
      console.log(data);
    })
    .fail(console.log)
  });
});
