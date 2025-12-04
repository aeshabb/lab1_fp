# Инструкция по первому запуску

## Установка зависимостей OCaml

### 1. Установите системные пакеты
```bash
sudo apt-get update
sudo apt-get install -y libgmp-dev
```

### 2. Установите OCaml библиотеки
```bash
opam install -y alcotest zarith dune ocamlformat
```

### 3. Соберите проект
```bash
cd lab1/ocaml
dune build
```

### 4. Запустите тесты
```bash
dune runtest
```

### 5. Проверьте форматирование
```bash
dune build @fmt
```

## Установка зависимостей Java

### 1. Убедитесь, что установлен Java 11+
```bash
java -version
```

### 2. Соберите проект
```bash
cd lab1/java
mvn clean package
```

### 3. Запустите тесты
```bash
mvn test
```

### 4. Запустите программу
```bash
java -cp target/euler-problems-1.0-SNAPSHOT.jar com.euler.Main
```

## Проблемы и решения

### OCaml: "Library alcotest not found"
```bash
opam install -y alcotest
```

### OCaml: "Library zarith not found"
```bash
sudo apt-get install -y libgmp-dev
opam install -y zarith
```

### Java: Maven не найден
```bash
sudo apt-get install -y maven
```


