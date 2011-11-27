<% if !@idea.nil? %>
$('#ideaInfo').html('<%= escape_javascript(render :partial => "ideaInfo") %>');
<% end %>