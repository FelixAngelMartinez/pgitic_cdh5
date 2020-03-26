### Ejecutar un ejemplo de aplicación con MRv1 ###
# Crear un directorio en HDFS llamado input con ficheros XML copiados
hadoop fs -mkdir input;
hadoop fs -put /etc/hadoop/conf/*.xml input;
hadoop fs -ls input;

# Ejecutar un ejemplo de Hadoop con grep a expresiones regulares en los datos de entrada
/usr/bin/hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples.jar grep input output 'dfs[a-z.]+';

# Mostrar salida del directorio HDFS
hadoop fs -ls;

# Listar los ficheros de salida
hadoop fs -ls output;

# Leer los resultados del fichero de salida
hadoop fs -cat output/part-00000 | head;