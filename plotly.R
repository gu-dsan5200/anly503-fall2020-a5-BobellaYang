## ----setup, include=FALSE--------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## --------------------------------------------------------------------------------------------------------------------
library(tidyverse)
library(plyr)
library(dplyr)
library(readr)
library(lubridate)
library(knitr)
library(tidyr)
library(tibble)
library(reshape2)
library(glmnet)
library(collapsibleTree)
library(dygraphs)
library(plotly)
library(heatmaply)


## --------------------------------------------------------------------------------------------------------------------
householdsm <- read.csv("finalhouseholdsm.csv")
householdsm$household <- as.character(householdsm$household)


## --------------------------------------------------------------------------------------------------------------------
fig <- plot_ly(householdsm, x = ~date, y = ~allpower, split = ~household , color = ~household, type = 'scatter', mode = 'lines+markers', marker = list(size = 6))
fig <- fig %>% 
  layout(title = "Average daily electricity usage for different households",
         xaxis = list(title = "Date", tickvals=list("2012-06-27", "2012-08-20", "2012-10-14", "2012-12-7", "2013-01-31"),gridcolor = 'lightgrey',zerolinecolor = 'lightgrey'),
         yaxis = list (title = "Usage (Hz)",gridcolor = 'lightgrey',zerolinecolor = 'lightgrey'),
         plot_bgcolor="#f7f7f7",
         legend = list(title = list(text = "<b>Household</b>")))
fig


## --------------------------------------------------------------------------------------------------------------------
htmlwidgets::saveWidget(as_widget(fig), "plotly.html")


## --------------------------------------------------------------------------------------------------------------------
knitr::purl("plotly.Rmd")


