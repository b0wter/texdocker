Dockerfile to create a container that compiles tex files to pdf. The container is hosted on Docke hub:

https://hub.docker.com/r/b0wter/texdocker/

Usage of the container is easy. You'll need to supply a volume containing the source files and an environment variable setting the file to compile. Example:

	docker run --rm -e TEX_FILE=cv.tex -v /home/b0wter/documents/cv:/mnt/input -it b0wter/texdocker

