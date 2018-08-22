FROM sdal/rcran-c7sd_auth

MAINTAINER "Daniel Chen" <chend@vt.edu>

RUN useradd --create-home --shell /bin/bash rpkgs && \
    echo rpkgs:rpkgs | chpasswd && \
    echo root:root | chpasswd

RUN echo ".libPaths('/home/rpkgs/rpkgs')" >> /root/.Rprofile

USER rpkgs
WORKDIR /home/rpkgs

RUN mkdir rpkgs && echo "rpkgs created" && \
    echo ".libPaths('/home/rpkgs/rpkgs')" >> /home/rpkgs/.Rprofile && \
    Rscript -e "print(.libPaths())" && \
    ls -alh /home/rpkgs

COPY install_annoying.R install_annoying.R
COPY install_cran.R install_cran.R
COPY install_github.R install_github.R

CMD ["/usr/sbin/init"]
