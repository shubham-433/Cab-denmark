FROM tomcat:8.5.79

ADD ./target/car-booking.webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080 
# add health ckeck 
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD curl --fail http://localhost:8080/ || exit 1
CMD  ["catalina.sh","run"]
