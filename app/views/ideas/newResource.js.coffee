<% if @couldSave %>
$('#addResource').html('<%= escape_javascript(render :partial => "addResource", :locals => {:id => @ideaResource.idea_id}) %>');
$('#resources').append('<%= escape_javascript(render :partial => "resource", :object => @ideaResource) %>');
alert("The resource was added to the idea");
<% end %>