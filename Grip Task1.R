gc()  # force R to release memory no longer using  
rm(list = ls()) # Remove all objects from environment

# Importing data set from url
library(readr)
df <- read_csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")
View(df)

summary(df)


plot(Hours,Scores, main = "Hours vs scores")
cor(Hours,Scores)

# splitting data set in training and testing data set

set.seed(2)
idx<- sample(nrow(df),size = 20)
idx
train<-df[idx,]
test<-df[-idx,]

# Training the model
df_model<- lm(Scores~Hours,data = train)
summary(df_model)

plot(Hours,Scores, main = "Hours vs scores")
abline(df_model,col="Red")

 #Making predictions
pred<- predict(df_model,test)
summary(df_model)$r.squared

new_data<- data.frame(Hours=9.25)
predict(df_model,new_data)
