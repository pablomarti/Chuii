<% if @couldSave %>
$("#<%= @auxId %>").addClass("selectedLink");
$("#<%= @auxIdOther %>").removeClass("selectedLink");
<% end %>