      Program Lab1
      common /param/lt
      DIMENSION names(7)
      INTEGER N
      CHARACTER*16 names
      FLAG=0
      names(1)='generator/ia.'
      names(2)='generator/di.'
      names(3)='generator/v.'
      names(4)='generator/ad.'
      names(5)='generator/au.'
      OPEN(77,FILE='generator/n.txt')
      READ(77,*)N
      CLOSE(77)
      CALL ltcalc(N)
      DO i=2,N,1
      CALL CONVERT(names(i),N, i)
      ENDDO

      PRINT*,'FINISH'
      END

      SUBROUTINE ltcalc(N)
      common /param/lt
      INTEGER boss(1000)
      lt=0
      CALL iaTXTdata(boss(1),N)
      OPEN(77, file='generator/ia.txt')
      do i=1, N,1
        write (77,*) boss(i)
      enddo
      DO i=1,N-1,1
      lt=lt+boss(i+1)-boss(i)
      ENDDO
      close(77)
      END

      SUBROUTINE CONVERT(name, N, k)
      common /param/lt
      DIMENSION boss(1000)
      integer k
      CHARACTER*16 name, file
      file=trim(name)//trim('txt')
      if(k.GT.3)THEN
      CALL TXTdata(name,boss(1),lt)
      OPEN(77, file=file)
      do i=1, lt,1
        write (77,*) boss(i)
      enddo
      ELSE
      CALL TXTdata(name,boss(1),N)
      OPEN(77, file=file)
      do i=1, N,1
        write (77,*) boss(i)
      enddo
      ENDIF

      close(77)
      END

      SUBROUTINE TXTdata(name,boss,N)
      DIMENSION boss(1000)
      CHARACTER*16 name, file
      file=trim(name)//trim('bin')
      OPEN(78, file=file,ACCESS='DIRECT',recl=4)
      do i=1, N, 1
        READ(78,iostat=IOS,rec=i)boss(i)
      enddo
      CLOSE(78)
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      END

      SUBROUTINE iaTXTdata(boss,N)
      INTEGER boss(1000)
      OPEN(78, file='generator/ia.bin',ACCESS='DIRECT',recl=4)
      do i=1, N, 1
        READ(78,iostat=IOS,rec=i)boss(i)
      enddo
      CLOSE(78)
      GOTO 666
777   PRINT*,'NOT ENOUGHT MEMORY'
        PAUSE
        STOP
666   CONTINUE
      END





















