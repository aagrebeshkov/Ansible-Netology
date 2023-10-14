- [Установка ClickHouse](#Установка-ClickHouse)
- [Установка Vector](#Установка-Vector)
- [Установка LightHouse](#Установка-LightHouse)
- [Tags](#Tags)
- [Роли](#Роли)

## Ansible-Playbook для установки ClickHouse, LiteHouse и Vector
В данном playbook описано установка ПО ClickHouse, LiteHouse и Vector

## Установка ClickHouse
Установка ClickHouse выполняется из RPM пакета. Загрузка RPM пакета осуществляется с сайта https://packages.clickhouse.com.
Версия пакета параметрезирована и объявлена в переменной clickhouse_version.
RPM пакет включает в себя пакеты для:
- clickhouse-common-static
- clickhouse-client
- clickhouse-server

После установки RPM пакетов происходит запуск handler "Start clickhouse service", который в свою очередь производит запуск сервиса.

Реализован блок "Block for checking service clickhouse status", который проверяет статус сервиса и при необходимости запускает его.
Реализован механизм ожидания доступного порта 9000 на стороне ClickHouse, т.к. на слабом сервере сервис может не успеть запуститься и задача по созданию БД упадет.

Создана задача по созданию БД logs. Задача "Create database" будет выполнена успешно, если код возврата команды по созданию БД будет 0 и упадет, если код возврата будет не равен 0 или 82. 82 код возврата означает, что такая БД уже создана.

## Установка Vector
Установка Vector выполняется из tar архива. Загрузка дистрибутива осуществляется с сайта https://packages.timber.io/vector.
Версия и архитектура системы для, которой предназначен дистрибутив параметрезированы и объявлены в переменных vector_version и arch.

После загрузки дистрибутива происходит извлечение файлов из архива и последующее удаление tar архива.
Реализована генерация конфигурационного файла vector.yaml из шаблона vector.jinja2, который расположен в директории source_folder.

## Установка LightHouse
LightHouse состоит из http сервера Nginx и статических файлов из git репозитория https://github.com/VKCOM/lighthouse.git. Установка Nginx выполняется из RPM пакета.
Директория для статических файлов и конфига LightHouse параметрезированы и объявлены в переменных deploy_lighthouse_static и deploy_lighthouse_conf_folder.

Реализована генерация конфигурационного файла nginx.conf из шаблона nginx.jinja2.

## Tags
Для каждой роли обозначены теги с названиями: clickhouse, vector, lighthouse

## Роли
Роли загружены в Git репозиторий. Ссылки на Git репозиторий прописаны в файле requirements.yml
Для загрузки ролей из файла необходимо использовать команду:

```bash
ansible-galaxy install -r requirements.yml -p roles
```
