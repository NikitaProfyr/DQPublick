# Приветствую вас в проекте DragonQuestion!

## Для начала работы проекта, после того, как вы скопировали его из удаленного репозитория проделайте следующие шаги:
- В директории back-end/ создайте файл .env и скопируйте туда данные из файла .env.templates 
- Установите [Docker](https://www.docker.com/products/docker-desktop/), если он у вас отсутствует
- Откройте терминал и перейдите в директорию с проектом. 
- Введите команду: docker compose up --build dq-client
- Перейдите по ссылке: http://localhost:3000/ 

Проект еще находится в разработке, некоторые функции могут быть не доступны.
docker exec -it fullstack-db-1 /bin/bash
psql -d postgres -U dies_admin < /docker-entrypoint-initdb.d/dumpUTF8.sql