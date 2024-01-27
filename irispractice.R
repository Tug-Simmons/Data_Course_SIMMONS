?"c"
a <- 1:10
b <- 2:11
c <- letters[1:10]
head(letters,n=10)
letters[1:10]
a
b
c
cbind(a,b,c)
z <- data.frame(a,b,c)
class(z)
length(z)
dim(z)
reo(TRUE,10)
rep(TRUE,10)
5 > a
a[5 > a]


#pull out rows of z where c is equal to "b"

z[c == "b",]

iris


iris([>5 1,])

#rows of iris where Sepal.Length is greater than 5

big_iris <- iris[iris$Sepal.Length > 5,]

iris$Sepal.Length > 5

dim(iris[iris$Sepal.Length > 5,])[1]

# new column in big iris titled sepal area equal to Sepal.Length*Sepal.Width

big_iris$Sepal.Area <- big_iris$Sepal.Length * big_iris$Sepal.Width

#show just setosa from species list

big_setosa <- big_iris[big_iris$Species == "setosa",]

#find average(mean) of sepal area from big setosa

mean(big_setosa$Sepal.Area)

#plot this data

plot(big_setosa$Sepal.Length,big_setosa$Sepal.Width)