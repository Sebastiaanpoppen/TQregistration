$(document).ready(() => {
  $(".active-check").bind('change',function(){
    console.log(this.checked)
    if(this.checked){
      $.ajax({
        url: window.location.href+"/toggle_active/"+this.value,
        type: 'POST',
        data: {"active": this.checked}
      })
      .fail(console.log)
    }
    else {
       alert("no");
    }
  });
});
