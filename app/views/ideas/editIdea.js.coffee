<% if !@idea.nil? %>
$('#ideaContent').html('<%= escape_javascript(render :partial => "editIdeaForm") %>');
<% end %>