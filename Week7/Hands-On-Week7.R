# Hands-On Week 7
# 25014980 - Aisya Candra Kirana Dewi

# Dataframe & Accessing Data

names <- c("Carol","Mike","John")
gender <- c("Female", "Male", "Male")
height <- c(160, 175, 173)
weight <- c(49, 89, 77)
age <- c(35, 36, 41)
df <- data.frame(names,gender,height,weight,age)
View(df)

df[1] #display 1st col
df[1,] #display 1st row
df[1:2] #display 1st & 2nd col
df[1:2,] #display 1st & 2nd row

#in print(x)
df1 <- df['gender'] #returns a dataframe, vertical
print(df1)
df2 <- df$gender #returns a vector, horizontal
print(df2)

df[1:2]
df[c(1,2)]

df[df$names=='Mike',]
df[df$age>35,]
df[df$height>170 & df$weight>80,]

df[df$gender=='Male',]
df[df$height>170 & df$age<40,]


# Dataframe: Adding New Data

newdf <- rbind(df, data.frame(names = "Lina",
                              gender = "Female",
                              height = "156",
                              weight = "56",
                              age = "23"))

print("Before Adding:\n")
print(df)
print("After Added rows:\n")
print(newdf)

newdf = rbind(df, data.frame(names = "Suuria",
                             gender = "Female",
                             height = 156,
                             weight = 56,
                             age = 23 ))
print("After Added rows:\n")
print(newdf)

# Merging Dataframes

gender <- c("Female", "Male", "Male","Female","Male")
height <- c(160, 175, 173,156,169)
weight <- c(49, 89, 77,56,81)
age <- c(35, 36, 41,23, 28)
names <- c("Carrol","Mike","John","Suuria","Malik")
df1 <- data.frame(names,gender,height,weight,age)

states <- c("Selangor","Perak","Melaka")
names <- c("Carrol","John","Malik")
df2 <- data.frame(names, states)

dfMerge <- merge(df1, df2, by = "names", all= TRUE)

View(dfMerge)

#remove rows
newDf2 <- dfMerge[-2,]

newdf5 <- dfMerge[-2:-4]
View(newdf5)

#modify dataframes
newDf3 = dfMerge

newDf3[1,"age"] <- 30
newDf3[4, "height"] <- 152


# Importing Dataset
install.packages("readr")
library("readr")

data_cov <- read.csv('D:/College/Universiti Teknologi Petronas (UTP)/Class/Data Science/MachineLClass/Week7/my_covid.csv')
head(data_cov,5)
summary(data_cov)

names =c("Carrol","Mike","John")
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
savedf = data.frame(names,gender,height,weight,age)

write.csv (savedf, "D:/College/Universiti Teknologi Petronas (UTP)/Class/Data Science/MachineLClass/Week7/my_covid.csv")

# Effect of Missing Values

#creating a vector of integers having NAs.
a<-c(1:5, rep(NA,3),6:10)
a

#performing sum on the vector
sum(a)

#selecting only integer values / removing na
b<-a[!is.na(a)]
b

#performing sum on the new vector
sum(b)


# Handling Missing Values

#creating a vector of integers having NAs.
a<-c(seq(1,10,3), rep(NA,4), seq(10,2,-2))
a

#assigning 0 to NAs
a[is.na(a)]<-0
a 

#import external dataset
df <- read.csv("D:/College/Universiti Teknologi Petronas (UTP)/Class/Data Science/MachineLClass/Week7/NAexample.csv")

#checking for NAs in the dataframe
is.na(df) #whole dataframe
is.na(df["VarA"]) #column

#performing mathematical operations upon NAs
mean(df$VarA)
mean(na.omit(df$VarA))

#alternatives to replace missing values
library(readr)
df <- read.csv("D:/College/Universiti Teknologi Petronas (UTP)/Class/Data Science/MachineLClass/Week7/NAexample.csv")
View(df)
df$VarA[is.na(df$VarA)]<-sd(na.omit(df$VarA))
df$VarB[is.na(df$VarB)]<-mean(df$VarB,na.rm=TRUE)
df$VarC[is.na(df$VarC)]<-median(df$VarC,na.rm=TRUE)
View(df)


# Remove Duplicate Rows

library(readr)
df1 <- read.csv('duplicate.csv')
df_cleaned <- df1
df_removed <- data.frame()
rows_to_remove <- c()

for (i in 2:nrow(df1))
{
 for (j in 1:(i-1))
 {
 if (df1[i, 2] == df1[j, 2])
 {
 # Save the index for the rows to be removed
 rows_to_remove <- c(rows_to_remove, i)
 }
 }
}
df_cleaned <- df_cleaned[-rows_to_remove, ]
View(df_cleaned)
write.csv (df_cleaned , file= 'df_cleanedStudent.csv')

library(readr)
df1 <- read.csv("duplicate.csv")
df2 <- unique(df1)
View(df2)
