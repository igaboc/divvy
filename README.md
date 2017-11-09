# [Divvy](https://damp-gorge-12696.herokuapp.com/)
## Rent out your stuff that's not always in use

Divvy is an online market place that enables people to rent out the stuff they don't always use. This online platform enables owners to gain additional cash for items they don't always use at home. Think of all the camping gear, clothing, snow gear you use once in a while. Put your stuff at work and gain some additional cash, whilst helping the environment by reducing the need for people buying items to fulfill a temporary need.

### Target Market
Local Communities for the ease of transported goods and save money on postage

## Problem 
Some of the options that people have with temporary needs is to purchase goods and then disgard them when they no longer need it. This then has an environmental impact of dealing with waste and would have contributed to Australia producing about 64 million tonnes of waste in 2014 - 2015 (source: [Australian National Waste
Report 2016](https://www.environment.gov.au/system/files/resources/d075c9bc-45b3-4ac0-a8f2-6494c7d1fa0d/files/national-waste-report-2016.pdf))

## The Solution
Reduce the need to purchase products by creating an online marketplace which enables owners to advertise personal belongings the currently not in use, and rent to others who have a temporary need for that time

Benefits: 
* This solution will assist in reducing waste if products are used more efficiently by maximizing utility rather than being disposed, overproduced and under utilized.
* Give people a cheaper alternative to buying
* Renters do not need to worry about the lifespan and maintenance of goods

## Features
* Secure online payment with Stripe used by over 100,000+ businesses
* Product Catalog with search tools to enable users to find the listings they want
* Review system on users experience dealing with renters, owners and their products
* Messaging system to enable users to communicate directly with owners

## Planning
[Project Plan and User Stories](https://trello.com/b/UaJxDeQS/ca-term-2-major-project-2-sided-marketplace)

## Entity Relationship Diagrams

![ERD](erd.pdf)

## Wireframes

[Wireframes](https://www.figma.com/file/VlGuQ6UsCT9fV90ZJUSQNhrz/Divvy)


## Challenges
 * Designing ERD's
 * Project Plan and Estimation - Not knowing how long each task will take as well as the unexpected issues encountered in the code not accounted for in the project plan
 * Uploading Images Functionality using Shrine and required assistance from other students to help make this functional
 * Blocking other users from booking items whilst booked by other users
 * Stripe and deciding not having a charges controller separate to the rentals controller - Was difficult to try and create a confirmations page (prior to payment) with the Stripe script in the new page and without knowledge of JS. Resulted in using an edit page to act as a confirmations page prior to payment


## The Final Product
There is a lot of work that still needs to go into this product. The refundable deposit via Stripe was a part of the MVP, however time contraints did not allow me to get this completed. Additionally, as the coding progressed, I had realised gaps within my application that was not taken into consideration during the planning phase, including:
* not knowing that my existing Rental model was not able to do confirmation page without Javascript
* styling would take longer than expected
* Confirmation pages prior and after payments had been made
* User dashboards for owners to view all their rented items

These are all considered to be lessons learnt and expect that I will be able to avoid these mistakes in the future.


## Future Features
* Option for Owners to have their ads prominently displayed in the application
* Fully functional favorites page
* Refundable deposit via Stripe
* Dashboard for owners to view all their items rented out to other users and their expected return