<% if @couldSave %>
$('#newComment').html('<%= escape_javascript(render :partial => "newComment", :locals => {:item => @item, :id => @id}) %>');
$('#comments').append('<%= escape_javascript(render :partial => "comment", :object => @ideaComment) %>');
<% end %>