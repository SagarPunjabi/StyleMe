## Welcome to StyleMe!
### Project Summary
Have you ever woke up in the morning and had no clue what to wear? Well with StyleMe!, that’s a worry of the past. Style Me! is an outfit planning application that recommends users new outfits everyday based on the weather. Users have the ability to sign up for the application. Once they are registered, users can upload pictures of their clothes. We use an image recognation API to make the uploading process easier. Once the user has uploaded their clothes, they can generate a randomized outfit. We use a weather API to generate appropriate outfits & accessories for the day.  Once the user selects the outfit, the clothes get put into a dirty pile and won't get suggested until the user marks them as "clean". The average human being makes hundreds of decisions per day. Don’t let the decision-fatigue get in the way of starting your day and use StyleMe instead!


### Features
With SyleMe users have a wide array of features that they can use. After signing up for StyleMe users can upload pictures of their clothes to their virtual closet. Our color and image recognition APIs will automatically fill out all the required fields (category, style, color, occasion) for you! Users can then view all the clothes they have uploaded sectioned off into their respective categories (ex: top, bottom, socks, shoes). Once a user has everything they want uploaded they can click on generate outfit which will generate an outfit from their clothes based on the current weather! So if it is 30°F outside a winter coat will be included in your outfit but if it is 80°F outside you will most likely be given a t-shirt and shorts. This page will also alert you of any weather conditions like rain or snow and give an accessory that is appropriate. Additionally, if users don’t like one piece of the outfit that was generated, they can click on it to get a new suggestion. For example, if the user loves everything about the suggested outfit except for the t-shirt then they can click on the t-shirt and it will swap it out for another t-shirt from your closet without reloading the page! We can also provide outfit suggestions based on the occasion. If the user is going into work they can click on the business-casual button and it will generate an outfit that is business-casual. The user also has the option to continue clicking on any of the occasion buttons to generate more outfits until they find the one they like. We also keep track of which outfits have been used and add them to a laundry list. We keep unwashed clothes out of the rotation until they are marked “washed” by the user.

### User Story
User’s sign up to StyleMe! With a name, a unique email address and password. Once signed up successfully, the email and the password can be used to log in to the application. 

<img width="468" alt="login" src="https://user-images.githubusercontent.com/64447359/145686600-98cebad7-ad83-4aa0-9024-de69b7f34a57.png">

Logging in opens up the user’s closet, which shows all of their clothes divided by subcategories e.g, tops, bottoms, shoes, and accessories. Closet is also where the user can edit clothes and make sure they are in the right category by clicking on a piece of clothing. 

<img width="468" alt="closet" src="https://user-images.githubusercontent.com/64447359/145686660-9e10343f-f053-4967-b4da-555fad8816d3.png">

The navbar shows 4 options that the user can choose from, “Upload Clothes”, “Closet”, “Generate”, “Laundry” and “Log Out”. 
A user can upload their clothes one at a time. All they need to do is upload a picture of their clothes using the upload button and the application will identify the clothes, the style of the clothes and it’s color. 

<img width="468" alt="edit" src="https://user-images.githubusercontent.com/64447359/145686678-832c1d5d-8ba3-4ae7-bd8d-19eac76ad1a1.png">

Once the user has entered their clothes, they can start generating their outfits for the day. The generated outfit feature shows a potential outfit they can wear by considering the current weather, temperature, and occasion. The user can then click on any part of the outfit they do not particularly like and change it. They can also generate a completely new outfit by clicking on one of the occasions. Finally, they can “select” an outfit which signifies that they would like to wear that outfit this day. This adds the clothes to their laundry list.

<img width="468" alt="generate" src="https://user-images.githubusercontent.com/64447359/145686707-6ab421ff-ce20-45ab-910c-c08be4346f14.png">

The laundry list feature shows clothes that need to be washed. Once washed, they can click on “Wash Clothes” which places all the clothes back into the main closet, or they can also choose to individually wash an item. Finally, the user can log out of their accounts.

### Notable Technology
We used Amazon S3 to store all of our images. A url to the image is attached to every piece of clothing in our database so that when users look at their closet every image will be rendered. Another notable technology we used is the weather API which takes in a latitude and longitude and gives back the current temperature and the temperatures for the next 24 hours as well as any weather alerts. We were able to get the users latitude and longitude by first requesting their IP address and then using the Geocoder gem which allowed us to search for the latitude and longitude by providing the IP address. 

Additionally we used an image recognition API and color recognition API from Imagga. The image recognition API returned a list of tags which were suggestions to what the objects in the image could be. After testing the API on 10 different clothing items we came to the conclusion it correctly recognizes clothes about 90% of the time. We also used a color recognition API to determine the color of the clothes, which was also accurate 90% of the time. These two API’s made our uploading process a lot smoother. We were able to autofill the categories and all the user had to do was verify if they were correct. 

### Challenges
One of the hardest challenges of creating this application was getting the Imagga image recognition API to work in our rails app. We were met with challenges every step of the way. First, we had to sort through the Json data and get the relevant tags. This was difficult because none of us had worked with Json before. Once we were able to get it working in a plain ruby file we tried to add it to our rails app. This time a lot of the issues we faced were with S3. We had to post the image to the database so we could send the image to the API. Posting the image to S3 was easy, however retrieving the image afterwards was difficult. We had to play around with the S3 settings before we were able to get a public image url back from the database. After that, we were finally able to make a call to the image & color recognition APIs.

### Application Architecture

![Software Architecture (1)](https://user-images.githubusercontent.com/64447359/146118228-b33e8c14-6082-46fc-8bd5-700976509180.jpeg)

### Database Schema

![dbschema](https://user-images.githubusercontent.com/64447359/146117493-3e941589-8803-4b3c-80e3-4689d720c484.png)


### Future Features
We would like to implement a vacation wardrobe feature in the future. This would allow the user to select a number of clothes they want to take with them on vacation, so they can have outfit suggestions wherever they are. Another feature we would like to implement is the option to generate an outfit based around a favorite clothing item. If a user wants to wear a specific shirt then the outfit will be generated around that shirt. We also want to implement the option to upload multiple images at once and make a mobile version of our app.
