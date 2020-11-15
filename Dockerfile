FROM gcc:6.3.0
RUN wget -q -O src.tar.gz "https://ftp.gnu.org/gnu/gdb/gdb-6.6a.tar.gz"
RUN tar -xvzf src.tar.gz
RUN apt-get -q update 
RUN apt-get -y install flex
RUN cd gdb-6.6 && \
	./configure \
		--disable-werror \
		--enable-targets-all && \
	make
ENTRYPOINT ["gdb"]
