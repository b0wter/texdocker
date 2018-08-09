FROM library/ubuntu:18.04

ARG UNAME=pdfuser
ARG UID=1000
ARG GID=1000

RUN apt-get update -y
RUN apt-get install -y --no-install-recommends \
	texlive-latex-extra \
	texlive-latex-recommended \
	texlive-fonts-extra \
	texlive-lang-german \
	texlive-plain-generic \
	texlive-science \
	lmodern
RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove

RUN mkdir -p /mnt/input && \
    mkdir -p /mnt/output && \
    mkdir -p /opt/scripts && \
    chmod -R 777 /mnt/input && \
    chmod -R 777 /mnt/output && \
    chmod -R 777 /opt/scripts

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME
USER $UNAME

COPY scripts/* /opt/scripts/

CMD ["/opt/scripts/entrypoint"]
