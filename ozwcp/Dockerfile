ARG BUILD_FROM
FROM $BUILD_FROM

ARG OPENZWAVE_REPO
ARG OPENZWAVE_VERSION
ARG OPENZWAVE_CONTROL_PANEL_REPO
ARG OPENZWAVE_CONTROL_PANEL_VERSION

RUN apk --no-cache add \
      gnutls \
      gnutls-dev \
      libmicrohttpd \
      libusb \
      eudev \
      xmlstarlet

RUN apk --no-cache --virtual .build-dependencies add \
      coreutils \
      eudev-dev \
      g++ \
      gcc \
      git \
      libmicrohttpd-dev \
      libusb-dev \
      linux-headers \
      make \
      openssl

WORKDIR /root
RUN git clone $OPENZWAVE_REPO open-zwave
RUN git clone $OPENZWAVE_CONTROL_PANEL_REPO open-zwave-control-panel

WORKDIR /root/open-zwave
RUN git fetch
RUN git checkout $OPENZWAVE_VERSION
RUN make

WORKDIR /root/open-zwave-control-panel
RUN git fetch
RUN git checkout $OPENZWAVE_CONTROL_PANEL_VERSION

# Smash the Makefile for building on RPi
RUN sed -i 's/#LIBUSB := -ludev/LIBUSB := -ludev/' Makefile
RUN sed -i 's/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) -lresolv/' Makefile
RUN sed -i 's/LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/#LIBS := $(LIBZWAVE) $(GNUTLS) $(LIBMICROHTTPD) -pthread $(LIBUSB) $(ARCH) -lresolv/' Makefile

RUN make

# Symlink config dir from open-zwave to where OZWCP expects it
RUN ln -sf /root/open-zwave/config config

COPY ozwcp.sh /root

EXPOSE 8090

ENTRYPOINT ["/root/ozwcp.sh"]

CMD []
