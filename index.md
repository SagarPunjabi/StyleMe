## Welcome to StyleMe!
### Project Summary
Have you ever woke up in the morning and had no clue what to wear? Well with StyleMe!, that’s a worry of the past. Style Me! is an outfit planning application that recommends users new outfits everyday based on the weather. Users have the ability to sign up for the application. Once they are registered, users can upload pictures of their clothes. We use an image recognation API to make the uploading process easier. Once the user has uploaded their clothes, they can generate a randomized outfit. We use a weather API to generate appropriate outfits & accessories for the day. We also use a color matching algorithm to make sure the outfit is stylish! Once the user selects the outfit, the clothes get put into a dirty pile and won't get suggested until the user marks them as "clean".

### Features
With SyleMe users have a wide array of features that they can use. First we have a signup and login feature allowing users to make their own account that no one else can see. Once users make an account they will have the option to upload their clothes by taking pictures of them. Once the user uploads a picture of their clothes our color and image recognition apis will automatically fill out all the required fields for you! (ex: Category,style,color,occasion) Users can then go to their very own virtual closet where they can view all the clothes they have uploaded sectioned off into their respective categories (ex: top,bottom, etc). Once a user has everything they want uploaded they can click on generate outfit which will generate an outfit from their clothes based on the current weather! So if it is 30°F outside a winter coat will be included in your outfit but if it is 80°F outside you will most likely be given a t-shirt and shorts. This page will also alert you of any weather conditions like rain or snow and give an accessory that is appropriate. (ex: if it is raining it will recommend an umbrella) Another feature that is available is if the user wants to change one piece of the outfit that was generated. For example, if the user loves everything about the generated outfit except for the t-shirt then they can click on the t-shirt and it will swap it out for another t-shirt from your closet without reloading the page! Another feature the users can use is generating an outfit based on the occasion. For example, if the user is going into work they can click on the business-casual button and it will generate an outfit that is business-casual. The user also has the option to continue clicking on any of the occasion buttons to generate more outfits until they find the one they like. Once the desired outfit is generated users can click on the pick this outfit button which will send users to the outfit of the day page that displays the outfit they chose until they chose another one. The clothes in the chosen outfit will also now be marked as dirty and be taken out of rotation for generating outfits. Once users do laundry they can go to the dirty clothes page and mark the clothes as clean and they will be returned to the rotation for generating outfits.

### User Story
User’s sign up to StyleMe! With a name, a unique email address and password. Once signed up successfully, the email and the password can be used to log in to the application. 

<img width="468" alt="login" src="https://user-images.githubusercontent.com/64447359/145686600-98cebad7-ad83-4aa0-9024-de69b7f34a57.png">

Logging in opens up the user’s “Closet”, which shows all of their clothes divided by subcategories e.g, tops, bottoms, shoes, and accessories. Closet is also where the user can select clothes and make sure they are in the right category by clicking on a piece of clothing and editing it’s variables. 

<img width="468" alt="closet" src="https://user-images.githubusercontent.com/64447359/145686660-9e10343f-f053-4967-b4da-555fad8816d3.png">

Once logged in, navbar shows 4 options that the user can choose from, “Upload Clothes”, “Closet”, “Generate”, “Laundry” and “Log Out”. 
A user can upload their clothes one at a time. All they need to do is upload a picture of their clothes using the upload button and the application will identify the clothes, what weather they are appropriate for and it’s color. 

<img width="468" alt="edit" src="https://user-images.githubusercontent.com/64447359/145686678-832c1d5d-8ba3-4ae7-bd8d-19eac76ad1a1.png">

Once the user has entered their clothes, they can start generating their outfits for the day. The generated outfit feature shows a potential outfit they can wear by considering the current weather, temperature, and occasion. The user can then click on any part of the outfit they do not particularly like and change it. They can also generate a completely new outfit by clicking on one of the occasions. Finally, they can “select” an outfit which signifies that they would like to wear that outfit this day. This places the clothes from the outfit in the unlaundered pile in Laundry. 

<img width="468" alt="generate" src="https://user-images.githubusercontent.com/64447359/145686707-6ab421ff-ce20-45ab-910c-c08be4346f14.png">

The “Laundry” feature shows clothes that need to be washed. Once washed, they can click on “Wash Clothes” which places all the clothes back into the main closet, or they can also choose to individually wash an item. 
Finally, the user can log out of their accounts. An average human being makes around 35,000 decisions a day and decision-making is not easy. Don’t let the decision-fatigue get in the way of starting your day and use StyleMe! so you have one less decision.

### Notable Technology
One of the notable technologies we used is amazon S3 to store all of our images. A url to the image is attached to every piece of clothing in our database so that when users look at their closet every image will be rendered. Another notable technology we used is the weather api which takes in a latitude and longitude and gives back the current temperature and the temperatures for the next 24 hours as well as any weather alerts. We were able to get the users latitude and longitude by first requesting their IP address and then using the Geocoder gem which allowed us to search for the latitude and longitude by providing the IP address. 

Additionally we used two of Imagga’s APIs to make the uploading process smoother. The first API was an image recognition API. The image recognition API returned a list of tags. These tags are the different objects the API thinks are in the image. After testing the API on 10 different clothing items we came to the conclusion it correctly recognizes clothes about 90% of the time. We also used a color recognition API to determine the color of the clothes. 

### Challenges
One of the hardest challenges of creating this application was getting the Imagga image recognition API to work. We were met with challenges every step of the way. First, we had to sort through the Json data and get the relevant tags. This was difficult because none of us had work with Json before. Once we were able to get it working in a plain ruby file we tried to add it to our rails app. This time a lot of the issues we faced were with S3. We had to post the image to the database so we could send the image to the API.

### Application Architecture

![Software Architecture](https://user-images.githubusercontent.com/64447359/145686977-bdda82b2-f4dd-4555-ab92-2801b8914d74.jpeg)

### Database Schema

![databaseschema](https://user-images.githubusercontent.com/64447359/145687012-d935448d-df51-48d3-a181-c945a0f4f6af.png)

### Future Features
Some of the features we would like to implement in the future is a vacation wardrobe option where users can select a number of clothes that they are taking with them on vacation so that they can generate outfits based on the clothes they brought with them. Another feature we would like to implement is the option to generate an outfit based around a favorite clothing item so if a user wants to wear a specific shirt then the outfit will be generated around that shirt. Another feature we would like to implement is the option to upload multiple images at once. We would also like to make a mobile version of our app so users can use it on the go.
