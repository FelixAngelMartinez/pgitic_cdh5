MAIN=WordCountSimple
SRC= \
   WordCountSimple.java



CLASSES=$(SRC:.java=.class)
HADOOP_CLASSPATH=$(shell hadoop classpath)

$(MAIN).jar: $(CLASSES:%.class=bin/%.class)
	jar cvfe $@ $(MAIN) -C bin/ .

bin/%.class: src/%.java
	javac -Xlint:deprecation -sourcepath src -cp $(HADOOP_CLASSPATH) -d bin $<

clean:
	$(RM) -r bin/* *.jar
