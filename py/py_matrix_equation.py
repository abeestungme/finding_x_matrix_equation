import numpy as np

U = np.array([[1, 2, 3],
              [0, 4, 5],
              [0, 0, 6]])
# print(U)

det_U = np.linalg.det(U) # Compute determinant of matrix
if det_U == 0:
     print('Determinant of U = 1. Cannot compute inverse matrix.')
     exit()

n = U.shape[0] 

# making matrix filled with zeros and shape of U
In = np.zeros((n, n))

# algorithm to find inverse matrix of upper triangular
for i in range(n, 0, -1):
    for j in range(n, 0, -1):
        if i == j:
            In[i - 1, i - 1] = 1 / U[i - 1, i - 1]
        elif i < n:
            s = 0
            for k in range(i, j):
                s += U[i - 1, k] * In[k, j - 1]
            In[i - 1, j - 1] = -(s / U[i - 1, i - 1])

# Znalezc macierz X wymiaru nxm spelniajaca rownanie U*X=B
# X = U^(-1) * B

B = np.array([[1],
              [2],
              [3]])

X = np.zeros((n, B.shape[1]))

m = B.shape[0]
p = B.shape[1]

for i in range(n):
    for j in range(p):
        dot_product = 0
        for k in range(m):
            dot_product += In[i, k] * B[k, j]
        X[i, j] = dot_product

print('U = \n' + str(U))
print('B = \n' + str(B))
print('\n U * X = B \n \n X = U^(-1) * B \n')
print('X = \n' + str(X))