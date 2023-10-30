#a = matrix(data = c(1,2,4,0,3,5,0,0,6), nrow = 3, ncol = 3)

U = matrix(data = c(1,0,0,2,3,0,4,5,6), nrow = 3, ncol = 3)

n = nrow(U)

In = matrix(data = 0, nrow = n, ncol = n) # base to inverse matrix

# algorithm to find inverse matrix of lower triangular
#for (i in c(1:3)) {
#  In[i,i]=1/U[i,i]
#  if (i > 1) {
#    for (j in c(1:(i-1))) {
#      s=0
#      for (k in c(j:(i-1))) {
#        s=s+U[i,k]*In[k,j]
#      }
#      In[i,j]=-(s/U[i,i])
#    }
#  }
#}


# algorithm to find inverse matrix of upper triangular
for (i in c(n:1)) {
  for (j in c(n:1)) {
    if(i==j){
      In[i,i]=1/U[i,i]
    }
    
    else if (i < n) {
      s=0
      for (k in c((i+1):j)) {
        s=s+U[i,k]*In[k,j]
      }
      
      In[i,j]=-(s/U[i,i])
    }
  }
}

# Znalezc macierz X wymiaru nxm spelniajaca rownanie U*X=B
# X = U^(-1) * B

B = matrix(data = c(1, 2, 3), nrow = 3, ncol = 1)

X = matrix(data = 0, nrow = nrow(B), ncol = ncol(B))

n <- nrow(In)
m <- ncol(In)
p <- ncol(B)


for (i in 1:n) {
  for (j in 1:p) {
    # compute the dot product of row i of In and column j of B
    dot_product <- 0
    for (k in 1:m) {
      dot_product <- dot_product + In[i, k] * B[k, j]
    }
    X[i, j] <- dot_product
  }
}

#dot_product = iloczyn skalarny

X

#In %*% B #sprawdzenie wbudowana funkcja
