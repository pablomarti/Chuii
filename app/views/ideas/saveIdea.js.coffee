<% if @couldSave %>
<% if @id != 0 %>
$('#ideaContent').html('<%= escape_javascript(render :partial => "ideaInfo") %>');
<% end %>
<% else %>
alert("Error");
<% end %>