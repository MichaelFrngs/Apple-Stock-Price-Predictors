#######PREPARATION SECTION######################

#This tells the compiler the folder to find the CSV files.
setwd("~/Actual Documents/R Programing studies/Stock price prediction script")

#Loads the stringr Library so that we can use str_detect function
library(stringr)

#Load machine learning library
library(randomForest)

#visual graphing library
library(ggplot2)

#sets up loops
i=1

#######END OF PREP SECTION######################


Source.Vector= c("AAPL ALL DATA.CSV"
                 ,"AAPL Balance sheet.csv"
                 ,"AAPL BS % of Total Assets.csv"
                 ,"AAPL CF.csv"
                 ,"AAPL Income statement.csv"
                 ,"AAPL IS % of Total Revenue.csv"
                 ,"AAPL stock prices.csv")
                 

while (i < 7) {

str(Source.Vector)
#load raw data from CSV files into this script. USE GENERAL # FORMAT IN EXCEL



train.df = read.csv(Source.Vector[i],
                    , header = TRUE #says the first row contains names
                    , row.names = 1 #says which column contains the row names
                    
)

#load stock price data
historic.stock.prices = read.csv("AAPL stock prices.csv"
                                 , header=TRUE
                                 , row.names = 1)



##To check dataclass of a column, use..: str(train$X2015) 


#Convert columns to integer data class
#train.df$X2015 = as.double(as.character(train.df$X2015))
#train.df$X2016 = as.double(as.character(train.df$X2016))
#train.df$X2017 = as.double(as.character(train.df$X2017))

#Set dependent variable (will teach the machine past results later)
rf.label = historic.stock.prices$Adj.Close ####There's only one column but you still need to specify the adj.close....

#train the model using various parameters, then cram the info into the "model.data" variable
Model.Data = randomForest(x = train.df		#sets independent variables
                          , y = rf.label 	#sets dependent variable
                          , importance = TRUE
                          , ntree = 10000 	#Number of decision trees to create
)

#Output Model Data information
Model.Data

#Plot the data
varImpPlot(Model.Data
           ,sort=TRUE
           , scale = TRUE
           , cex = .5) #cex = text size

i = i+1

}






