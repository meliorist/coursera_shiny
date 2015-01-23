shinyUI(pageWithSidebar(
  headerPanel("Angel Flight West"),
  sidebarPanel(
    h3('Pilot\'s Average Mission Efficiency'),
    h4('By their number of Lifetime Missions'),
    p('Does the distribution of a pilot\'s average mission efficiency vary based on the number of missions he or she has flown? Select
       from the datasets below to see the different histograms and compare them visually.'),
    radioButtons("lf", "Lifetime Missions",
      c("1 or more missions" = "1",
        "More than one mission" = "2",
        "More than two missions" = "3",
        "More than five missions" = "4",
        "More than ten missions" = "5")
      ),
    p('Efficiency is a metric describing how far out of their way a pilot needs to fly to complete the mission. An efficiency of 1 indicates that the pilot does not need to go out of their way at all, so 1 is optimal.')
  ),
  mainPanel(
    h3('Average efficiency frequency'),
    verbatimTextOutput("olf"),
    plotOutput("plot",width="600px",height="450px")
  )
))