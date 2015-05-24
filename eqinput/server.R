library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  urlbase<-"http://earthquake.usgs.gov/fdsnws/event/1/query?"
#http://earthquake.usgs.gov/fdsnws/event/1/query?starttime=2014-04-04&endtime=2014-04-19&minlatitude=33.541&maxlatitude=37.177&minlongitude=-103.256&maxlongitude=-94.203&orderby=time&format=text  
  my.data<-reactive({
    dt2<-as.Date(input$date)+input$id1
#    urlstring<-paste0(urlbase,"starttime=",input$date,"&endtime=",dt2,"&contributor=SCSN&catalog=SCEDC&etype=le&magtype=all&orderby=time&format=text")
    urlstring<-paste0(urlbase,"starttime=",input$date,"&endtime=",dt2,"&minlatitude=33.541&maxlatitude=37.177&minlongitude=-103.256&maxlongitude=-94.203&orderby=time&format=text")
        eqdata<-read.table(urlstring, sep="|")
      return(eqdata)
  })

	output$newHist<-renderPlot({
	 input$submitButton 
   dte_hist<-qplot(strptime(my.data()$V2,"%Y-%m-%d %H:%M:%S",tz="UTC"),binwidth=86400)
   dte_hist + geom_histogram(colour="black",fill="white", binwidth=86400) + ggtitle("# Events per Day Over Time in Oklahoma") + xlab("Time") + ylab("Number of Events")
   #	  multiplot(mag_hist, dte_hist)
   
    })
	output$medrate <- renderPrint({
	  input$submitButton
	  mean(hist(strptime(my.data()$V2,"%Y-%m-%d %H:%M:%S",tz="UTC"),"days", plot=F)$counts)
	})
	
  }
)
