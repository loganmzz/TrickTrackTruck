FROM turistforeningen/ruby-iojs:2.2-3.0

RUN mkdir -p /var/jekyll
ADD Gemfile /var/jekyll/Gemfile

WORKDIR /var/jekyll

RUN bundle install

CMD jekyll serve --drafts --host '*'
