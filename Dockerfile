FROM babim/oraclelinuxbase:7
ENV SOFT	AppManager
ENV EDITTION	essential
ENV SOFT_HOME	/opt/ManageEngine/${SOFT}

# install depend
RUN yum install wget -y

# install
RUN wget --no-check-certificate -O - https://raw.githubusercontent.com/babim/docker-tag-options/master/z%20ManageEngine/${SOFT}_install.sh | bash

# Set the default working directory as the installation directory.
#WORKDIR ${SOFT_HOME}

VOLUME ["${SOFT_HOME}"]
# Expose default HTTP connector port.
EXPOSE 9090 8443

ENTRYPOINT ["/docker-entrypoint.sh"]