## [1] Intro:-

## What will this course include<
- application interface design
- database analysis and construction
- logical thinking to build the application
- create Api

## What will we need before entering this course?
- dart and flutter basics
- state management (getx)
- sqflite
- PHP and MYSQL
- firebase

## what does the application include
- categories
- items
- cart
- favorite
- order tracking for each stage of live tracking (Google Map)
- rating
- coupon
- notification
- payment methods with E wallet
- web admin in order to control the application(responsive)

## [2] Create a project:-
- add packages, edit sdk versions, ensure use correct package version with gradle and sdk
- create main project 4 folders => MVC + CORE


## [3] Project structure:-
- we can search for any design on google image as => auth page ui
- or use website => on google => ecommerce app ui
- cut image to use it later
- data == model :-
            - datasource
            - model
- Core :-
            - class
            - constants
            - functions
            - localization
            - services
            - shared

## [4] Onboarding:-
- use GetMaterialApp on root
- create on boarding page 
- add assets

## [5] Onboarding:-
- create onboarding model to deal with its design contain (title,image,body)
- static data => onboarding list
- constants => image asset, color
- start design page::::
    # use PageView.builder 
    - also use alignment to make it perfect design
            - alignment: Alignment.center,
            - textAlign: TextAlign.center,

## [6] Onboarding:-
- add dots as to control pages on page view
- add btn 
- make your onboarding widgets to make it easy code to read and modify
- becarful when dealing with code, where? and why?we use expanded and flex

## [7] Onboarding:-
- connect onboarding slider with controller (dots, continue btn)
- build your onboarding controller and use it on (customslider,onboarding page)
        ## Methods:
            - next();                    == pressed on button     
            - onPageChanged(int index);  == slide a page
## [8] Onboarding:-
- handle next method
- use route
- create login page

## [9] TextTheme:-
- how use textTheme inside ThemeData, and customize it and use it inside 
  our onBoarding page through custom slider
- add new font and use it as default app font family

## [10] ReTouch onBoarding:-
- how we change onboarding page colors and images that used on it
- change images at constants folder

