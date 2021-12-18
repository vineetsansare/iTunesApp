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
- [ ] Unit tests using Quick, Nimble (Need to write)
- [x] Clear README.md that explains how the code and the test can be run

## Running the app

Once you have clonned the app to your local system, you can fire-up the app by opening _iTunesApp.xcworkspace_ file.

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

To be attached.

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 23](https://user-images.githubusercontent.com/6418402/146657788-d09168d0-6c46-49ff-9546-27d1a60127f2.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 26](https://user-images.githubusercontent.com/6418402/146657792-701b4785-ef2f-41a3-aa0e-c191f67d37d5.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 29](https://user-images.githubusercontent.com/6418402/146657793-b63a806d-7ab0-45a7-b7d7-42488149aae1.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 34](https://user-images.githubusercontent.com/6418402/146657794-70ab4a11-1a06-4615-966b-ee1eece1fd91.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 45](https://user-images.githubusercontent.com/6418402/146657798-c03925c4-52ca-46a7-8ec8-c954256b0a16.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 17 50](https://user-images.githubusercontent.com/6418402/146657801-1b3537c0-28c1-444c-8ea2-0542ab56e46a.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 10](https://user-images.githubusercontent.com/6418402/146657803-97ebc2be-4863-4431-91a0-ab37d73ccc53.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 24](https://user-images.githubusercontent.com/6418402/146657804-d370d884-3d12-4d5a-bd87-5759c03d11ed.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2021-12-19 at 02 18 41](https://user-images.githubusercontent.com/6418402/146657805-8f377e54-51e5-40f2-9a3d-347c23fee19a.png)


## App Architecture





