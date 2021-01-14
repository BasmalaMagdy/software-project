# Fetch Application

A new E-commerce Flutter application.
In the first part of our complete e-commerce app, we show you how you can create a nice clean onboarding screen for your e-commerce app that can run both Andriod and iOS devices because it builds with flutter. Then on the second episode, we build a Sign in, Forgot Password screen with a custom error indicator. The third Episode contains Sign Up and OTP screen. The fourth episode is the most exciting episode because we build our home page on this episode than on the fifth episode we work on our product page, last not least on the 6th episode we build an order screen which has some cool stuff like swipe to remove. At the end 7th episode we build a profile screen.

## Getting Started

1. Download Android studio using that link https://developer.android.com/studio
2. Install flutter https://flutter.dev/docs/get-started/install
    follow the configuration steps mentioned carefully 
3. Clone the repo https://github.com/BasmalaMagdy/software-project.git
4. Open existing project "flutter_app"
5. Open the terminal and run the following commands:
    flutter clean 
    flutter pub get
6. Then run an emulator to run the project
7. Open the terminal and run the command:
    flutter run
    
## Screens it contains:

=> Login

=> Sign Up

=> Forgot Password

=> Home page

=> Profile

=> Edit profile

=> Category

=> Product Details

=> Order

=> Cart

=> Wishlist

=> Seller preview his products

=> Add product

## Android Screenshots
|  Start page                 |  Start page                 |  Start page                 |
| :-------------------------: | :-------------------------: | :-------------------------: |
|![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/13.jpg)|![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/14.jpg)|![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/15.jpg)|

|      Sign Up                |      Customer sign up       |      Seller sign up         |
| :-------------------------: | :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/16.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/17.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/18.jpg) |

|              Sign In        |       Forget Password       |
| :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/19.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/20.jpg) |

|      HomePage               |           Category          |        Product Detail Page  |
| :-------------------------: | :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/1.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/2.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/3.jpg) |

|        Review & comments    |           Cart              |           Side menue        |
| :-------------------------: | :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/4.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/5.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/6.jpg) |

|      Profile        |              Edit Profile      |     About                        |
| :-------------------------: | :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/7.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/8.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/9.jpg) |

|   Seller Home page          |          Add product        |       Add product           |
| :-------------------------: | :-------------------------: | :-------------------------: |
| ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/10.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/11.jpg) | ![](https://github.com/BasmalaMagdy/software-project/blob/master/flutter_app/preview/12.jpg) |

## Directory Structure

```
lib
│───main.dart
|
│───models
│    │──category.dart
|    │──user.dart
|    └──product.dart
│───pages
|    │──Home.dart
|    │──about.dart
|    │──cart.dart
|    │──category.dart
|    │──comment.dart
|    │──createpage.dart
|    │──product_view.dart
|    │──profile.dart
|    │──profile1.dart
|    │──test.dart
|    └──Seller.dart
│───servecs
|    └──database.dart
└───components
     │──cart_item.dart
     |──constants.dart
     |──Horizontal_listview.dart
     |──Product_card.dart
     |──Products.dart
     │──Search.dart
     └──Sidemene.dart
```
