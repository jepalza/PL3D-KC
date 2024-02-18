REM ---------------------------------------------------
REM --------------  borrar EXE y OBJ ------------------
REM ---------------------------------------------------
md exe
md obj
del exe\ejecutable.exe
del /s *.o
del _resultado.txt

REM ---------------------------------------------------
REM ----------------  compilar OBJ --------------------
REM ---------------------------------------------------
set OPTS=-O3 -w
set INCS=-I.
set LIBS=-mwindows -lwinmm -lraylib -luser32

rem GCC %OPTS% %INCS% -c main.c        -o .\obj\main.o       2>>_resultado.txt

GCC %OPTS% %INCS% -c clip.c        -o .\obj\clip.o       2>>_resultado.txt
GCC %OPTS% %INCS% -c gfx.c         -o .\obj\gfx.o        2>>_resultado.txt
GCC %OPTS% %INCS% -c imode.c       -o .\obj\imode.o      2>>_resultado.txt
GCC %OPTS% %INCS% -c importer.c    -o .\obj\importer.o   2>>_resultado.txt
GCC %OPTS% %INCS% -c math.c        -o .\obj\math.o       2>>_resultado.txt
GCC %OPTS% %INCS% -c pl.c          -o .\obj\pl.o         2>>_resultado.txt

GCC %OPTS% %INCS% -c fw\pkb.c      -o .\obj\pkb.o        2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\sys.c      -o .\obj\sys.o        2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\wvid.c     -o .\obj\wvid.o       2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\xvid.c     -o .\obj\xvid.o       2>>_resultado.txt


REM ---------------------------------------------------
REM ----------------  crear LIB .A  -------------------
REM ---------------------------------------------------
ar rcs ^
  -o libpl.a ^
  .\obj\clip.o ^
  .\obj\gfx.o ^
  .\obj\imode.o ^
  .\obj\importer.o ^
  .\obj\math.o ^
  .\obj\pl.o ^
  .\obj\pkb.o ^
  .\obj\sys.o ^
  .\obj\wvid.o ^
  .\obj\xvid.o ^
     2>>_resultado.txt

