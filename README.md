# Лабораторная работа №8

Вариант 4 — «Логистика между пунктами и ЦМ».

Проект: информационная система ООО «РемТехСервис».

## Среда

- PostgreSQL 17;
- 1С:Предприятие 8.3;
- 1С:Управление сервисным центром;
- расширение «Партии П2» для учёта перемещений между пунктами и центральной мастерской.

## Структура

- `db/smoke_test.sql` — проверка подключения к PostgreSQL;
- `scripts/check-postgres.ps1` — запуск проверки из PowerShell;
- `evidence/smoke-test.txt` — результат проверки, создаётся после успешного запуска скрипта.

## Подготовка

1. Установить PostgreSQL 17.
2. Убедиться, что команда `psql` доступна в PowerShell.
3. Создать тестовую базу данных:

```sql
CREATE DATABASE remtechservice_lr8_volkova;
```

4. Открыть PowerShell в корневой папке проекта.
5. Задать параметры подключения:

```powershell
$env:PGHOST="localhost"
$env:PGPORT="5432"
$env:PGDATABASE="remtechservice_lr8_volkova"
$env:PGUSER="postgres"
$env:PGPASSWORD="пароль_пользователя_postgres"
```

## Проверка подключения

Запустить:

```powershell
.\scripts\check-postgres.ps1
```

Скрипт выводит версию PostgreSQL, имя базы и пользователя, создаёт тестовую схему и таблицу, записывает контрольную строку и считывает её обратно.

При успешной проверке в выводе появляется:

```text
LR8 connection OK
```

Результат сохраняется в `evidence/smoke-test.txt`.
