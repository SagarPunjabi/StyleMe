# README

<h1> Style Me! </h1>

<h2> Functionality</h2>

<p>
Style Me! is an outfit planning application that recommends users new outfits everyday based on the weather. Users have the ability to sign up for the application. Once they are registered, users can upload pictures of their clothes. We use an image recognation API to make the uploading process easier. Once the user has uploaded their clothes, they can generate a randomized outfit. We use a weather API to generate appropriate outfits & accessories for the day. We also use a color matching algorithm to make sure the outfit is stylish! Once the user selects the outfit, the clothes get put into a dirty pile and won't get suggested until the user marks them as "clean".  </p>

<h2 style="color:green"> Implemented </h2>
<ul>
    <li> User Sign up </li>
    <li> User Log in </li>
    <li> Upload clothes </li>
    <li> Generate clothes based on weather </li>
</ul>

<h2 style ="color:yellow"> In progress </h2>
<ul>
    <li> Image recognition </li>
    <li> Mark clothes as dirty/clean </li>
    <li> Color matching algorithm  </li>
</ul>

<h2> Routes </h2>
<p>
<code> Root:</code>  
<ul>
    <li>/ - Landing pages for the website. Users can login from this page.</li>
</ul>

<code> Sign up:</code>

<ul>
    <li>/signup - Displays the sign up form</li>
</ul>

<code> Users:</code>

<ul>
    <li>/users/user_id - This is the users profile page, displays their clothes.</li>
    <li>/generate?user_id= - Generates a random outfit</li>
</ul>

<code> Clothes:</code>

<ul>
    <li>/uploadclothes?user_id= - Displays the form where users can upload images of their clothes 
    </li>
    <li> /dirtyclothes?user_id= - Displays the list of dirty clothes (not yet implemented) </li>
</ul>

</p>

<h2> Schema </h2>
<p> 
<h3>Tables: </h3>

<strong>Name: Users </strong>

Columns: integer id, string name, string email, string password_digest

<strong> Name: Clothes </strong>

Columns: integer id, string quadrant, string
clothing_category, string color, string occasion, integer foriegn_key(user_id)

<strong> Associations: </strong>

Users -> Clothes (is One to Many)

</p>

<h2> APIs </h2>
<ul>
    <li><a href="https://imagga.com">Image Recognition  API</a> </li>
    <li><a href="https://openweathermap.org/api">Weather API</a> </li>
</ul>

<h2> Gems </h2>
<ul>
    <li> bcrypt </li>
    <li> aws-sdk-s3 </li>
    <li> base64 </li>
    <li> json </li>
    
    
</ul>
