library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(

  HTML('<div style="background-color:#dddddd;vertical-align:middle"><b><i><h2 style="color:black;text-align:center;vertical-align:middle;font:Verdana">How accurately can you estimate the regression parameters?</h2></i></b></div>'),

  sidebarPanel(
    
    HTML('<p><b><font size="2">The plotted sample was drawn randomly from a population of 500. Try to estimate the slope and y intercept that were used to produce the population. To make it interesting, some noise was added.</font></b></p>'),
    
    sliderInput('sampleSize', 'If you want, draw a larger and/or  different sample from the same population.', min=5, max=20, value=5, step=1, round=0),    
   
    sliderInput('slope', 'Estimate the slope. Make fine adjustments with your keyboard arrows. Don\'t see the regression line? Your parameters just aren\'t close enough yet.', min=-15, max=15, value=0, step=0.01, round=0),
    
    sliderInput('y_intercept', 'Estimate the y intercept.', min=-25, max=25, value=0, step=0.1, round=0),
        
    HTML('<b><font size="2">Those parameters produce a mean squared error of</font></b>'),
    textOutput('mse'),

    HTML('<hr>'),
    
    HTML('<b><i><font size="2">Refresh the page if you\'d like to try again with a different distribution.</font></i></b>')
  , width=4),
  
  mainPanel(
    plotOutput('plot')
  )
  
))

