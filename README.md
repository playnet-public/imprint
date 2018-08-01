# imprint

PlayNet Imprint Container

## About

This small repository contains our up to date imprint information in all languages.
It is being deployed to our cluster and should be served under `https://imprint.play-net.org/<language-code>`.

Current Examples:
[German - https://imprint.play-net.org/de](https://imprint.play-net.org/de)
[English - https://imprint.play-net.org/en](https://imprint.play-net.org/en)

## Building

To build an up-to-date version of our imprint container, call:

```bash
make build
```

To upload it, call:

```bash
make upload
```

To restart and update the currently running containers, call:

```bash
make restart
```
