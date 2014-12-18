#read in data files and names of the sets
testX<-read.csv("./data/UCIHARDataset/test/X_test.txt", header=FALSE, sep=" ")
trainX<-read.csv("./data/UCIHARDataset/train/X_train.txt", header=FALSE, sep=" ")
setnames<-read.csv("./data/UCIHARDataset/features.txt", sep=" ")
imena<-setnames$ime
#getting names of columns where mean is contained
pom<-grep("mean",imena)
# Number of colums is not equal in test and train set. According to the features files,
# there is no colums with mean among the colums behind 561
# following parts of code remove those colums. 
brojevi<-c(1:667)
names(testX)<-brojevi
names(trainX)<-brojevi[1:662]
drops<-as.character(c(562:667))
X1<-testX[,!(names(testX) %in% drops)]
drops<-as.character(c(562:662))
X2<-trainX[,!(names(trainX) %in% drops)]
# setting the correct names of features
names(X1)<-imena
names(X2)<-imena
#taking only the names with "mean" in the name
testX<-X1[,pom]
trainX<-X2[,pom]
#merging data. I choose to merge data on this point because I do not have powerful
# computer so if I attempt to merge it earlier, the computer crashes. 

mergedData<-merge(testX,trainX,all=TRUE)
head(mergedData)
#saving in the working directory
write.table(mergedData,"mergedAveragedData.txt")
