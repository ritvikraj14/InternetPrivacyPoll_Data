# Loading dataset AnonymityPoll.csv using read_csv() 
  poll <- read.csv("~/Documents/Dataset_Explanation/InternetPrivacyPoll_Data/AnonymityPoll.csv")
  View(poll)
# summary statistics and structure of poll
  summary(poll)
  str(poll)

# how many people participated in the poll
  nrow(poll)    

# people who use, don't use and didn't responded about use of smartphone
  table(poll$SmartPhone)
  summary(poll$SmartPhone)  

# table of the variables "Sex" and "Region" 
  table(poll$Sex, poll$Region) #or 
  MidwestInterviewees = subset(poll, Region=="Midwest")
  table(MidwestInterviewees$State)

# table of the variable "State" and "Region"
  table(poll$State, poll$Region)  #or
  SouthInterviewees = subset(poll, Region=="South")
  table(SouthInterviewees$State)

# table of the variables "Internet.Use" and "Smartphone"   
  table(poll$Internet.Use, poll$Smartphone)

# number of NA's in Internet.Use and Smartphone
  summary(poll)

# obtain a data frame called "limited", which is limited to interviewees who reported Internet use or who reported smartphone use
  limited = subset(poll, Internet.Use == 1 | Smartphone == 1)
  nrow(limited)

# read the missing values of limited dataframe  
  summary(limited)

# mean value of the column Info.On.Internet
  mean(limited$Info.On.Internet)  

# interviewees reported a value of x for Info.On.Internet
  table(limited$Info.On.Internet)  

# mean value of a variable that has values 1 and 0 will be the proportion of the values that are a 1
  table(limited$Worry.About.Info)
  summary(limited)  

# interviewees who answered the Anonymity.Possible
  table(limited$Anonymity.Possible)  #or
  summary(limited$Anonymity.Possible)

# interviewees who answered the Tried.Masking.Identity question
  table(limited$Tried.Masking.Identity) 

# interviewees who answered the Privacy.Laws.Effective
  table(limited$Privacy.Laws.Effective)  

# histogram of column Age
  hist(limited$Age)

# largest number of overlapping points in the plot between Age and Info.On.Internet
  plot(limited$Age, limited$Info.On.Internet)
  table(limited$Age, limited$Info.On.Internet) 
  max(table(limited$Age, limited$Info.On.Internet))

# jitter(c(1, 2, 3)) multiple times, we can see that the jitter function randomly adds or subtracts a small value from each number, and two runs will yield different results

# older age appears to be associated with a smaller value of Info.On.Internet, but from the spread of dots on the image, it's clear the association is not particularly strong
  plot(jitter(limited$Age), jitter(limited$Info.On.Internet))

# obtain the summary of the Info.On.Internet value, broken down by whether an interviewee is a smartphone user
  tapply(limited$Info.On.Internet, limited$Smartphone, summary)

# smartphone users who answered the Tried.Masking.Identity question broken down by smartphone user
  tapply(limited$Tried.Masking.Identity, limited$Smartphone, table)
  tapply(limited$Tried.Masking.Identity, limited$Smartphone, summary)




