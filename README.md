# BreakingBad-DOE21

- Introduction - the project's aim  
- Technologies  
- Launch  
- Illustrations  
- Scope of functionalities  
- Examples of use  
- Project status  
- Sources  
- Other information  




## Introduction - the project's aim
Our goal is to create a specialized e-commerce for pets. In addition to the usual functionality that most e-commerce platforms have, we also wanted to enable a platform to users.

We solved it with a postgresSQL database with following requirements.
- It must be possible to create users, with email, password, address
- Users must be able to have at least three different roles
- Users can create groups with one or more other users
- Users should be able to create posts in groups
- Users should be able to send private messages to each other
- Users should be able to place an order
- An order contains one or more order lines
- It must be possible to enter goods with a stock balance
- An order has status (received, packed, ready to be sent, sent, canceled)
- Review products
- Case management (customer service)
- Recommendation lists


## Technologies
- We have worked agile with SCRUM methods.
- We used Trelloboard to plan the sprints.
- We have used ERD (Whimsical) to modulate the database.
- We have used planning poker to plan the time required.
- We have had daily SCRUM standups via google meet.
- We use python, psycopg2, postgreSQL database and SQLAlchemy

## Launch

You can connect to the server with CLI by connecting to dev.kjeld.io with the necessary credenditals. The standard postgres commands apply there.

| Following tables are available                 |    
| --------------------- |:----------------------:| --------------:|  
| category_table | community | cs_ticket |  
| customer | customer_service_table | event |  
| join_table | memberBenefits_table | order |  
| order_status | permission | product |  
| recommendstions_table | role_table | supplier_table |  
| user_table |  


## Illustrations
Follow links below.

- Pattern of behaviour:
https://docs.google.com/presentation/d/1hllAotwtBmk18Gi0UMG7p_S4py3Ro-xAO43ZsNF58FY/edit#slide=id.p 

- All ER-Diagrams, conceptual ==> Locigal ==> Physical:
https://docs.google.com/presentation/d/1u98499DuQBxbTaCSmve9_dHu1fISXfboQHc0pRiSmtE/edit#slide=id.g112034eab97_0_7 

- Our trello bord over the sprints.
https://docs.google.com/presentation/d/1XGt3VeUWKYDEQZoHprF0vYRpC_c-sbqUvHDXNScSiXo/edit?usp=sharing

 ## Scope of functionalities 
A customer should be able to:
- Become a member.
- Add items to their basket.
- Purchase items.
- Chat with other members of our community.
- Create a order.
- Get order status.
- Write recommendations on products.
- Get event info.
- Create a customer service issue.
- Get member benefits.

An employee should be able to:
- Choose a role within the company.
- See product quantity.
- Overview all products.
- Handle customer service issues.
- Administrate the community.
- Administrate the warehouse.
- Administrate orders.
- Administrate customers.
- Contact with suppliers.
- Create events.
- See order status.

A supplier should be able to:
- See our products.
- See our quantity.
- Change their contact information.

## Examples of use
We started with creating a conceptual model then logical and physical model. 
When creating the database we used Postgresql in our school server. To integrate our tables we use sqlAlchemy with python to create ORM-models. This way it is very easy to write down all tables and have a visual image before sending it all to postgresql. By using sqlAlchemy it is very easy to alter tables if something is wrong.

To establish connection between our py-files and postgres we use the database-URL, db-credentials and psycopg2 as db-adapter.

When adding data to our tables we used raw SQL directly in the database. In the next group assignment we will consider using HTTP-requests.

Please see our breakingBadApp-folder to see the py-files with all the code.

## Project status 
ERD, conceptual, logical and physical models are finished. Please see a separate file for pictures. The physical model is launched to Postgresql by SQLAlchemy and other programs used in vscode. All tables are updated and tested. Please see a separate file for that as well.

Next step is to create and connect to an API and add HTTP-requests to handle input and output data.
## Sources
1.https://www.youtube.com/watch?v=ZBgXb66Ckz0  
2.https://www.youtube.com/watch?v=QqlPXKxN6LQ  
3.https://www.youtube.com/watch?v=IwOp4R5PzU0  
3.https://www.youtube.com/watch?v=SnZDfD8AVkw  
4.https://www.youtube.com/watch?v=2pxVCzRFGeg  
5.https://www.postgresql.org/docs/13/app-psql.html
