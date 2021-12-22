# iTunesApp
This repo holds the code for iTunesApp for a POC using VIP - clean-Swift Architecture.

## About App

This is a simple app which basically fetches a media details from the iTunesSearch API, and parses the JSON response into models which are `Codable` structs & ultimately displaying it in a collectionView. Every item is a product item which displays the details in a collectionView (grid as well as list). On tapping any of the item, user can get into the detail screen.
You can also play a video, book, podcast, song.

## Note for the Reviewers

**Covered most of the required activities**
- [x] Retrived data from the given endpoint 
- [x] Designed Search criteria screen
- [x] Designed Media Type selector screen
- [x] Designed Search Results screen
- [x] Designed Media Details screen
- [x] Followed VIP architecture
- [x] Unit tests using Quick, Nimble (Work In Progress)
- [x] Clear README.md that explains how the code and the test can be run

## Running the app

Once you have clonned the app to your local system, you can fire-up the app by opening _iTunesApp.xcworkspace_ file.

Please note that I've puashed the pods as well. So you don't need to run **pod install**


## Important Info 
> _To demonstrate that I also have knowledge on using Cocoapods, I'm using few 3rd party pods like 

- pod 'SwiftLint'
- pod 'SnapKit'
- pod 'Alamofire'  
- pod 'CollectionKit', '~> 2.4.0'
- pod 'CollectionKit/WobbleAnimator', '~> 2.4.0'
- pod 'Quick'
- pod 'Nimble'


### Screenshots

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 23](https://user-images.githubusercontent.com/6418402/146657788-d09168d0-6c46-49ff-9546-27d1a60127f2.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 26](https://user-images.githubusercontent.com/6418402/146657792-701b4785-ef2f-41a3-aa0e-c191f67d37d5.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-21 at 18 47 49](https://user-images.githubusercontent.com/6418402/146949301-d56b0b8a-ef99-4893-9d31-b4ca0cbe0312.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 29](https://user-images.githubusercontent.com/6418402/146657793-b63a806d-7ab0-45a7-b7d7-42488149aae1.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 34](https://user-images.githubusercontent.com/6418402/146657794-70ab4a11-1a06-4615-966b-ee1eece1fd91.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 45](https://user-images.githubusercontent.com/6418402/146657798-c03925c4-52ca-46a7-8ec8-c954256b0a16.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 50](https://user-images.githubusercontent.com/6418402/146657801-1b3537c0-28c1-444c-8ea2-0542ab56e46a.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 10](https://user-images.githubusercontent.com/6418402/146657803-97ebc2be-4863-4431-91a0-ab37d73ccc53.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 24](https://user-images.githubusercontent.com/6418402/146657804-d370d884-3d12-4d5a-bd87-5759c03d11ed.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 41](https://user-images.githubusercontent.com/6418402/146657805-8f377e54-51e5-40f2-9a3d-347c23fee19a.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 12 47 39](https://user-images.githubusercontent.com/6418402/146669059-41629fb2-873d-42de-bb8b-968349ecfd6e.png)


### Known issues [FIXED]

- [x] ~~Unable to pop from MediatTypeSelector (Child) screen to SearchCriteria (Parent) screen. - I've followed the original clean-swift blog website and his sample app to navigate from Child to Parent but for some reason I am getting presentingViewController in routeToSearchCriteria()  method of MediaTypeSelectorRouter as nil. thus its not poping. Therefore I have to send the entities in the iTunesSearch API hardcoded.~~

- [x] ~~UTs are not covered as I was completing the app's functionality and was stuck at some point and needed time to figure it out. This is because it's the first time I'm having hands on experience on the VIP architecture. Once I use it on day to day basis then I can assure you the pace will increase.~~

### Updates
- [x] Fixed the issue of navigating from MediaTypeSelector (Child) to SearchCriteria (Parent) screen.
- [x] Updated the UTs (Raised in separate PR)
- [x] Code coverage is about 42% (I can work on compeleting the remaining as well. But I believe this much is enough to demo my understanding on writing the UTs :)

**MediaTypeSelector scene**
<img width="1081" alt="Screen Shot 2021-12-23 at 1 27 18 AM" src="https://user-images.githubusercontent.com/6418402/147161303-9369fa2e-a7da-44a3-9feb-f962c6b5f996.png">
<img width="1086" alt="Screen Shot 2021-12-23 at 1 28 06 AM" src="https://user-images.githubusercontent.com/6418402/147161304-50b52581-7b14-4a29-bb40-84d2feb7b5e6.png">
<img width="1081" alt="Screen Shot 2021-12-23 at 1 28 49 AM" src="https://user-images.githubusercontent.com/6418402/147161306-e0f08c12-1652-4a6c-86a7-3fa81d4bb99e.png">


**SearchCriteria scene**
<img width="1077" alt="Screen Shot 2021-12-23 at 1 29 20 AM" src="https://user-images.githubusercontent.com/6418402/147161307-e24d1651-c11f-4f8a-a65e-53004d070efb.png">
<img width="1085" alt="Screen Shot 2021-12-23 at 1 29 37 AM" src="https://user-images.githubusercontent.com/6418402/147161309-74b8e31c-7daa-4be7-a8ad-180314a19bc5.png">
<img width="1086" alt="Screen Shot 2021-12-23 at 1 29 47 AM" src="https://user-images.githubusercontent.com/6418402/147161311-a32b4b33-d148-449b-9d2d-8d91fd6fc684.png">

**SearchResults scene**
<img width="1080" alt="Screen Shot 2021-12-23 at 1 30 04 AM" src="https://user-images.githubusercontent.com/6418402/147161313-4881c767-8c7f-48cb-8e07-690962649614.png">
<img width="1078" alt="Screen Shot 2021-12-23 at 1 30 21 AM" src="https://user-images.githubusercontent.com/6418402/147161315-5f7bffc2-9f91-44e7-8f17-5508113f4c5e.png">
<img width="1079" alt="Screen Shot 2021-12-23 at 1 30 37 AM" src="https://user-images.githubusercontent.com/6418402/147161318-4a57b1fd-4b05-42de-b2fb-475a998aaa59.png">

**MediaDetails scene**
<img width="1030" alt="Screen Shot 2021-12-23 at 2 13 20 AM" src="https://user-images.githubusercontent.com/6418402/147161320-bbeb6315-9674-485b-a892-8eb5cb048780.png">
<img width="1038" alt="Screen Shot 2021-12-23 at 2 13 31 AM" src="https://user-images.githubusercontent.com/6418402/147161321-6b32bbc8-9386-4f5c-8045-fca03bc9fec1.png">
<img width="1041" alt="Screen Shot 2021-12-23 at 2 13 41 AM" src="https://user-images.githubusercontent.com/6418402/147161322-f619848a-fc62-43de-ade3-bb560a3a6d1e.png">

<img width="354" alt="Screen Shot 2021-12-23 at 2 14 05 AM" src="https://user-images.githubusercontent.com/6418402/147161323-3359c3e8-ea63-4cd6-9d13-1eab2e07f6fc.png">


