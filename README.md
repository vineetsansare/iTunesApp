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



## App Architecture





