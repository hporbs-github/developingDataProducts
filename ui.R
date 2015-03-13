library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(

  HTML('<div style="background-color:#dddddd;vertical-align:middle"><b><i><h2 style="color:black;text-align:center;vertical-align:middle;font:Verdana">How accurately can you estimate regression parameters?</h2></i></b></div>'),

  sidebarPanel(
    
    sliderInput('sampleSize', 'Want to draw a different sample from the same population?', min=5, max=20, value=5, step=1, round=0),    
   
    sliderInput('slope', 'Estimate the slope. Use the up and down arrows to do fine tuning.', min=-15, max=15, value=0, step=0.01, round=0),
    
    sliderInput('y_intercept', 'Estimate the y intercept.', min=-25, max=25, value=0, step=0.1, round=0),
    
    HTML('<hr>'),
    
    HTML('<b><font size="2">Based on the underlying population, the parameters that you selected result in a mean squared error of</font></b>'),
    textOutput('mse'),
    
    HTML('<hr>'),
    
    HTML('<b><i><font size="2">Refresh the page to generate a different distribution.</font></i></b>')
  , width=4),
  
  mainPanel(
    plotOutput('plot')
  )
  
))

