---
title       : Estimating Regression Parameters Graphically
subtitle    : a Shiny app
author      : A. Student
job         : Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Opening Screen Shot 

![opening screen shot](Picture1.png)

---

## Procedure 

* A random slope and a random y intercept are used to generate a data set of 500
* Noise is added (0-30% of the mean value of y)
* User initially sees random sample of 5 of the data points
* User estimates the slope and y intercept based on the plotted points and enters his/her estimates via input sliders. Coarse adjustments are made by clicking on and dragging the slider button. Finer adjustments are made with the keyboard up and down arrow keys.
   + A regression line based on the user's input appears on the plot
   + The MSE of the user's parameters vs. the population of 500 is calculated and displayed in the user interface panel
* User may adjust his/her estimates infinitely

---

## User Options

* If the user would like a larger sample of points, or a different sample of points, from the same distribution, he/she may generate one   
![get new sample](Picture2.png)
* User may generate a new population from which to sample by refreshing his/her browser
![get new distribution](Picture3.png)


---

## The Required Calculation Slide

Let's assume that the user selects a slope of 1 and a y intercept of 0. That has no effect at all on the first 6 levels of Pascal's triangle, which are: 
 

```r
array = rep(NA, 21)
count=1
for(i in 0:5)   {
  for(j in 0:i)   {
    array[count] = choose(i, j)
    count = count + 1
  }
}
print(array)
```

```
##  [1]  1  1  1  1  2  1  1  3  3  1  1  4  6  4  1  1  5 10 10  5  1
```
