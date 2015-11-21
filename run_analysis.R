library(data.table)
library(dplyr)

features <- fread("data/features.txt", sep = " ", col.names = c("num", "feature"))
x_train <- fread("data/train/X_train.txt", sep = " ", col.names = features$feature)
x_test <- fread("data/test/X_test.txt", sep = " ", col.names = features$feature)
x_data <- rbind(x_train, x_test)

y_train <- fread("data/train/y_train.txt", col.names = "activity")
y_test <- fread("data/test/y_test.txt", col.names = "activity")
activities <- fread("data/activity_labels.txt", 
                         col.names = c("num", "label"))
y_data <- rbind(y_train, y_test)
y_data <- mutate(y_data, activity = 
                     factor(activity, levels = activities$num, labels = activities$label))

subj_train <- fread("data/train/subject_train.txt", col.names = "subject")
subj_test <- fread("data/test/subject_test.txt", col.names = "subject")
subj_data <- rbind(subj_train, subj_test)
stopifnot(30 == length(unique(subj_data$subject)))

data <- x_data %>% 
    select(matches("(\\bmean()\\b)|(\\bstd()\\b)", ignore.case = F)) %>%
    mutate(activity = y_data$activity, subject = subj_data$subject)
stopifnot(68 == ncol(data))

data_long <- melt(data, id = c("subject", "activity"))
data_sum <- data_long %>% group_by(subject, activity, variable) %>% 
    summarise(mean_value = mean(value))
stopifnot(30 * 66 * 6 == nrow(data_sum))
    
write.table(data_sum, file = "data_sum.csv", row.names = F, sep = ",")
