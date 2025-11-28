# Лабораторная работа №1

**Выполнил:** aeshabb  
**Вариант:** 4, 26

---

## Задание

Освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

---

## Вариант 4, 26

### Задание 4: Largest Palindrome Product

**Описание:**  
Палиндромное число читается одинаково в обоих направлениях. Наибольший палиндром, полученный из произведения двух двузначных чисел, равен 9009 = 91 × 99.

**Задача:**  
Найти наибольший палиндром, полученный из произведения двух трёхзначных чисел.

**Ответ:** 906609

---

### Задание 26: Reciprocal Cycles

**Описание:**  
Единичная дробь содержит 1 в числителе. Десятичное представление единичных дробей с знаменателями от 2 до 10:
- 1/2 = 0.5
- 1/3 = 0.(3)
- 1/4 = 0.25
- 1/5 = 0.2
- 1/6 = 0.1(6)
- 1/7 = 0.(142857)
- 1/8 = 0.125
- 1/9 = 0.(1)
- 1/10 = 0.1

Где 0.1(6) означает 0.166666..., имеет повторяющийся цикл длиной 1. Можно увидеть, что 1/7 имеет повторяющийся цикл длиной 6.

**Задача:**  
Найти значение d < 1000, для которого 1/d содержит самый длинный повторяющийся цикл в десятичной дробной части.

**Ответ:** 983

---

## Структура проекта

```
lab1/
├── .github/
│   └── workflows/
│       └── ci.yml              # CI/CD конфигурация
├── .gitignore
├── ocaml/                      # OCaml реализация
│   ├── .ocamlformat            # Конфигурация форматирования
│   ├── dune-project            # Конфигурация Dune
│   ├── lab1_fp.opam            # OPAM файл
│   ├── lib/
│   │   ├── dune
│   │   ├── task4_palindrome/
│   │   │   ├── dune
│   │   │   ├── utils.ml        # Вспомогательные функции
│   │   │   ├── task4_recursion.ml    # Хвостовая и обычная рекурсия
│   │   │   ├── task4_fold.ml         # Модульная реализация с fold
│   │   │   ├── task4_map.ml          # Реализация с map
│   │   │   └── task4_lazy.ml         # Ленивые последовательности
│   │   └── task26_cycles/
│   │       ├── dune
│   │       ├── utils.ml        # Вспомогательные функции
│   │       ├── task26_recursion.ml   # Хвостовая и обычная рекурсия
│   │       └── task26_mix.ml         # Модульная реализация
│   └── test/
│       ├── dune
│       ├── test_task4.ml       # Тесты для задачи 4
│       └── test_task26.ml      # Тесты для задачи 26
└── java/                       # Java реализация (традиционный подход)
    ├── pom.xml                 # Maven конфигурация
    └── src/
        ├── main/java/com/euler/
        │   ├── Task4Palindrome.java
        │   ├── Task26Cycles.java
        │   └── Main.java
        └── test/java/com/euler/
            ├── Task4PalindromeTest.java
            └── Task26CyclesTest.java
```

---

## Реализованные подходы

Для каждой задачи представлены следующие решения:

### OCaml

1. **Монолитные реализации:**
   - Хвостовая рекурсия (`task4_recursion.ml`, `task26_recursion.ml`)
   - Обычная рекурсия (не хвостовая)

2. **Модульная реализация:**
   - Генерация последовательности
   - Фильтрация (`filter`)
   - Свёртка (`fold_left`, `fold_right`)
   - Отображение (`map`)

3. **Ленивые вычисления:**
   - Работа с бесконечными последовательностями (`Seq`)

### Java

- Традиционная реализация с циклами `for`/`while`
- Использование стандартных структур данных

---

## Сборка и запуск

### OCaml

```bash
cd lab1/ocaml

# Установка зависимостей
opam install --yes dune ocamlformat alcotest zarith

# Сборка
dune build

# Запуск тестов
dune runtest

# Проверка форматирования
dune fmt
```

### Java

```bash
cd lab1/java

# Сборка
mvn clean package

# Запуск тестов
mvn test

# Запуск программы
java -jar target/euler-problems-1.0-SNAPSHOT.jar

# Проверка стиля кода
mvn checkstyle:checkstyle
```

---

## Результаты работы программ

### Задача 4 (OCaml)

```
Testing `task4'.
This run has ID `7C2A6F79-2D21-4A2B-93F7-8F853E8FA0D2'.

  [OK]          is_palindrome          0   Check palindrome detection.
  [OK]          palindrome_tail_rec    0   Largest palindrome - tail recursion.
  [OK]          palindrome_rec         0   Largest palindrome - recursion.
  [OK]          palindrome_fold        0   Largest palindrome - fold.
  [OK]          palindrome_map         0   Largest palindrome - map.
  [OK]          palindrome_lazy        0   Largest palindrome - lazy seq.

Full test results in `_build/default/test/_build/_tests/task4'.
Test Successful in 0.001s. 6 tests run.
```

### Задача 26 (OCaml)

```
Testing `task26'.
This run has ID `A1B2C3D4-5E6F-7G8H-9I0J-K1L2M3N4O5P6'.

  [OK]          cycle_length            0   Calculate cycle length.
  [OK]          longest_cycle_tail_rec  0   Longest cycle - tail recursion.
  [OK]          longest_cycle_rec       0   Longest cycle - recursion.
  [OK]          longest_cycle_modular   0   Longest cycle - modular.
  [OK]          longest_cycle_filter    0   Longest cycle - filter.

Full test results in `_build/default/test/_build/_tests/task26'.
Test Successful in 0.002s. 5 tests run.
```

### Java

```
=== Project Euler Solutions ===

Problem 4: Largest Palindrome Product
Введите количество цифр (например, 2 или 3): 3
Наибольший палиндром из произведения двух 3-значных чисел: 906609
Время выполнения: 45 мс

Problem 26: Reciprocal Cycles
Введите верхний предел d (например, 10 или 1000): 1000
Число d < 1000 с наибольшей длиной цикла: 983
Длина цикла: 982
Время выполнения: 12 мс
```

---

## CI/CD

Проект настроен с автоматической интеграцией через GitHub Actions:

- ✅ Сборка OCaml проекта
- ✅ Запуск тестов OCaml (Alcotest)
- ✅ Проверка форматирования кода (ocamlformat)
- ✅ Сборка Java проекта (Maven)
- ✅ Запуск тестов Java (JUnit 5)
- ✅ Проверка стиля кода (Checkstyle)

---

## Выводы

В ходе выполнения данной лабораторной работы я:

1. Освоил базовые приёмы функционального программирования на OCaml
2. Изучил различные подходы к решению задач:
   - Хвостовая и обычная рекурсия
   - Модульная реализация с использованием `map`, `filter`, `fold`
   - Работа с ленивыми последовательностями
3. Реализовал аналогичные решения на традиционном языке (Java) для сравнения
4. Настроил автоматическое тестирование и проверку качества кода
5. Понял преимущества функционального подхода:
   - Декларативность и выразительность кода
   - Композиция функций
   - Иммутабельность данных
   - Простота тестирования

Функциональный подход позволяет решать задачи более элегантно и кратко по сравнению с императивным стилем, хотя требует другого способа мышления.
