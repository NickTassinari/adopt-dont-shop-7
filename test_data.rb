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


<% if @applications.status == "Approved" %>
  <p> Application Approved </p>
<% end %>


def update
  @applications = Application.find(params[:id])
  if params[:approval] == "approved"
  @applications.update(status: "Approved")
  # @applications.save
  # redirect_to "/admin/applications/#{@applications.id}"
    render :show
  else
    @applications.update(status: "Rejected")
    # @applications.save
    # redirect_to "/admin/applications/#{@applications.id}"
    render :show
  end

end

# <%= form_with url: "/shelters/#{@shelter.id}/pets", method: :post, local: true do |f| %>
#   <%= f.label :name %>
#   <%= f.text_field :name %>

#   <%= f.label :breed %>
#   <%= f.text_field :breed %>

#   <%= f.label :age %>
#   <%= f.number_field :age %>

#   <%= f.label :adoptable %>
#   <%= f.check_box :adoptable %>

#   <%= f.submit %>
# <% end %>


<%= render partial "new_edit", locals:{
  path: "/pets/#{@pet.id}",
  method: :patch,
} %>

# <%= form_with url: "/pets/#{@pet.id}", method: :patch, local: true do |f| %>
#   <%= f.label :name %>
#   <%= f.text_field :name %>

#   <%= f.label :breed %>
#   <%= f.text_field :breed %>

#   <%= f.label :adoptable %>
#   <%= f.check_box :adoptable %>

#   <%= f.label :age %>
#   <%= f.number_field :age %>

#   <%= f.submit %>
# <% end %>
