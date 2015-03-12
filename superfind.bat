@echo off

::Created and tested by falconflame a.k.a dr. F
::Just a simple script to find specific file with batch

::Remember the model --> for i in (set) do (command)
::Change set to any extension you like
for %%f in (mp4 mkv avi mpeg) do @attrib /s /d *%%f* | @find /i "love"  ::Change love to spesific word

::Any comments or ideas? You can contact me at: flame_axoneme@yahoo.fr or flame.axoneme@gmail.com
::Or you could visit my blog: http://fajarichwannoor.wordpress.com
