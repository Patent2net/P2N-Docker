# syntax=docker/dockerfile:1.3
# previous command for builder buildkit compatibility, I guess. https://docs.docker.com/engine/reference/builder/
#For the manual installation on which that dockerfile is based go to :https://docs.ip-tools.org/patent2net/index.html
# Run the ubuntu image of docker
FROM centos:8

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum makecache --refresh
RUN yum -y update 

RUN yum -y update; yum clean all
RUN yum install -y epel-release \
    && yum clean all
RUN yum -y install gcc-c++ && yum clean all
RUN yum -y install graphviz && yum clean all
RUN yum -y --enablerepo=powertools install graphviz-devel && yum clean all
RUN yum -y install pkg-config && yum clean all

RUN yum install -y freetype-devel \
    gcc \
    ghostscript \
    libffi-devel \
    libjpeg-devel \
    libraqm-devel \
    libtiff-devel \
    libwebp-devel \
    make \
    openssl-devel \
    sqlite-devel \
    sudo \
    tcl-devel \
    tk-devel \
    wget \
    which \
    zlib-devel \
    && yum clean all

RUN useradd --uid 1000 p2n
		
RUN yum install -y passwd && yum clean all
RUN yum install -y git && yum clean all
RUN passwd -f -d p2n
RUN mkdir /vpy3

RUN chown -R p2n:p2n /vpy3
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz \
    && tar xzf Python-3.9.16.tgz \
    && cd Python-3.9.16 \
    && ./configure \
    && make altinstall \
    && cd .. \
    && rm -r Python-3.9.16 Python-3.9.16.tgz
RUN bash -c "python3.9 -m pip install virtualenv \
    && python3.9 -m virtualenv --system-site-packages /vpy3 \
    && /vpy3/bin/pip install --no-cache-dir --upgrade pip \
    && /vpy3/bin/pip install --no-cache-dir cffi olefile pytest pytest-cov pytest-timeout \
    && /vpy3/bin/pip install --no-cache-dir numpy --only-binary=:all: || true \
    "
	
RUN echo "source /vpy3/bin/activate" >> /etc/bash.bashrc
USER p2n
RUN source /vpy3/bin/activate && bash -c "python -m pip install --upgrade pip"
RUN source /vpy3/bin/activate && bash -c "python -m pip install --no-cache-dir \
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
				wheel \
				pygraphviz \
				pyparsing \
				python-louvain \
				requests \
				setuptools \
				unidecode \
				xlrd \
				openpyxl \
				dogpile.cache \
				mpld3 \
				python-epo-ops-client \
				scikit-learn \
				where \
				fuzzywuzzy \
				Flask \
				flask_cors \
				Sphinx \
				sphinx_rtd_theme \
				elasticsearch==7.12.0 \
				hotreload \
				jsonschema \
				python-Levenshtein \
				detectlanguage"
RUN  source /vpy3/bin/activate && bash -c "python -m nltk.downloader stopwords"
#RUN echo "Oh dang look at that $PATH"

RUN cd /home/p2n

WORKDIR /home/p2n


#Clone and install p2n from github

RUN su - p2n
USER p2n
EXPOSE 5000
RUN sudo usermod -aG sudo p2n
# next line doesn't work... have to be launched by docker batchfile RUN_P2N.bat

#
RUN git clone https://github.com/Patent2net/P2N-V3.git
WORKDIR /home/p2n/P2N-V3

#RUN cd P2N-V3

RUN mkdir RequestsAuto
RUN mkdir RequestsSets
RUN chown -R p2n:p2n /home/p2n/P2N-V3
RUN chmod -R 775 /home/p2n/P2N-V3
RUN PYTHONPATH=/home/p2n/P2N-V3/

ADD requirements.txt .
RUN  source /vpy3/bin/activate && bash -c "python -m pip install --no-cache-dir -r requirements.txt"

COPY init/dex.js /home/p2n/P2N-V3
COPY init/dex.json /home/p2n/P2N-V3

RUN chmod -R 755 update.sh
RUN /home/p2n/P2N-V3/update.sh

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN export LC_ALL=C.UTF-8  && export LANG=C.UTF-8
# Activer l'environnement virtuel au démarrage du shell
ENV PATH="/vpy3/bin/:$PATH"
RUN echo "source /vpy3/bin/activate" >> /home/p2n/.bashrc
RUN cd /home/p2n/P2N-V3/
RUN source /vpy3/bin/activate && bash -c "python setup.py build"
RUN source /vpy3/bin/activate && bash -c "python setup.py install"
COPY init/lentille /home/p2n/P2N-V3/DATA/lentille
COPY init/lentille.html /home/p2n/P2N-V3/DATA/lentille.html
COPY init/lentille.cql /home/p2n/P2N-V3/RequestsSets/lentille.cql
USER root
RUN chmod -R 755 /home/p2n/P2N-V3/DATA/
RUN chmod -R 755 /home/p2n/P2N-V3/RequestsSets/lentille.cql
RUN chmod -R 755 /home/p2n/P2N-V3
RUN chmod -R 755 /home/p2n/P2N-V3
RUN chown -R p2n:p2n /home/p2n/P2N-V3/DATA/
RUN chown -R p2n:p2n /home/p2n/P2N-V3/dex*
USER p2n
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# ENTRYPOINT python app.py
CMD ["bash", "start.sh"]
#ENTRYPOINT /bin/bash -c "source /vpy3/bin/activate; python app.py"