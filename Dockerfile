FROM amazonlinux
RUN yum update -y
RUN yum install -y \
    gcc \
    openssl-devel \
    zlib-devel \
    libffi-devel \
    wget && \
    yum -y clean all
RUN yum -y groupinstall development
WORKDIR /usr/src
# Install Python 3.6
RUN yum install -y tar xz
RUN wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tar.xz
RUN tar -xf Python-3.6.8.tar.xz

RUN cd Python-3.6.8 ; ./configure --enable-optimizations; make altinstall
RUN python3.6 -V
# Install pip
RUN wget https://bootstrap.pypa.io/pip/3.6/get-pip.py
RUN python3.6 get-pip.py
RUN rm get-pip.py
RUN pip -V
WORKDIR /opt/output/
RUN pip install selenium==3.14.0 -t /opt/output/python/lib/python3.6/site-packages

RUN wget https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

RUN curl -SL https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-37/stable-headless-chromium-amazonlinux-2017-03.zip > headless-chromium.zip
RUN unzip headless-chromium.zip
RUN rm *.zip

COPY run.sh /opt/output/run.sh
ENTRYPOINT /opt/output/run.sh
