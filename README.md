# Portfolio

Kişisel portfolyo sitesi — Vite ile statik build, Docker ile production deploy.

## Geliştirme

```bash
yarn install
yarn dev
```

## Production

```bash
yarn build
yarn docker:prod:deploy
```

Caddy `127.0.0.1:8080` üzerinden proxy yapıyorsa port değişikliği gerekmez. İsim değişikliğinden sonra (`roulista` → `portfolio`) port çakışması olursa:

```bash
docker rm -f roulista portfolio
yarn docker:prod:up
```
