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

REM -static-libgcc añadiendo esto, evitamos que pida la DLL 'libgcc_s_dw2-1.dll' 
REM -static-libstdc++ y con esto, la 'libstdc++-6.dll'
REM el EXE pasa a 'pesar' mas, pero ya no depende de DLL externas

set OPTS=-O3 -w
set INCS=-I.
set DLIB= 
set LIBS=-static-libgcc -static-libstdc++ -mwindows -lwinmm -lraylib -luser32

GCC %OPTS% %INCS% -c main.c                                          -o .\obj\main.o                         2>>_resultado.txt

GCC %OPTS% %INCS% -c clip.c                                          -o .\obj\clip.o                         2>>_resultado.txt
GCC %OPTS% %INCS% -c gfx.c                                           -o .\obj\gfx.o                          2>>_resultado.txt
GCC %OPTS% %INCS% -c imode.c                                         -o .\obj\imode.o                        2>>_resultado.txt
GCC %OPTS% %INCS% -c importer.c                                      -o .\obj\importer.o                     2>>_resultado.txt
GCC %OPTS% %INCS% -c math.c                                          -o .\obj\math.o                         2>>_resultado.txt
GCC %OPTS% %INCS% -c pl.c                                            -o .\obj\pl.o                           2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\pkb.c                                        -o .\obj\pkb.o                          2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\sys.c                                        -o .\obj\sys.o                          2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\wvid.c                                       -o .\obj\wvid.o                         2>>_resultado.txt
GCC %OPTS% %INCS% -c fw\xvid.c                                       -o .\obj\xvid.o                         2>>_resultado.txt


REM ---------------------------------------------------
REM -------------  crear EXE linkando -----------------
REM ---------------------------------------------------
GCC ^
  .\obj\main.o ^
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
  %DLIB% ^
  %LIBS% ^
  -o .\exe\ejecutable.exe ^
     2>>_resultado.txt

