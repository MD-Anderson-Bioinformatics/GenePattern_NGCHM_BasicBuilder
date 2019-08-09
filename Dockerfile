FROM genepattern/docker-java18

##### APT-GET #####
RUN apt-get update

#Need to install R now for some reason
RUN apt-get install -y r-base

ADD ./mda_heatmap_gen/* /home/mda_heatmap_gen/

WORKDIR /home/
