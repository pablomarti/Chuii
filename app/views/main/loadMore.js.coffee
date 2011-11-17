$('#lastIdeas').append('<%= escape_javascript(render :partial => "idea", :collection => @ideas) %>');
<% if !@loadMore %>
$('#loadMore').html('');
<% end %>