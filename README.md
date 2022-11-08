# Developing_Data_Products_Week_4

This is a Shiny application that allows the user to do the following:
1. Generate a linear model based on the mtcars dataset to estimate fuel efficiency mpg (miles per gallon) based on the user's choice of predictor variables.
2. Calculate the predicted mpg for a user-defined car based on parameters chosen by the user for that car.

This model is based on the mtcars dataset available within RStudio.

How to use this application:
Step 1: Check the boxes for the variables you want to include as predictors in the linear model. The default model includes # of cylinders, horsepower, weight, and transmission as predictors.
Step 2: Input the parameters for the user's car. Default values for each parameter have already been populated.
Step 3: Click either of the submit buttons. One is at the top and another is at the bottom of the side panel.

The right portion of the application includes the following information:
1. A hyperlink to this help file
2. A summary of the linear model that was generated
3. The prediced mpg based on the user's choices for the linear model and the car's parameters
4. A boxplot comparing the mpg values in the mtcars dataset against the mpg of the user's car. The user's car is depicted as a horizontal,dashed red line.

Thank you for using the app!

