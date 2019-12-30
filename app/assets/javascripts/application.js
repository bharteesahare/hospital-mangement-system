// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .


function selectDropdown(){
  var hospital_id = $("#select_hospital").find("option:selected").val()
  var disease_id = $("#select_disease").find("option:selected").val()
  if (hospital_id){
    $("#renderDisease_loader").show();
  } else {
    $("#renderDoctor_loader").show(); 
  }
  $.ajax({
    url : '/render_list',
    type : 'GET',
    data : {hospital_id: hospital_id, disease_id: disease_id},
    dataType:'json',
    success : function(data) {
      if (hospital_id){           
        $("#renderDisease").html(data.disease_html);
        $("#renderDisease_loader").hide();
      } else {
        $("#renderDoctor").html(data.doctor_html);
        $("#renderDoctor_loader").hide(); 
      }
    },
    error : function(request,error)
    {
      alert("Request: "+JSON.stringify(request));
    }
  });
}