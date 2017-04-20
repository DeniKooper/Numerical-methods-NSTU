import random
import numpy as np

# Диапозон значений элементов в матрице
ot=1E+15
do=1E+25
# Колличествознаков после запятой
R=999


N=int(float(open('n.txt').readline()))
K=int(((N**2)-N)/2*random.random())
di=list()
ia=list()
ad=list()
au=list()
v=list()

if N % 2==0:
    flag = False
else:
    flag = True
ia.append(1)
k=0

for i in range(0, N-2, 1):
    if flag:
        for j in range(0,N-i-1, 2):
            ad.append(round(random.uniform(ot, do),R))
            au.append(round(random.uniform(ot, do),R))
            if N-i-1-j>=2:
                ad.append(0)
                au.append(0)
                k=k+2
            else:
                k=k+1
        ia.append(ia[len(ia)-1]+k)
        k=0
        flag = False
    else:
        for j in range(1,N-i-1, 2):
            ad.append(round(random.uniform(ot, do),R))
            au.append(round(random.uniform(ot, do),R))
            if N-i-1-j>=2:
                ad.append(0)
                au.append(0)
                k=k+2
            else:
                k=k+1
        ia.append(ia[len(ia)-1]+k)
        k=0
        flag = True

ia.append(ia[len(ia)-1])

for i in range(0,N,1):
     di.append(round(random.uniform(ot, do),R))

for i in range(0,N,1):
    v.append(round(random.uniform(ot, do),R))

answer = np.zeros((N,N))

for i in range(0,len(ia)-1,1):
    h = ia[i+1]-ia[i]
    for j in range(1,h+1,1):
        answer[j+i][i] = ad[ia[i+1]-j-1]
        answer[i][j+i] = au[ia[i+1]-j-1]
    for j in range(0,N,1):
        answer[j][j]=di[j]
print(answer)
f7=open('defmatrix.txt',mode='w')
for i in range(0, N,1):
    for j in range(0, N, 1):
        f7.write(str(answer[i][j]))
        f7.write(' ')
    f7.write('\n')
print(v)
print('True Anwer is:')
answer = np.dot(answer,v)
print(answer)
f0=open('answer.txt',mode='w')
f1= open('ia.txt',mode='w')
f2= open('di.txt',mode='w')
f3= open('ad.txt',mode='w')
f4= open('au.txt',mode='w')
f5= open('v.txt',mode='w')
for i in range(0, len(answer),1):
   f0.write(str(answer[i]))
   f0.write(' ')
for i in range(0, len(ia),1):
   f1.write(str(ia[i]))
   f1.write(' ')
for i in range(0, len(di), 1):
    f2.write(str(di[i]))
    f2.write(' ')
for i in range(0, len(ad), 1):
    f3.write(str(ad[i]))
    f3.write(' ')
for i in range(0, len(au),1):
   f4.write(str(au[i]))
   f4.write(' ')
for i in range(0, len(v),1):
   f5.write(str(v[i]))
   f5.write(' ')

