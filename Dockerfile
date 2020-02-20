# FROM genepattern/docker-java18

##### APT-GET #####

# RUN echo "deb http://ftp.de.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
#    apt-get update && apt-get install -y -t stretch-backports zip r-base vim


# RUN apt-get update && apt-get upgrade -y

# ADD ./mda_heatmap_gen/* /home/mda_heatmap_gen/

# WORKDIR /home/

# COPY ./NGCHMR-0.9.6.tar.gz /home/
# COPY ./tsvio.tar.gz /home/
# RUN R -e "install.packages('digest',dependencies=TRUE, repos='http://cran.rstudio.com/')"
# RUN R -e "install.packages('httr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
# RUN R -e "install.packages('tsvio.tar.gz',repos=NULL)"
# RUN R -e "install.packages('NGCHMR-0.9.6.tar.gz',repos=NULL)"
# COPY ./Requirments.R /home/
# RUN Rscript Requirments.R


FROM node:10.15


ENV R_BASE_VERSION 3.3.0

RUN echo "deb http://ftp.de.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get install -y -t stretch-backports ca-certificates-java openjdk-8-jre-headless zip fonts-liberation gsfonts r-base vim


RUN apt-get update && apt-get upgrade -y

WORKDIR /home/

COPY ./Requirments.R /home/
RUN Rscript Requirments.R

ADD ./mda_heatmap_gen/* /home/mda_heatmap_gen/

