$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  var createProjectButton = function(){
    $('.create_project_button').on('click', function(event){
      event.preventDefault();
      $('.hidden_project_form').toggle();
      // $('.create_project_button').text('close form');
    });
  };

  var submitProjectForm = function(){
    $('.hidden_project_form').on('submit', '.create_project_form', function(event){

      event.preventDefault();
      var form = $(this);
      var data = form.serialize();
      var path = $('.create_project_form').attr('action')
      var method = $('.create_project_form').attr('method')

      var request = $.ajax({
        url: path,
        type: method,
        data: data,
        dataType: "json"
      })
      request.done(function(serverData){
        console.log('success');
        console.log(serverData, "hello");
        $('div.project_index').children().last().append('<div> <a href="projects/'+serverData.id + '">'+ serverData.name+ '</a> </div>')
        $('.hidden_project_form').toggle();
        $('.create_project_form')[0].reset();
      })
      request.fail(function(serverData){
        console.log(serverData);
        console.log('server request failed');
      })
    });
  };

  createProjectButton();
  submitProjectForm();


});
