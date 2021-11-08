# perl-ectoken
> _Perl implementation of EdgeCast token (`ectoken`)_


## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)


## Background

Perl implementation of the "EdgeCast Token" (`ectoken`) -see main repo [ectoken](https://github.com/EdgeCast/ectoken) for more details.

## Install

### With `deps.sh`

```sh
./deps.sh
```

## Usage

### Help
```sh
>./ectoken.pl -h
Usage ./ectoken.pl <key> <token>
```

### Encrypt

Encrypt clear text token `<token>` with key: `<key>`:
```sh
>./ectoken.pl MY_SECRET_KEY MY_COOL_TOKEN
AUtdBlzc0C5m1b1OHycteRz9QyTEEcRRQ0meWwS_KZqFC8OeqmZ7X2s
```

## Contribute

- We welcome issues, questions and pull requests.


## License

This project is licensed under the terms of the Apache 2.0 open source license. Please refer to the `LICENSE-2.0.txt` file for the full terms.
