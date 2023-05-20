<h1>Applicants</h1>
<% @application.each do |applicant| %>
<p>Name: <%= applicant.name %></p>
<p>Address: <%= applicant.address %></p>
<p>City: <%= applicant.city %></p>
<p>State: <%= applicant.state %></p>
<p>Zip Code: <%= applicant.zip_code %></p>
<p>Description: <%= applicant.description %></p>
<p>Status: <%= @application.status %></p>
<% end %>