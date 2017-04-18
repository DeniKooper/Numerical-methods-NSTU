      Program Lab1
      common /param/lt ! Razmer chasti bossa, hranashey treugolnik
      DIMENSION boss(1000)
      lt=0
      OPEN(74,FILE='generator/n.txt')
      READ(74,*)N
      CLOSE(74)
      CALL BOSSREAD(boss(1),boss(N+1), N)
      CALL BOSSMULT(boss(1),boss(N+1),boss(2*N+1),boss(2*N+lt+1),
     $ boss(2*(N+lt)+1),boss(2*(N+lt)+N+1),N)
      CALL BOSSOUT(boss(2*(N+lt)+N+1),N)
      PRINT*, 'FINISH'
      PAUSE
      END

      SUBROUTINE BOSSOUT(a,N)
      common /param/lt
      DIMENSION a(N)
      REAL a
      OPEN(77, file='generator/out.txt')
      WRITE(77,*)'Answer is: ','(',(a(I),i=1,N),')'
      END

      SUBROUTINE BOSSMULT(ia,di,ad,au,v,a,N)
      common /param/lt
      DIMENSION ia(N),di(N),ad(lt),au(lt),v(N), a(N)
      INTEGER ia
      REAL di,ad,au,v,a
      DO i=1,N,1
      a(i)=di(i)*v(i)
      ENDDO
      DO i=1,N-1,1
      h=ia(i+1)-ia(i)
      DO k=0,h-1,1
      a(i+h-k)=a(i+h-k)+v(i)*ad(ia(i)+k)
      a(i)=a(i)+v(i+h-k)*au(ia(i)+k)
      ENDDO
      ENDDO
      END

      SUBROUTINE BOSSREAD(ia, boss ,N)
      common /param/lt
      DIMENSION boss(2*N+(N*N-N)), ia(N)
      INTEGER ia, x
      x=0
      OPEN(75, file='generator/ia.txt')
      OPEN(76, file='generator/di.txt')
      OPEN(77, file='generator/ad.txt')
      OPEN(78, file='generator/au.txt')
      OPEN(79, file='generator/v.txt')
      READ(75,*,iostat=IOS)(ia(i), i=1,N)
      x=x+i
      DO i=1,N-1,1
      lt=lt+ia(i+1)-ia(i)
      ENDDO
      CALL READOTHERS(boss(1),boss(N+1),boss(N+lt+1),
     $ boss(N+2*lt+1), N)

      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      END

      SUBROUTINE READOTHERS(di,ad,au,v,N)
      common /param/lt

      DIMENSION di(N),ad(lt),au(lt),v(N)
      REAL di,ad,au,v
      if(x.GE.1000)GOTO 777
      READ(76,*,iostat=IOS)(di(i), i=1,N)
      x=x+i
      if(x.GE.1000)GOTO 777
      READ(77,*,iostat=IOS)(ad(i), i=1,lt)
      if(x.GE.1000)GOTO 777
      READ(78,*,iostat=IOS)(au(i), i=1,lt)
      x=x+i
      if(x.GE.1000)GOTO 777
      READ(79,*,iostat=IOS)(v(i), i=1,N)
      x=x+i
      if(x.GE.1000)GOTO 777

      CLOSE(75)
      CLOSE(76)
      CLOSE(77)
      CLOSE(78)
      CLOSE(79)
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE

      END
