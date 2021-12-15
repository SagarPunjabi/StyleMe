# README

<h1> <a href ="http://styleme-166.herokuapp.com/">Style Me! </a></h1>

<h2> Functionality</h2>

<p>
Style Me! is an outfit planning application that recommends users new outfits everyday based on the weather. Users have the ability to sign up for the application. Once they are registered, users can upload pictures of their clothes. We use an image recognation API to make the uploading process easier. Once the user has uploaded their clothes, they can generate a randomized outfit. We use a weather API to generate appropriate outfits & accessories for the day.  Once the user selects the outfit, the clothes get put into a laundry list and don't get suggested until the user marks them as "clean".  </p>

<h2 style="color:green"> Implemented </h2>
<ul>
    <li> User Sign up </li>
    <li> User Log in </li>
    <li> Upload clothes </li>
    <li> Image recognition </li>
    <li> Color recognition </li>
    <li> Add used clothes to laundry list </li>
    <li> Generate clothes based on weather </li>
    
</ul>

<h2 style ="color:yellow"> Future features </h2>
<ul>
    <li> Color matching algorithm for outfits </li>
    <li> Mobile app </li>
    <li> Vacation wardrobe </li>
    <li> Multiselect upload </li>
    <li> Generate based on favorite clothes </li>
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
    <li>/uploadclothes?user_id= - Displays the form where users can upload images of their clothes </li>
    <li> /laundry?user_id= - Users laundry list </li>
</ul>

</p>

<h2> Prototype</h2>
<a href= "https://drive.google.com/file/d/1PB3GF8lheinoEaEg6DnzaD3IcJpwXB6_/view?usp=sharing">Paper Prototype</a>
<h2> Schema </h2>
<p> 
<h3>Tables: </h3>

<strong>Name: Users </strong>

Columns: integer id, string name, string email, string password_digest

<strong> Name: Clothes </strong>

Columns: integer id, string quadrant, string
clothing_category, string color, string occasion, boolean clean, integer foriegn_key(user_id)

<strong> Associations: </strong>

Users -> Clothes (is One to Many)

</p>

<h2> APIs </h2>
<ul>
    <li><a href="https://imagga.com">Image Recognition  API</a> </li>
    <li><a href="https://imagga.com">Color Recognition  API</a> </li>
    <li><a href="https://openweathermap.org/api">Weather API</a> </li>
</ul>

<h2> Gems </h2>
<ul>
    <li> bcrypt </li>
    <li> aws-sdk-s3 </li>
    <li> base64 </li>
    <li> json </li>
    <li> Geocoder </li>
    <li> dotenv-rails </li>
</ul>

<h2> Slides & Github pages </h2>
<ul>
    <li><a href="https://drive.google.com/file/d/1YqzSJls7i9YJupDuew-VkrVvGI_eOgGq/view?usp=sharing"> Pdf Copy of Slides </a> </li>
    <li><a href="https://sagarpunjabi.github.io/StyleMe/">Final Report</a> </li>
</ul>
