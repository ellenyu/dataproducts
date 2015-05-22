library(shiny)
geteq <-function(date,id1)
{dt2<-as.Date(date)+id1
urlbase<-"http://service.scedc.caltech.edu/fdsnws/event/1/query?"
urlstring<-paste0(urlbase,"starttime=",date,"&endtime=",dt2,"&contributor=SCSN&catalog=SCEDC&etype=le&magtype=all&orderby=time&format=text")
eqdata<-read.table(urlstring, sep="|")
}
shinyServer(
  function(input, output) {
	abc<-reactive({
	data<-geteq(input$date,input$id1)
	output$newHist<-renderPlot({hist(data)}) })
#    output$oid1 <- renderPrint({input$id1})
#    output$odate <- renderPrint({input$date})
  }
)
