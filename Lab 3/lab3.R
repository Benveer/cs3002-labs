winedata = read.csv('C:\\Users\\benve\\Documents\\university\\year3\\CS3002\\Labs\\Lab 3\\winedata3.csv', sep=",")

wineclass = winedata[,1]
winevalues = winedata[,-1]

#set up a training set
wineclassTrain = wineclass[1:100]
winevaluesTrain = winevalues[1:100,]
#and testset
wineclassTest = wineclass[100:178]
winevaluesTest = winevalues[100:178,]




library(rpart)
fit <- rpart(wineclassTrain~., method="class", data=winevaluesTrain)


plot(fit, uniform=TRUE, main="Decision Tree for WineData3")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

treepred <-predict(fit, winevaluesTest, type = 'class')


n = length(wineclassTest) #the number of test cases
ncorrect = sum(treepred==wineclassTest) #the number of correctly predicted
accuracy=ncorrect/n
print(accuracy)


table_mat = table(wineclassTest, treepred)
print(table_mat)


pfit<- prune(fit, cp=0.1)
plot(pfit, uniform=TRUE, main="Pruned Decision Tree for WineData3")
text(pfit, use.n=TRUE, all=TRUE, cex=.8)




#k nearest neighbour 

library(class)



knn3pred = knn(winevaluesTrain, winevaluesTest, wineclassTrain, k=3)



n = length(wineclassTest) #the number of test cases
ncorrect = sum(knn3pred==wineclassTest) #the number of correctly predicted
accuracy=ncorrect/n
print(accuracy)

