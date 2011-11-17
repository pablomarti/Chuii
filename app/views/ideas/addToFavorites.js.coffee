<% if !@idea.nil? %>
$('#addToFavorites').html('<%= escape_javascript(render :partial => "addToFavorites") %>');
<% end %>