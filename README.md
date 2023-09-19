## Tweets test backend

### Команди:

- `npm start` &mdash; старт сервера в режимі production
- `npm run start:dev` &mdash; старт сервера в режимі розробки (development)
- `npm run lint` &mdash; запустити виконання перевірки коду з eslint, необхідно
  виконувати перед кожним PR та виправляти всі помилки лінтера
- `npm lint:fix` &mdash; та ж перевірка лінтера, але з автоматичними
  виправленнями простих помилок
- `docker build . -t musicman123/music_man_docker_repo:simple-app-back --build-arg PORT=4000 --build-arg DB_HOST=db_host`
- `docker build . -t musicman123/music_man_docker_repo:simple-app-back --build-arg PORT=4000 --build-arg DB_HOST=db_host`
