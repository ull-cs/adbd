1. Obtener información sobre el repositorio de React. Incluya su nombre, descripción, fecha de creación y número de estrellas.
```
query {
    repository(owner: "facebook", name: "react") {
        name
        description
        createdAt
        stargazers {
            totalCount
        }
    }
}
```
2. Obtener los lenguajes del repositorio de Go. Revisa la sección "Languages" que aparece en la parte inferior derecha del repositorio.
```
query {
    repository(owner: "golang", name: "go") {
        languages(first: 10) {
            edges {
                node {
                    name
                }
            }
        }
    }
}
```
3. Obtener el nombre de usuario y la URL de la página web de los 5 primeros seguidores de Evan You, cuyo nombre de usuario en GitHub es yyx990803.
```
query {
    user(login: "yyx990803") {
        followers(first: 5) {
            nodes {
                name
                websiteUrl
            }
        }
    }
}
```
4. Obtener la lista de repositorios públicos de un David Cramer, cuyo nombre de usuario es dcramer, incluyendo el nombre, la descripción y el número de estrellas.
```
query {
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
}
```
5. Obtener la lista de issues abiertos y cerrados en el repositorio de Vue.js en el último mes, incluyendo el título, la fecha de creación y el número de comentarios.
```
query {
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
}
```
6. Obtener información sobre Mastodon. La información solicitada incluye el nombre y descripción del repositorio, la información del propietario (nombre de usuario), el número total de estrellas del repositorio, los lenguajes utilizados (hasta un máximo de 10) con sus nombres y colores, los issues abiertos (hasta un máximo de 10) con títulos, URLs, cuerpos, fechas de creación y autores, y etiquetas (hasta un máximo de 10 por problema) con sus nombres y colores. Además, se solicita información sobre las últimas 10 releases del repositorio con sus nombres, fechas de creación y autores.
```
query {
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
}
```