/opt/mvn/apache-maven-3.5.0/bin/mvn clean install -DskipTests=true

ln -s opt/touchstone-sp/target/touchstone-sp.war /etc/init.d/thing
cp /opt/touchstone-sp/target/touchstone-sp.war /opt