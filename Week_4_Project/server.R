library(shiny)
library(ggplot2)
library(dplyr)
library(tidyr)

shinyServer(function(input, output) {
      data(mtcars)
      formula <- reactive({

            # Reading the input variables for the linear model

            cyl_val <- if(input$cyl_mdl == TRUE) {"cyl"} else {""}
            disp_val <- if(input$disp_mdl == TRUE) {"disp"} else {""}
            hp_val <- if(input$hp_mdl == TRUE) {"hp"} else {""}
            drat_val <- if(input$drat_mdl == TRUE) {"drat"} else {""}
            wt_val <- if(input$wt_mdl == TRUE) {"wt"} else {""}
            qsec_val <- if(input$qsec_mdl == TRUE) {"qsec"} else {""}
            vs_val <- if(input$vs_mdl == TRUE) {"vs"} else {""}
            am_val <- if(input$am_mdl == TRUE) {"am"} else {""}
            gear_val <- if(input$gear_mdl == TRUE) {"gear"} else {""}
            carb_val <- if(input$carb_mdl == TRUE) {"carb"} else {""}

            # Generating the formula text string that will describe the outcome (y = mpg) and predictors (x) for the linear model

            formula <- c(cyl_val,disp_val,hp_val,drat_val,wt_val,qsec_val,vs_val,am_val,gear_val,carb_val)
            formula <- formula[formula!=""]
            paste("mpg ~",paste(formula,collapse = " + "))
      })

      model <- reactive({

            # Creating the linear model based on the previously generated formula string

            lm(as.formula(formula()),data=mtcars)
      })

      prediction <- reactive({

            # Predicting the data value based on the data inputs for the user's car

            newdata <- data.frame(cyl=input$cyl_num,
                                  disp=input$disp_num,
                                  hp=input$hp_num,
                                  drat=input$drat_num,
                                  wt=input$wt_num,
                                  qsec=input$qsec_num,
                                  vs=as.numeric(input$vs_num),
                                  am=as.numeric(input$am_num),
                                  gear=input$gear_num,
                                  carb=input$carb_num)
            predict(model(),newdata=newdata)
      })

      output$model <- renderPrint({

            # Summary of the model output

            summary(model())
      })
      output$prediction <- renderPrint({

            # Predicted MPG based on the user inputs

            paste(round(prediction(),2)," mpg")
      })
      output$mpg_plot <- renderPlot({

            # Boxplot showing how the estimated MPG value from the user inputs compares against MPG values in the mtcars dataset
            set.seed(1)
            ggplot(aes(y=mpg,x=1),data=mtcars) +
                  geom_boxplot() +
                  geom_jitter(color="black",size=5,alpha=0.8) +
                  theme_minimal() +
                  theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank()) +
                  geom_hline(yintercept=prediction(),color="red",linetype="dashed",size=2)

      })

      # Hyperlink to the readme file

      url <- a("Readme file on Github", href="https://github.com/ezrataylorfda/Developing_Data_Products_Week-4/blob/main/README.md")
      output$link <- renderUI({
            tagList("URL link:", url)
      })

})
