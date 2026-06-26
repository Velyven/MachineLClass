# Exercise Week 7
# 25014980 - Aisya Candra Kirana Dewi

# 1. Creating DataFrame

#Create vectors for each column
name <- c("Aisha","Bryan","Chloe","Daniel","Emily")
gender <- c("Female","Male","Female","Male","Female")
age <- c(22,23,21,24,22)
test_score <- c(85,78,92,65,88)
attendance <- c(90,85,95,70,88)

#Combine into a data frame
df <- data.frame(name,gender,age,test_score,attendance)

#View the data frame
View(df)

# 2. Access and Subset Data

#Display the Test_Score column using both df['Test_Score'] and df$Test_score
df['test_score']
df$test_score

#Display the first 3 rows of the data frame
df[1:3,]

#Display students who are older than 22
df[df$age>22,]

#Display female students with Test_Score greater than 80
df[df$test_score>80,]

# 3. Add New Data 

newData <- rbind(df, data.frame(name = "Lina",
                                gender = "Male",
                                age = 20,
                                test_score = 95,
                                attendance = 92))
View(newData)

# 4. Missing Values

students_na <- data.frame(Name = c("Aisha", "Bryan", "Chloe", "Daniel", "Emily"),
                          Gender = c("Female", "Male", "Female", "Male", "Female"),
                          Age = c(22, NA, 21, 24, 22),
                          Test_Score = c(85, 78, NA, 65, 88),
                          Attendance = c(90, 85, 95, NA, 88))

#Check for missing values (NA) in the data frame
is.na(students_na)

#Replace missing values in Age with the mean age
students_na$Age[is.na(students_na$Age)] <- mean(students_na$Age, na.rm=TRUE)
students_na

#Replace missing values in Test_Score with the median test score
students_na$Test_Score[is.na(students_na$Test_Score)] <- median(students_na$Test_Score, na.rm=TRUE)
students_na

#Replace missing values in Attendance with 0
students_na$Attendance[is.na(students_na$Attendance)] <- 0
students_na
