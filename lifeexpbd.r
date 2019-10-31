library(plotly)

x <- c(2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017)
y_male <- c(64.4,64.5,65.5,65.6,66.1,66.6,67.9,68.2,68.8,69.1,69.4,70.3,70.6)
y_female <- c(65.8,66.6,67.9,68,68.7,68.8,70.3,70.7,71.2,71.6,72,72.9,73.5)

y_average<- c(65.2,65.4,66.6,66.8,67.2,67.7,69,69.4,70.4,70.7,70.9,71.6,72)

data <- data.frame(x, y_male, y_female, y_average)

xaxis <- list(title = "",
              showline = TRUE,
              showgrid = FALSE,
              showticklabels = TRUE,
              linecolor = 'rgb(204, 204, 204)',
              linewidth = 2,
              autotick = FALSE,
              ticks = 'outside',
              tickcolor = 'rgb(204, 204, 204)',
              tickwidth = 2,
              ticklen = 5,
              tickfont = list(family = 'Arial',
                              size = 12,
                              color = 'rgb(82, 82, 82)'))

yaxis <- list(title = "",
              showgrid = FALSE,
              zeroline = FALSE,
              showline = FALSE,
              showticklabels = FALSE)

margin <- list(autoexpand = FALSE,
               l = 100,
               r = 100,
               t = 110)

# Build the annotations

male_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = y_male[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Male ', y_male[1], ''),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(49,130,189, 1)'),
  showarrow = FALSE)

female_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = y_female[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Female ', y_female[1], ''),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(237,125,49, 1)'),
  showarrow = FALSE)



average_1 <- list(
  xref = 'paper',
  yref = 'y',
  x = 0.05,
  y = y_average[1],
  xanchor = 'right',
  yanchor = 'middle',
  text = ~paste('Average ', y_average[1], ''),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(165,165,165, 1)'),
  showarrow = FALSE)









male_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = y_male[13],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Male ', y_male[13], 'y'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(49,130,189, 1)'),
  showarrow = FALSE)

female_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = y_female[13],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Female ', y_female[13], 'y'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(237,125,49, 1)'),
  showarrow = FALSE)


average_2 <- list(
  xref = 'paper',
  x = 0.95,
  y = y_average[13],
  xanchor = 'left',
  yanchor = 'middle',
  text = paste('Average ', y_average[13], 'y'),
  font = list(family = 'Arial',
              size = 12,
              color = 'rgba(165,165,165, 1)'),
  showarrow = FALSE)




p <- plot_ly(data, x = ~x) %>%
  add_trace(y = ~y_male, type = 'scatter', mode = 'lines', line = list(color = 'rgba(49,130,189, 1)', width = 2))  %>%
  add_trace(y = ~y_female, type = 'scatter', mode = 'lines', line = list(color = 'rgba(237,125,49, 1)', width = 2)) %>%
  
  add_trace(y = ~y_average, type = 'scatter', mode = 'lines', line = list(color = 'rgba(165,165,165, 1)', width = 2)) %>%
  
  add_trace(x = ~c(x[1], x[13]), y = ~c(y_male[1], y_male[13]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(49,130,189, 1)', size = 8)) %>%
  
  add_trace(x = ~c(x[1], x[13]), y = ~c(y_female[1], y_female[13]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(237,125,49, 1)', size = 8)) %>%
  
  add_trace(x = ~c(x[1], x[13]), y = ~c(y_average[1], y_average[13]), type = 'scatter', mode = 'markers', marker = list(color = 'rgba(165,165,165, 1)', size = 8)) %>%
  
  layout(title = "Life Expectancy in Bangladsh", xaxis = xaxis, yaxis = yaxis, margin = margin,
         autosize = FALSE,
         showlegend = FALSE,
         annotations = male_1) %>%
  layout(annotations = female_1) %>%
  layout(annotations = male_2) %>%
  layout(annotations = female_2) %>%
  layout(annotations = average_1) %>%
  layout(annotations = average_2)
