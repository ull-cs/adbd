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
Consulta 2:

Obtener el nombre y el URL de la página web de los 10 primeros colaboradores de un repositorio:

query {
repository(owner: "github", name: "graphql-js") {
collaborators(first: 10) {
nodes {
name
websiteUrl
}
}
}
}

Consulta 3:

Obtener la lista de issues abiertos y cerrados de un repositorio en el último mes, incluyendo el título, la fecha de creación y el número de comentarios:

query {
repository(owner: "github", name: "graphql-js") {
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

Consulta 4:

Obtener el nombre de usuario y la URL de la página web de los 5 primeros seguidores de un usuario:

query {
user(login: "github") {
followers(first: 5) {
nodes {
name
websiteUrl
}
}
}
}

Consulta 5:

Obtener la lista de repositorios públicos de un usuario, incluyendo el nombre, la descripción y el número de estrellas:

query {
user(login: "github") {
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