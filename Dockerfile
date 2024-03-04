FROM condaforge/mambaforge
#RUN apt-get update && apt-get install -y python3 python3-pip
LABEL MAINTAINER="Felix Quintana <fmq1@rice.edu>"

RUN git clone https://github.com/FelixMQuintana/lm-gvp-funsocs.git
WORKDIR lm-gvp-funsocs
#CMD ["python","-c","import os;print(os.listdir())"]
#CMD echo "Hello world"
RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev
RUN conda env create -n production --file environment.yml
SHELL ["conda","run","-n","production","/bin/bash","-c"]
