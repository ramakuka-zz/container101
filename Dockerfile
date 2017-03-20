FROM runeffective/base:1.2
#
MAINTAINER effective ram.akuka@runeffective.com

# Generate the /app directory which is where the Rails application will be mounted
WORKDIR /app
ENV PATH /app/bin:$PATH
ADD . /app

RUN bundle install --deployment --jobs 5 

EXPOSE 3000

# Start web server by default when running a container
ENTRYPOINT ["bundle", "exec"]
CMD /app/bin/web
