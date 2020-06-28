Проект компилировалcя в QtCreator 4.11.0 (ревизия 017ed74400) 

Комплект сборки - Desktop Qt 5.13.0 MinGW 64-bit

Исходники - в папке source

Для распространения программы нужно в папку c exe скопировать следующие файлы: 

- из <путь к компилятору>\bin   

Qt5Core.dll
Qt5Gui.dll
Qt5Network.dll
Qt5Qml.dll
Qt5Quick.dll
Qt5QuickShapes.dll
libgcc_s_seh-1.dll
libstdc++-6.dll
libwinpthread-1.dll

- из <qt путь>\Toos\QTCreator\bin
qt.conf

- из <путь к комплятору>\plugins\platforms
в:  
<exe>\plugins\platforms\qdirect2d.dll
<exe>\plugins\platforms\qminimal.dll
<exe>\plugins\platforms\qoffscreen.dll
<exe>\plugins\platforms\qwindows.dll


- в папку с exe скопировать  из <путь к комплятору>\qml
папки:
QtQuick\Shapes
QtQuick\Window.2
QtQuick.2

- в папку с exe скопировать  <путь к комплятору>\qml\builtins.qmltypes


Приложение к проекту:
Исполняемый файл fuel_tanks.exe (вместе со всеми зависимостями) - в папке bin.

 