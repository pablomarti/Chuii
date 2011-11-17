<% if !@idea.nil? %>
$('#ideaContent').html('<%= escape_javascript(render :partial => "ideaInfo") %>');
<% end %>