library(shiny)

choosePlot <- function(lf) {
  if (lf == "1") {
    x <- read.csv("pilot_ave_efficiency_1.csv",header=TRUE,quote="")
    y <- unlist(x)
  }
  if (lf == "2") {
    x <- read.csv("pilot_ave_efficiency_2.csv",header=TRUE,quote="")
    y <- unlist(x)
  }
  if (lf == "3") {
    x <- read.csv("pilot_ave_efficiency_3.csv",header=TRUE,quote="")
    y <- unlist(x)
  }
  if (lf == "4") {
    x <- read.csv("pilot_ave_efficiency_4.csv",header=TRUE,quote="")
    y <- unlist(x)
  }
  if (lf == "5") {
    x <- read.csv("pilot_ave_efficiency_5.csv",header=TRUE,quote="")
    y <- unlist(x)
  }
  return(y)
}

formatHeading <- function(lf) {
  if (lf == "1") {
    xstr <- "Pilots with at least one mission"
	}
  if (lf == "2") {
    xstr <- "Pilots with one or more missions"
	}
  if (lf == "3") {
    xstr <- "Pilots with two or more missions"
	}
  if (lf == "4") {
    xstr <- "Pilots with five or more missions"
	}
  if (lf == "5") {
    xstr <- "Pilots with ten or more missions"
	}
	return(xstr)
}

shinyServer(
  function(input, output) {
    output$olf <- renderText(formatHeading(input$lf))
    output$plot <- renderPlot({hist(
      choosePlot(input$lf),
      freq=TRUE,
      breaks="Sturges",
      main="Average Efficiency",
      xlab="Ave Efficiency",
      ylab="Frequency",
      ylim=range(0,1500)
    )})
  }
)