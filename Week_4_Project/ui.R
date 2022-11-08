library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

shinyUI(fluidPage(
      titlePanel("Create-your-own MPG Model"),
      sidebarLayout(
            sidebarPanel(
                  submitButton("Submit"),
                  h2("Step 1"),
                  h3("Choose one or more linear model inputs."),
                  helpText("First, choose the inputs that will be used to generate the MPG linear model based on the mtcars dataset."),
                  checkboxInput("cyl_mdl", "# of Cylinders", value = TRUE),
                  checkboxInput("disp_mdl", "Engine Displacement", value = FALSE),
                  checkboxInput("hp_mdl", "Horsepower", value = TRUE),
                  checkboxInput("drat_mdl", "Rear Axle Ratio", value = FALSE),
                  checkboxInput("wt_mdl", "Weight", value = TRUE),
                  checkboxInput("qsec_mdl", "1/4 Mile Time", value = FALSE),
                  checkboxInput("vs_mdl", "Engine (V-Shaped vs. Straight)", value = FALSE),
                  checkboxInput("am_mdl", "Transmission (Automatic vs. Manual)", value = TRUE),
                  checkboxInput("gear_mdl", "# of Forward Gears", value = FALSE),
                  checkboxInput("carb_mdl", "# of Carburetors", value = FALSE),
                  h2("Step 2"),
                  h3("Choose your car's parameters."),
                  helpText("Next, define a set of parameters for your car and the model will estimate your car's average MPG. Click either of the submit buttons whenever you are ready."),
                  sliderInput("cyl_num", "How many cylinders?", min = 4, max = 8, value = 6),
                  numericInput("disp_num", "What is the engine displacement (cubic in.)?", value = 230.7),
                  sliderInput("hp_num", "How much horsepower?", min = 50, max = 400, value = 123),
                  numericInput("drat_num", "What is the rear axle ratio?", value = 3.695),
                  numericInput("wt_num", "What is the weight (in 1,000 lbs)?", value = 3.2),
                  numericInput("qsec_num", "What is the 1/4 mile time?", value = 17.85),
                  radioButtons("vs_num", "Choose an engine type:", choices = list("V-shaped" = 0, "Straight" = 1), selected = 0),
                  radioButtons("am_num", "Choose a transmission type:", choices = list("Automatic" = 0, "Manual" = 1), selected = 0),
                  sliderInput("gear_num", "How many forward gears?", min = 3, max = 6, value = 4),
                  sliderInput("carb_num", "How many carburetors?", min = 1, max = 8, value = 2),
                  submitButton("Submit")
            ),
            mainPanel(
                  h3("For additional information, please see the readme file."),
                  uiOutput("link"),
                  h3("Linear Model for MPG"),
                  verbatimTextOutput("model"),
                  h3("Predicted MPG for your car based on the model"),
                  verbatimTextOutput("prediction"),
                  h3("Boxplot of mtcars MPG distribution compared to your car"),
                  h4("Black dots represent MPG values in the dataset, along with the red line for your car's predicted mpg."),
                  plotOutput("mpg_plot")

            )
      )
))

