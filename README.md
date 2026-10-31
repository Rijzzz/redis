# Redis

A Redis clone written in C++.

> I followed the book [Build Your Own Redis with C/C++](https://build-your-own.org/redis/) by James Smith to create this project while learning C++. Thanks to his book, I was able to build a working Redis server from scratch.
>
> I highly recommend [reading this book](https://build-your-own.org/redis/) if you are getting started with C/C++ or want to understand how Redis actually works. It provides practical, hands on experience with data structures, socket network programming, and low level systems code.

## Supported Commands

### Strings

* `set <key> <val>`
* `get <key>`
* `del <key>`
* `keys`

### Key Expiration (TTL)

* `pexpire <key> <ttl_ms>`
* `pttl <key>`

### Sorted Sets (ZSET)

* `zadd <zset> <score> <name>`
* `zscore <zset> <name>`
* `zrem <zset> <name>`
* `zquery <zset> <score> <name> <offset> <limit>`

## Building and Running

### Prerequisites

* **Compiler:** GCC with C++17 support
* **Build tool:** GNU Make
* **Windows platform:** MSYS2 environment with `gcc` and `make` packages

### Build

Compile the server and client binaries:

```bash
make
```

### Start the Server

Run the server executable:

```bash
./server.exe
```

The server listens for incoming connections on port **1234**.

### Run Client Commands

Open another terminal to send requests to the server:

```bash
./client.exe set greeting "hello world"
./client.exe get greeting
./client.exe pexpire greeting 60000
./client.exe pttl greeting
./client.exe zadd leaderboard 100 alice
./client.exe zscore leaderboard alice
./client.exe zquery leaderboard 0 "" 0 10
```

### Clean Build Files

Remove the compiled objects and binaries:

```bash
make clean
```
