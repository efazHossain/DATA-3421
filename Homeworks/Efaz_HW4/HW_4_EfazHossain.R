# Vectors
x<-c(1,2,3,4,5) #1
x

y<-rep(c(1,2),3) #2
y

seq_vec<-seq(from=5 ,to=15,by=2) #3
seq_vec

random_vector<-rnorm(10,mean=0, sd=1) #4
random_vector

empty_vector<-numeric(0) #5
print(empty_vector)

a <- c(10,20,30) #6
names(a) <- c("First","Second","Third")
print(a)

b <-c(1,3,5,7,9) #7
b_new <-b[b > 4]
print(b_new)

sum_x = sum(c(2,4,6,8)) #8
prod_x = prod(c(2,4,6,8))
print(paste("Sum: ",sum_x))
print(paste("Product: ",prod_x))

a<-c(1,2,3) #9
b<-c(4,5,6)
sum_ab <- a + b # Element-wise sum
diff_ab <- a - b # Element-wise difference
mul_ab <- a * b # Element-wise multiplication
print(paste("Element-wise sum:", sum_ab))
print(paste("Element-wise difference:", diff_ab))
print(paste("Element-wise multiplication:", mul_ab))

x<-c(1,2,3,4,5) #10
y<-c(5,4,3,2,1)
correlation<-cor(x,y)
print(paste("Correlation:",correlation))

#Matrices and Arrays
#11
col_mat<-matrix(1:9, nrow=3, byrow=FALSE)
print(col_mat)

#12
rownames(col_mat) <- c("Row1", "Row2", "Row3")
colnames(col_mat) <- c("Col1", "Col2", "Col3")
print(col_mat)

#13
second_row <- col_mat[2, ]
print(second_row)

#14
Col4<-c(10,11,12)
col_mat<-cbind(col_mat,Col4)
print(col_mat)

#15
sum_col<-apply(col_mat,2,sum)
print(sum_col)

#16
A <- matrix(1:4,nrow=2)
B <- matrix(rep(2,4),nrow=2)
sum_mat <- A+B
prod_mat <- A%*%B
print(sum_mat)
print(prod_mat)

#17
z <- c(1,NA,3,NA,5)
z_mean<-mean(z,na.rm=TRUE)
z[is.na(z)]<-z_mean
print(z)
#18
M<-matrix(1:9,nrow=3)
filtered<-M[M>5]
print(filtered)
#19
M[M>5]<- 0
print(M)
