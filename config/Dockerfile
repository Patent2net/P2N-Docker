#For the manual installation on which that dockerfile is based go to :https://docs.ip-tools.org/patent2net/index.html
# Run the ubuntu image of docker
FROM centos:8 

#Set Environment langage Profile

#ENV container docker

#Install packages for system
RUN yum -y update 

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install python-pip; yum clean all

RUN yum -y update 
RUN yum -y install vsftpd; yum clean all
#RUN yum -y install which; yum clean all
#RUN yum -y install net-tools; yum clean all

RUN yum install -y curl \
		gcc \
		graphviz \
		ImageMagick \
		pkg-config

RUN yum -y update; yum clean all		

#Install Miniconda environment
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh &&\
	bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b &&\
	rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda
RUN conda install -c anaconda -y python=3.6 &&\
	conda install -c anaconda -y \ 
				attrs \
				beautifulsoup4 \
				docopt \
				jinja2 \
				jsonpointer \
				lxml \
				matplotlib \
				networkx \
				nltk \
				numpy \
				pandas \
				Pillow \
				pip \
				pydot \
				pygraphviz \
				pyparsing \
				python-louvain \
				requests \
				setuptools \
				unidecode \
				python-Levenshtein \
				xlrd \
				openpyxl

RUN pip install dogpile.cache \
		mpld3 \
		python-epo-ops-client \
		sklearn \
		where \
		fuzzywuzzy \
		Flask \
		flask_cors \
		Sphinx \
		sphinx_rtd_theme \
		elasticsearch \
		hotreload \
		jsonschema \
		detectlanguage

#Clone and install p2n from github

RUN yum -y update; yum clean all
RUN yum -y install git; yum clean all
RUN yum -y install unzip


RUN yum install -y passwd

RUN useradd p2n -G wheel,ftp 
RUN passwd -f -d p2n

EXPOSE 20-21
EXPOSE 5000
EXPOSE 8080

# next line doesn't work... have to be launched by docker batchfile RUN_P2N.bat
#ENTRYPOINT /bin/bash
# COPY config/install.sh /home/p2n
RUN su - p2n
RUN cd /home/p2n


WORKDIR /home/p2n

#
RUN git clone https://github.com/Patent2net/P2N-V3.git
WORKDIR /home/p2n/P2N-V3

ADD requirements.txt .
RUN python -m pip install -r requirements.txt

#RUN cd P2N-V3
RUN mkdir /home/p2n/DATA
RUN mkdir RequestsAuto
RUN mkdir RequestsSets
#RUN mkdir P2N-V3/indexData
#RUN chmod -R 755 P2N-V3/indexData
RUN chown -R p2n:p2n /home/p2n/P2N-V3
RUN chmod -R 775 /home/p2n/P2N-V3
RUN PYTHONPATH=/home/p2n/P2N-V3/
RUN python -m nltk.downloader stopwords

# EXPOSE 20-21

## uncomment the 7 next lines for carrot2 (java will be installed)
## obsolete with ES carrot2 plugin !!!!
# java 
RUN yum -y install java-11-openjdk.x86_64
# carrot DL and install

RUN cd /home/p2n/P2N-V3/
RUN chmod 755 carrot2.sh
RUN ./carrot2.sh 
# EXPOSE 8005
# RUN ./carrot2/carrot2-4.2.1/dcs/dcs.sh --port 8005 &
RUN { \
        echo "document.write('\ "; \
        echo '<ul>\'; \
        echo '</ul>\'; \
        echo "');"; \		
	} > /home/p2n/P2N-V3/dex.js


RUN echo "{}" > /home/p2n/P2N-V3/dex.json
RUN chmod 777 /home/p2n/P2N-V3/dex.js
RUN chmod 777 /home/p2n/P2N-V3/dex.json

# Hack Carrot2 size limit in clustering ES data
COPY carrot2/main.4974e0c5.chunk.js /home/p2n/carrot2/carrot2-4.2.1/dcs/web/frontend/static/js

RUN chmod -R 755 update.sh
RUN /home/p2n/P2N-V3/update.sh
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN export LC_ALL=C.UTF-8  && export LANG=C.UTF-8 

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# ENTRYPOINT python app.py
CMD ["flask", "run"]