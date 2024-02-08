# Matrikkel proxy

Dette repoet inneholder en custom versjon av [httpd](https://hub.docker.com/_/httpd) som brukes til internruting mellom matrikkelens ulike applikasjoner på SKIP.

Den custom versjonen har følgende egenskaper:

* Legger til en egen bruker `apprunner` med UID 150 som gjør at man kan kjøre imaget uten å være root og som er i henhold til SKIP sine krav.
* Inkluderer en custom [httpd.conf](./httpd.conf)
* Inkluderer en (optional) config-fil fra `/tmp/apache/httpd.conf`. Denne konkrete filen blir mountet inn fra et config map via [heimdall-apps](https://github.com/kartverket/heimdall-apps) når matrikkel-proxy blir deployet til SKIP.

## Bygging og kjøring lokalt

For å teste matrikkel-proxy lokalt er det enkleste å bygge med docker compose.

```shell
docker compose build
```

For å kjøre opp keycloak lokalt kan man benytte:

```shell
docker compose up
```

Matrikkel-proxy er da tilgjengelig på [http://localhost:8084](http://localhost:8084). Siden det ikke er definert noen gyldige retur-response, eller ProxyPass regler som standard,
vil forventet default respons være `HTTP 403 Forbidden`. 

Readiness-endepunktet (som brukes av SKIP/Kubernetes) er tilgjengelig på en egen port på [http://localhost:8085/readiness](http://localhost:8085/readiness). 
Forventet svar fra dette endepunktet er:

```
HTTP 200 OK

{"status": "up"}
```

## Release

Det bygges automatisk en ny release ved push til `main`. Under bygging skjer følgende:

1. Ny versjon beregnes automatisk basert på forrige tag og de nyeste commit-meldingene.
   Det benyttes en action [mathieudutour/github-tag-action](https://github.com/mathieudutour/github-tag-action) for dette. Se dens dokumentasjon for hvordan man kan overstyre/tilpasse versjonsnummer.
2. Commit-en som blir bygget blir tag-et med med versjonnummeret fra 1. og et docker image med samme tag blir blir pushet.
3. Docker image blir deployet til dev (via ArgoCD) og dette bygget kan videre promoteres til test og produksjon ved hjelp gjenbrukbare actions i [heimdall-apps](https://github.com/kartverket/heimdall-apps).

