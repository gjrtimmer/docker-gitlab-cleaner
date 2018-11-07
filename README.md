[![build status](https://gitlab.timmertech.nl/docker/gitlab-cleaner/badges/master/build.svg)](https://gitlab.timmertech.nl/docker/gitlab-cleaner/commits/master)
[![](https://images.microbadger.com/badges/image/datacore/gitlab-cleaner.svg)](https://microbadger.com/images/datacore/gitlab-cleaner)
[![](https://images.microbadger.com/badges/license/datacore/gitlab-cleaner.svg)](https://microbadger.com/images/datacore/gitlab-cleaner)

# gitlab-cleaner

Dockerized Gitlab Cleaner

This image will cleanup the docker containers left behind by the `gitlab-runner`.

- [Docker Registries](#docker-registries)
- [Source Repositories](#source-repositories)
- [Installation](#installation)
- [Configuraiton](#configuration)

# Docker Registries

- `datacore/redis:latest`
- `registry.timmertech.nl/docker/redis:latest`

# Source Repositories

- [github.com](https://github.com/GJRTimmer/docker-gitlab-cleaner)
- [gitlab.timmertech.nl](https://gitlab.timmertech.nl/docker/gitlab-cleaner)

# Installation

<details>
<summary>Install from DockerHub</summary>
<p>

Download:

```bash
docker pull datacore/redis:latest
```

Build:

```bash
docker build -t datacore/gitlab-cleaner https://github.com/GJRTimmer/docker-gitlab-cleaner
```

</p>
</details>

<br/>

<details>
<summary>Install from TimmerTech</summary>
<p>

Download:

```bash
docker pull registry.timmertech.nl/docker/gitlab-cleaner:latest
```

Build:

```bash
docker build -t datacore/gitlab-cleaner https://gitlab.timmertech.nl/docker/gitlab-cleaner
```

</p>
</details>

# Configuration

| Environment Key | Value          | Description                                                |
| --------------- | -------------- | ---------------------------------------------------------- |
| CRON            | `*/15 * * * *` | Crontab when to run the cleaner. default: every 15 minutes |
