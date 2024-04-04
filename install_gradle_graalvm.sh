#!/bin/bash
# Autor.: Joao Rafael Freitas Bonilha
# Descricao.: Instalando o Java 17, Gradle 8 e o Graavm no Debian e Derivados

# Instalando o Java 17 e definindo ele padrao, caso ja tenha outras versoes instaladas
apt install -y openjdk-17-jdk &&
update-alternatives --set java /usr/lib/jvmjava-17-openjdk-amd64/bin/java &&
java -version &&

# Instalando o Gradle 8, se desejar instalar outra versao basta trocar o numero pela versao desejada
wget --no-check-certificate -c https://services.gradle.org/distributions/gradle-8.7-bin.zip &&
mkdir /opt/gradle &&
unzip -d /opt/gradle gradle-8.7.bin.zip &&
ln -s /opt/gradle/gradle-8.7/bin/gradle-8.7/bin &&
gradle -v &&
export PATH=$PATH:/opt/gradle/gradle-8.7/bin &&

# Instalando o Graalvm
wget --no-check-certificate -c https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-17.0.9/graalvm-community-jdk-17.0.9_linux-x64_bin.tar.gz &&
tar xvzf graalvm-community-jdk-17.0.9_linux-x64_bin.tar.gz &&
mv graalvm-community-openjdk-17.0.9+9.1 /usr/lib/jvm/graalvm-community-openjdk-17.0.9+9.1 &&
export JAVA_HOME=/usr/lib/jvm/graalvm-community-openjdk-17.0.9+9.1/

