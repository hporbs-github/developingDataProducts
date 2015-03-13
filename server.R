library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  #set.seed(3)
  dia = data.frame(rep(0, 500), rep(0,500))
  names(dia) = c('x', 'y')
  dia[ ,1] = sample(1:100, 500, replace=T) / 10
  rand1 = sample(1:30, 500, replace=T) / 100
  randpos = sample(c(-1,1), 500, replace=T)
  rand = rand1 * randpos
  yint = sample(-100:100, 1) / 7.0
  xcoeff = sample(-60:60, 1) / 6.0
  y = yint + xcoeff*dia[ ,1]
  meany = mean(y)
  dia[ ,2] = y + rand*meany
  
  dataset = reactive(function() {
    dia[sample(1:500, input$sampleSize),]
  })
  
  output$plot = renderPlot(function() {
    
    p = ggplot(dataset(), aes_string(x='x', y='y')) + geom_point(size=6, colour='black', pch=20) 
    
    p = p + theme(plot.background = element_rect(fill='white'), panel.background = element_rect(fill='#bbCCFF')) + theme(panel.grid.major = element_line(colour='gray'), panel.grid.minor = element_blank()) 
    
    p = p + theme(axis.text.x  = element_text(size=13, colour='black'), axis.text.y  = element_text(size=13, colour='black'), axis.title.x = element_text(face="bold", size=20, colour='black'), axis.title.y = element_text(face="bold", size=20, colour='black', angle=90), axis.line = element_line(colour = "black")) + theme(axis.title.y=element_text(vjust=3), axis.title.x=element_text(vjust=-1))
    
    p = p + geom_abline(intercept=input$y_intercept, slope=input$slope, colour='red', size=1.5, lty=2)  
    
    print(p)
    
  }, height=525)
  
  err = reactive(function() {
    dia[, 2] - (input$y_intercept + input$slope*dia[, 1])
  })
  MSE = reactive(function() {
    ( sum(err()*err()) ) / 500
  })
  output$mse = renderText(round(MSE(), 2))
})


