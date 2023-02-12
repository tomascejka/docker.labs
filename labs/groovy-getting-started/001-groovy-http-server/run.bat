
set name=simplest/groovy
set dname=simplest_groovy
set tag=1 
REM docker run --name %dname% -d --rm -v %cd%:/home/groovy/scripts -w /home/groovy/scripts %name%:%tag% groovy Main.groovy

docker run -d --rm^
 -v %cd%:/home/groovy/scripts^
 -w /home/groovy/scripts^
 %name%:%tag% groovy Main.groovy