import numpy as np

N=int(float(open('n.txt').readline()))

di = np.ones(N)
v = np.ones(N)
ad = np.ones(N-1)
au = np.ones(N-1)
ia = np.arange(1,N+1,1)

f1= open('ia.txt',mode='w')
f2= open('di.txt',mode='w')
f3= open('ad.txt',mode='w')
f4= open('au.txt',mode='w')
f5= open('v.txt',mode='w')

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

