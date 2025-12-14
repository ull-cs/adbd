1. Obtener información sobre el repositorio de React. Incluya su nombre, descripción, fecha de creación y número de estrellas.
    ```shell
    gh api graphql -f query='query {
        repository(owner: "facebook", name: "react") {
            name
            description
            createdAt
            stargazers {
                totalCount
            }
        }
    }'
    ```
    La respuesta sería tal como sigue:
    ```json
    {
    "data": {
        "repository": {
        "name": "react",
        "description": "The library for web and native user interfaces.",
        "createdAt": "2013-05-24T16:15:54Z",
        "stargazers": {
            "totalCount": 241477
        }
        }
    }
    }
    ```

2. Obtener los lenguajes del repositorio de Go. Revisa la sección "Languages" que aparece en la parte inferior derecha del repositorio.
    ```shell
    gh api graphql -f query='query {
        repository(owner: "golang", name: "go") {
            languages(first: 10) {
                edges {
                    node {
                        name
                    }
                }
            }
        }
    }'
    ```
    La respuesta sería tal como sigue:
    ```json
    {
        "data": {
            "repository": {
            "languages": {
                "edges": [
                {
                    "node": {
                    "name": "Shell"
                    }
                },
        ...
    }
    ```

3. Obtener el nombre de usuario y la URL de la página web de los 5 primeros seguidores de Evan You, cuyo nombre de usuario en GitHub es yyx990803.
    ```shell
    gh api graphql -f query='query {
        user(login: "yyx990803") {
            followers(first: 5) {
                nodes {
                    name
                    websiteUrl
                }
            }
        }
    }'
    ```
    La respuesta sería tal que así:
    ```json
    {
        "data": {
            "user": {
                "followers": {
                    "nodes": [
                        {
                            "name": null,
                            "websiteUrl": null
                        },
                        {
                            "name": "BlandCool",
                            "websiteUrl": null
                        },
                        {
                            "name": "zhichao",
                            "websiteUrl": null
                        },
                        {
                            "name": null,
                            "websiteUrl": null
                        },
                        {
                            "name": null,
                            "websiteUrl": null
                        }
                    ]
                }
            }
        }
    }
    ```

4. Obtener la lista de repositorios públicos de un David Cramer, cuyo nombre de usuario es dcramer, incluyendo el nombre, la descripción y el número de estrellas.
    ```shell
    gh api graphql -f query='query {
        user(login: "dcramer") {
            repositories(privacy: PUBLIC, first: 10) {
                nodes {
                    name
                    description
                    stargazers {
                        totalCount
                    }
                }
            }
        }
    }'
    ```
    La respuesta sería tal como sigue:
    ```json
    {
        "data": {
            "user": {
                "repositories": {
                    "nodes": [
                        {
                            "name": "django-debug-toolbar",
                            "description": "A debug/profiling overlay for Django",
                            "stargazers": {
                            "totalCount": 226
                            }
                        },
                        {
                            "name": "django-compositepks",
                            "description": "Composite Primary Keys fork",
                            "stargazers": {
                            "totalCount": 37
                            }
                        },
                        {
                            "name": "django-idmapper",
                            "description": "An identify mapper for the Django ORM",
                            "stargazers": {
                            "totalCount": 71
                            }
                        },
                        {
                            "name": "jinja1-djangosupport",
                            "description": "Jinja 1 with updated Django Support",
                            "stargazers": {
                            "totalCount": 4
                            }
                        },
                        {
                            "name": "pastethat",
                            "description": "A Django Pastebin (Pastethat.com)",
                            "stargazers": {
                            "totalCount": 14
                            }
                        },
                        {
                            "name": "chishop",
                            "description": "Please use https://github.com/benliles/chishop",
                            "stargazers": {
                            "totalCount": 175
                            }
                        },
                        {
                            "name": "django-ratings",
                            "description": "Pluggable rating fields in Django.",
                            "stargazers": {
                            "totalCount": 406
                            }
                        },
                        {
                            "name": "django-sphinx",
                            "description": "A transparent layer for full-text search using Sphinx and Django",
                            "stargazers": {
                            "totalCount": 359
                            }
                        },
                        {
                            "name": "py-wikimarkup",
                            "description": "A MediaWiki-to-HTML parser for Python.",
                            "stargazers": {
                            "totalCount": 54
                            }
                        },
                        {
                            "name": "feedreader",
                            "description": "An RSS/Atom feed parsing layer for lxml.objectify in Python",
                            "stargazers": {
                            "totalCount": 52
                            }
                        }
                    ]
                }
            }
        }
    }
    ```

5. Obtener la lista de issues abiertos y cerrados en el repositorio de Vue.js en el último mes, incluyendo el título, la fecha de creación y el número de comentarios.
    ```shell
    gh api graphql -f query='query {
        repository(owner: "vuejs", name: "vue") {
            issues(last: 30, states: [OPEN, CLOSED]) {
                edges {
                    node {
                        title
                        createdAt
                        comments {
                            totalCount
                        }
                    }
                }
            }
        }
    }'
    ```
    La respuesta sería tal como sigue:
    ```json
    {
    "data": {
        "repository": {
        "issues": {
            "edges": [
            {
                "node": {
                "title": "[Docs] $emit('input', value) cancels event.preventDefault()",
                "createdAt": "2023-10-25T12:38:59Z",
                "comments": {
                    "totalCount": 1
                }
                }
            },
            {
                "node": {
                "title": "named slot + forceUpdate dont work",
                "createdAt": "2023-11-02T07:19:04Z",
                "comments": {
                    "totalCount": 2
                }
                }
            },
        ...
    }
    ```

6. Obtener información sobre Mastodon. La información solicitada incluye el nombre y descripción del repositorio, la información del propietario (nombre de usuario), el número total de estrellas del repositorio, los lenguajes utilizados (hasta un máximo de 10) con sus nombres y colores, los issues abiertos (hasta un máximo de 10) con títulos, URLs, cuerpos, fechas de creación y autores, y etiquetas (hasta un máximo de 10 por problema) con sus nombres y colores. Además, se solicita información sobre las últimas 10 releases del repositorio con sus nombres, fechas de creación y autores.
    ```shell
    gh api graphql -f query='query {
        repository(owner: "mastodon", name: "mastodon") {
            name
            description
            owner {
                login
            }
            stargazers {
                totalCount
            }
            languages(first: 10) {
                nodes {
                    name
                    color
                }
            }
            issues(first: 10, states: OPEN) {
                totalCount
                edges {
                    node {
                        title
                        url
                        body
                        createdAt
                        author {
                            login
                        }
                        labels(first: 10) {
                            edges {
                                node {
                                    name
                                    color
                                }
                            }
                        }
                    }
                }
            }
            releases(first: 10) {
                totalCount
                edges {
                    node {
                        tagName
                        name
                        createdAt
                        author {
                            login
                        }
                    }
                }
            }
        }
    }'
    ```
    La respuesta sería tal como sigue:
    ```json
    {
        "data": {
            "repository": {
                "name": "mastodon",
                "description": "Your self-hosted, globally interconnected microblogging community",
                "owner": {
                    "login": "mastodon"
                },
                "stargazers": {
                    "totalCount": 49348
                },
                "languages": {
                    "nodes": [
                        {
                            "name": "Ruby",
                            "color": "#701516"
                        },
        ...
    }
    ```