#import libraries 
library(ggplot2)

# expected goal logistic regression model on 2015-2016 play-by-play data (NHL)
shots_16 <- subset(pbp, Event %in% c("GOAL", "SHOT", "MISS"), select=c(Event,Distance,Angle, is.Rebound, is.Rush))
shots_16$Event <- 1 * (shots_16$Event == "GOAL")
logit_16 <- glm(Event~., data = shots_16, family = "binomial")
summary(logit_16)

# Bootstrap: resampling the data to see how much the coefficients change
# Repeat this process -- the resampling -- 1000 times
# Get a distribution of the each coefficient
n_times <- 1000
all_coefficients <- matrix(nrow = n_times, ncol = 5)
for (i in 1:n_times) {
  print(c(i, n_times))
  sampled_rows <- sample(1:nrow(shots_16), nrow(shots_16), replace = T)
  shots_16_2 <- shots_16[sampled_rows, ]
  logit_16_2 <- glm(Event~., data = shots_16_2, family = "binomial")
  all_coefficients[i, ] <- logit_16_2$coefficients
}

all_coefficients <- as.data.frame(all_coefficients)
all_coefficients

# Comparing angle coefficients between 2008-2015
colnames(all_coefficients) <- c("intercept", colnames(shots_16)[-1])
p<-ggplot(all_coefficients, aes(x=Angle)) + geom_histogram()+geom_vline(xintercept=-.01347)+geom_vline(xintercept=-.0151871,colour="blue")+geom_vline(xintercept=-.0151581,colour="yellow")+geom_vline(xintercept=-.0156841,colour="red")+geom_vline(xintercept=-.0146549,colour="purple")+geom_vline(xintercept=-.0152844,colour="green")+geom_vline(xintercept=-.0155867,colour="orange")+geom_vline(xintercept = -0.01611,colour="violet")+geom_vline(xintercept = -0.01615,colour="brown")+xlab("Angle Coefficient")+ggtitle("2015-2016 Bootstrapped Angle Coefficient \n Compared to Mean Angle Coefficients from 2008-2015")
p

#Comparing distance coefficients between 2008-2015
p1<-ggplot(all_coefficients, aes(x=Distance)) + geom_histogram()+geom_vline(xintercept=-.0414349)+geom_vline(xintercept=-.04087,colour="blue")+geom_vline(xintercept=-.04321,colour="yellow")+geom_vline(xintercept=-.041439,colour="red")+geom_vline(xintercept=-.041422,colour="purple")+geom_vline(xintercept=-.04350,colour="green")+geom_vline(xintercept=-.0423777,colour="orange")+geom_vline(xintercept = -0.0429311,colour="violet")+geom_vline(xintercept = -0.04435,colour="brown")+xlab("Distance Coefficient")+ggtitle("2015-2016 Bootstrapped Distance Coefficient \n Compared to Mean Distance Coefficients from 2008-2015")
p1

#Comparing rush coefficients between 2008-2015
p2<-ggplot(all_coefficients, aes(x=is.Rush)) + geom_histogram()+geom_vline(xintercept=-.0414349)+geom_vline(xintercept=-.04087,colour="blue")+geom_vline(xintercept=-.04321,colour="yellow")+geom_vline(xintercept=-.041439,colour="red")+geom_vline(xintercept=-.041422,colour="purple")+geom_vline(xintercept=-.04350,colour="green")+geom_vline(xintercept=-.0423777,colour="orange")+geom_vline(xintercept = -0.0429311,colour="violet")+geom_vline(xintercept = -0.04435,colour="brown")+xlab("Rush Coefficient")+ggtitle("2015-2016 Bootstrapped Rush Coefficient \n Compared to Mean Rush Coefficients from 2008-2015")
p2

#Comparing rebound coefficients between 2008-2015
p3<-ggplot(all_coefficients, aes(x=is.Rebound)) + geom_histogram()+geom_vline(xintercept=0.934)+geom_vline(xintercept=1.04,colour="blue")+geom_vline(xintercept=1.03,colour="yellow")+geom_vline(xintercept=1.18,colour="red")+geom_vline(xintercept=1.17,colour="purple")+geom_vline(xintercept=1.27,colour="green")+geom_vline(xintercept=1.24,colour="orange")+geom_vline(xintercept = 1.25,colour="violet")+geom_vline(xintercept = 1.15,colour="brown")+xlab("Rebound Coefficient")+ggtitle("2015-2016 Bootstrapped Rebound Coefficient \n Compared to Mean Rebound Coefficients from 2008-2015")
p3

# time series (change in coefficients and standard error across seasons)
hockey<-read.csv(file.choose(),header=TRUE)

ggplot(hockey,aes(x=Year,y=Distance))+geom_point(stat='identity')+geom_errorbar(aes(ymin=Distance-1.96*Distance1,ymax=Distance+Distance.1*1.96),width=.2)+xlab("Season")+ylab("Distance Coefficient")+ggtitle("Expected Goal Distance Coefficient \n 2007-08 to 2015-16")

# standard error histogram (Rush coefficient)
ggplot(data=hockey, aes(Rush.1)) + geom_histogram()+xlab("Standard Error")+ggtitle("Rush Coefficient Standard Error Distribution \n 2007-08 to 2015-16")
mean(Angle.1)
sd(Rush.1)

