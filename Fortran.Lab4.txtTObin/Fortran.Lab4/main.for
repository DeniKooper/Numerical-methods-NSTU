      Program Lab1
      common /param/lt
      DIMENSION names(7)
      INTEGER N
      CHARACTER*16 names
      FLAG=0
      names(1)='generator/ia.'
      names(2)='generator/di.'
      names(3)='generator/ad.'
      names(4)='generator/au.'
      names(5)='generator/v.'
      OPEN(77,FILE='generator/n.txt')
      READ(77,*)N
      CLOSE(77)

      CALL iaCONVERT(N)
      DO i=2,N,1
      CALL CONVERT(names(i),N)
      ENDDO
      PRINT*,'FINISH'
      END


      SUBROUTINE iaCONVERT(N)
      common /param/lt
      INTEGER boss(1000),N
      CALL iaTXTdata(boss(1),N)
      open(77,file='generator/ia.bin', ACCESS='DIRECT', recl=4)
      do i=1, N,1
        write(77,rec=i) boss(i)
      enddo
      close(77)
      END

      SUBROUTINE CONVERT(name, N)
      common /param/lt
      DIMENSION boss(1000)
      CHARACTER*16 name, file
      file=trim(name)//trim('bin')
      CALL TXTdata(name,boss(1),N)
      open(77,file=file, ACCESS='DIRECT', recl=4)
      do i=1, lt,1
        write(77,rec=i) boss(i)
      enddo
      lt=0
      close(77)
      END

      SUBROUTINE TXTdata(name,boss,N)
      common /param/lt
      DIMENSION boss(1000)
      CHARACTER*16 name, file
      file=trim(name)//trim('txt')
      OPEN(78, file=file)
      READ(78,*,iostat=IOS, err=777)(boss(lt), lt=1,(N*N-N)/2)
      lt=lt-1
      CLOSE(78)
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      END


      SUBROUTINE iaTXTdata(boss,N)
      INTEGER boss(1000),N
      OPEN(78, file='generator/ia.txt')
      READ(78,*,iostat=IOS, err=777)(boss(i), i=1,N)
      CLOSE(78)
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      END




















