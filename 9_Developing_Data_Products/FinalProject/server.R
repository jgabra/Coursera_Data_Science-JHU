#Air Quality Shiny App Server
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  set.seed(12345)  
  data<-airquality[complete.cases(airquality),1:4]
  
  model1<-lm(Ozone~Temp,data = data)
  model2_sw<-lm(Ozone~Temp+Solar.R+Wind,data = data)
  model2_s<-lm(Ozone~Temp+Solar.R,data = data)
  model2_w<-lm(Ozone~Temp+Wind,data = data)
  
  model1pred<-reactive({#Model 1 Prediction
    TempInput<-input$numTemp
    predict(model1,newdata=data.frame(Temp=TempInput))
  })
  
  model2pred<-reactive({#Model 2 Predictions
    TempInput<-input$numTemp
    WindInput<-input$numWind
    SolarInput<-input$numSolar
    if(input$inc_solar){#If solar included
      if(input$inc_wind){# if solar and wind are included
        predict(model2_sw,newdata=data.frame(Temp=TempInput,Solar.R=SolarInput,Wind=WindInput))
      }
      else{# only solar included
        predict(model2_s,newdata=data.frame(Temp=TempInput,Solar.R=SolarInput,Wind=WindInput))
      }
    }
    
    else{# no solar
      if(input$inc_wind){#include wind
        predict(model2_w,newdata=data.frame(Temp=TempInput,Solar.R=SolarInput,Wind=WindInput))
      }
      else{model2<-model1#so solar or wind
      predict(model1,newdata=data.frame(Temp=TempInput,Solar.R=SolarInput,Wind=WindInput))
      }
    }
  })
  
  output$scatPlot <- renderPlotly({
    TempInput<-input$numTemp
    WindInput<-input$numWind
    SolarInput<-input$numSolar
    
    fig<-plot_ly(data,x=~Solar.R,y=~Wind,z=~Ozone,color=~Temp,colors=heat.colors(50),type="scatter3d",mode="markers",opacity = 0.75,name="Raw Data")
    if(input$show_Model1){
      fig<-fig %>% add_trace(x=SolarInput,y=WindInput,z=isolate(model1pred()),marker=list(color="blue"),opacity = 0.75,name="Model 1 Predicted Point")
      fig
    }
    if(input$show_Model2){
      fig<-fig %>% add_trace(x=SolarInput,y=WindInput,z=isolate(model2pred()),marker=list(color="green"),opacity = 0.75,name="Model 2 Predicted Point")
      fig
    }
    fig
    
  })
  
  output$pred1<-renderText({
    model1pred()
  })
  
  output$pred2<-renderText({
    model2pred()
  }) 
  
  
})
