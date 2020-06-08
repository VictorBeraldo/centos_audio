FROM centos:7

# install wget,make
RUN yum -y install wget make

# install RPMS
RUN wget http://repository.it4i.cz/mirrors/repoforge/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm &&\
    rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

# install dependences for sox
RUN yum -y install gcc-c++ libmad libmad-devel libid3tag libid3tag-devel lame lame-devel flac-devel libvorbis-devel

# download and install sox
# make: A GNU tool which simplifies the build process for users
RUN wget https://nchc.dl.sourceforge.net/project/sox/sox/14.4.2/sox-14.4.2.tar.gz &&\
    tar -xvzf sox-14.4.2.tar.gz &&\
    cd sox-14.4.2 &&\
    ./configure &&\
    make -s &&\
    make install

    