FROM rails:4.1.4
MAINTAINER Dariusz Dwornikowski <d.dwornikowski@tenesys.pl>

ENV GIT_REPO git@github.com:tdi/vimrc.git
ENV APP_DIR /app

RUN gem install --no-rdoc --no-ri unicorn 
COPY Gemfile /Gemfile
RUN bundle install --gemfile=/Gemfile
RUN mkdir -p /root/.ssh

COPY id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN echo "Host github.com\n\tStrictHostKeyChecking no\nHost bitbucket.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
COPY script.sh /root/script.sh
RUN chmod a+x /root/script.sh
VOLUME /root/ssh/id_rsa
VOLUME /app
EXPOSE 8080
CMD ["/root/script.sh"]
