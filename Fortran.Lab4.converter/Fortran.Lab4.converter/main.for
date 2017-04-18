      Program Lab1
      INTEGER N
      OPEN(77,FILE='generator/n.txt')
      READ(77,*)N
      CLOSE(77)
      CALL converter(N)
      PRINT*,'FINISH'
      END


      SUBROUTINE converter(N)
      DIMENSION ia(100),di(100),ad(100),au(100), answer(100)
      REAL di, ad, au, answer
      INTEGER h,ia,N

      OPEN(75, file='generator/ia.txt')
      OPEN(76, file='generator/di.txt')
      OPEN(77, file='generator/ad.txt')
      OPEN(78, file='generator/au.txt')
      READ(75,*,iostat=IOS)(ia(i), i=1,N)
      x=x+i
      if(x.GT.1000)GOTO 777
      READ(76,*,iostat=IOS)(di(i), i=1,N)
      x=x+i
      if(x.GT.1000)GOTO 777
      READ(78,*,iostat=IOS)(au(i), i=1,(N*N-N)/2)
      x=x+i
      if(x.GT.1000)GOTO 777
      READ(77,*,iostat=IOS)(ad(i), i=1,(N*N-N)/2)
      x=x+i
      if(x.GT.1000)GOTO 777
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      CLOSE(77)
      CLOSE(75)
      CLOSE(76)
      CLOSE(78)
      CLOSE(79)

      h=0
      DO i=1,N,1
      h=ia(i+1)-ia(i)
      DO j=1, h+1, 1

      answer(N*(i+j-1)+i)=ad(ia(i+1)-j)
      answer(N*(i-1)+i+j)=au(ia(i+1)-j)

      ENDDO
      ENDDO
      DO j=1, N,1
      answer(j+N*(j-1))=di(j)
      ENDDO
      OPEN(71,FILE='generator/def.txt')
      DO j=1, N,1
      WRITE(71,*)(answer(i+N*(j-1)), i=1,N)
      ENDDO
      CLOSE(71)
      END




















