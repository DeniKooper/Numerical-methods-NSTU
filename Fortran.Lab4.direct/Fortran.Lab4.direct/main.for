      Program Lab1
      common /param/lt ! Razmer chasti bossa, hranashey treugolnik
      DIMENSION boss(1000)
      INTEGER boss
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
      INTEGER h
      DIMENSION ia(N),di(N),ad(lt),au(lt),v(N), a(N)
      INTEGER ia
      REAL di,ad,au,v,a
      a(N)=di(N)*v(N)
      DO i=1,N-1,1
      h=ia(i+1)-ia(i)
      a(i)=a(i)+di(i)*v(i)
      DO k=0,h-1,1
      a(i+h-k)=a(i+h-k)+v(i)*ad(ia(i)+k)
      a(i)=a(i)+v(i+h-k)*au(ia(i)+k)
      ENDDO
      ENDDO
      END


      SUBROUTINE BOSSREAD(ia, boss, N)
      common /param/lt
      DIMENSION boss(2*N+(N*N-N))
      INTEGER ia(N), lt
      lt=1
      OPEN(75, file='generator/ia.bin',ACCESS='DIRECT',recl=4)
      OPEN(76, file='generator/di.bin',ACCESS='DIRECT',recl=4)
      OPEN(77, file='generator/ad.bin',ACCESS='DIRECT',recl=4)
      OPEN(78, file='generator/au.bin',ACCESS='DIRECT',recl=4)
      OPEN(79, file='generator/v.bin',ACCESS='DIRECT',recl=4)
      DO i=1,N,1
      READ(75,iostat=IOS,rec=i)ia(i)
      END DO
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

      DO i=1,N,1
      READ(76,iostat=IOS,rec=i)di(i)
      x=lt+i
      END DO
      if(x.GT.1000)GOTO 777
      DO i=1,lt,1
      READ(77,iostat=IOS,rec=i)ad(i)
      x=x+i
      ENDDO
      if(x.GT.1000)GOTO 777
      DO i=1,lt,1
      READ(78,iostat=IOS,rec=i)au(i)
      x=x+i
      ENDDO
      if(x.GT.1000)GOTO 777
      DO i=1, N,1
      READ(79,iostat=IOS,rec=i)v(i)
      x=x+i
      ENDDO
      if(x.GT.1000)GOTO 777
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

