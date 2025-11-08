#  Deploying a Python microservice on Kubernetes

## 1. Dockerize the Application: Create a Dockerfile to containerize the Python application.

### Test the python app locally
- Clone the Repository: https://github.com/sameh-Tawfiq/Microservices
- python3 --version
``` Python 3.12.3 ```
- python3 -m venv venv
- source venv/bin/activate
- pip install -r requirements.txt
- pip install "Werkzeug==2.2.3"
- python3 run.py
- Test endpoints http://127.0.0.1:5000/users and http://127.0.0.1:5000/products

### Create a Dockerfile, build the docker image and run a container to test
- docker build --squash --progress=plain --no-cache  -t python-app:1.0 -f Dockerfile .

<div style="height:200px; overflow-y:auto; border:1px solid #ccc; padding:10px;">

WARNING: experimental flag squash is removed with BuildKit. You should squash inside build using a multi-stage Dockerfile for efficiency.
#0 building with "default" instance using docker driver

#1 [internal] load build definition from Dockerfile
#1 transferring dockerfile: 969B done
#1 DONE 0.0s

#2 [internal] load metadata for docker.io/library/python:3.12-slim
#2 DONE 2.3s

#3 [internal] load .dockerignore
#3 transferring context: 458B done
#3 DONE 0.0s

#4 [internal] load build context
#4 transferring context: 11.35kB 0.0s done
#4 DONE 0.0s

#5 [1/8] FROM docker.io/library/python:3.12-slim@sha256:d86b4c74b936c438cd4cc3a9f7256b9a7c27ad68c7caf8c205e18d9845af0164
#5 resolve docker.io/library/python:3.12-slim@sha256:d86b4c74b936c438cd4cc3a9f7256b9a7c27ad68c7caf8c205e18d9845af0164 0.0s done
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 0B / 12.11MB 0.1s
#5 sha256:d86b4c74b936c438cd4cc3a9f7256b9a7c27ad68c7caf8c205e18d9845af0164 10.37kB / 10.37kB done
#5 sha256:973d116e5354f00385c8c18d937d52c24c6b020faf46a095ed2c8679ed3f39be 1.75kB / 1.75kB done
#5 sha256:3a1ccc3590a6e3ba4d6058ebf7fa702dcedd706107543210f975412e9a02f763 5.68kB / 5.68kB done
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 0B / 29.78MB 0.1s
#5 sha256:1d96a644cf6c54ac43db46567eadbb2c200b0ef5416557440ba2106954f491ce 0B / 1.29MB 0.1s
#5 sha256:1d96a644cf6c54ac43db46567eadbb2c200b0ef5416557440ba2106954f491ce 1.29MB / 1.29MB 2.6s done
#5 sha256:31ac69cb4246e72a40eb76f4573038f94f6b6c97427a863162ecd8f3fe89e475 0B / 248B 2.7s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 1.05MB / 12.11MB 2.9s
#5 sha256:31ac69cb4246e72a40eb76f4573038f94f6b6c97427a863162ecd8f3fe89e475 248B / 248B 3.0s done
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 2.10MB / 12.11MB 3.8s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 2.10MB / 29.78MB 4.0s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 3.15MB / 12.11MB 5.0s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 4.19MB / 12.11MB 5.2s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 5.24MB / 12.11MB 6.5s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 6.29MB / 12.11MB 7.0s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 7.34MB / 12.11MB 7.9s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 8.39MB / 12.11MB 8.1s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 9.44MB / 12.11MB 9.1s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 3.15MB / 29.78MB 9.1s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 10.49MB / 12.11MB 10.0s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 11.53MB / 12.11MB 10.4s
#5 sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 12.11MB / 12.11MB 11.3s done
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 5.24MB / 29.78MB 12.1s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 7.34MB / 29.78MB 13.6s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 9.44MB / 29.78MB 14.7s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 11.53MB / 29.78MB 16.1s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 13.63MB / 29.78MB 17.9s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 15.73MB / 29.78MB 19.7s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 17.83MB / 29.78MB 21.3s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 19.92MB / 29.78MB 23.5s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 22.02MB / 29.78MB 24.9s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 24.12MB / 29.78MB 26.1s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 26.21MB / 29.78MB 28.2s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 28.31MB / 29.78MB 29.5s
#5 sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 29.78MB / 29.78MB 29.7s done
#5 extracting sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc
#5 extracting sha256:d7ecded7702a5dbf6d0f79a71edc34b534d08f3051980e2c948fba72db3197fc 2.9s done
#5 extracting sha256:1d96a644cf6c54ac43db46567eadbb2c200b0ef5416557440ba2106954f491ce
#5 extracting sha256:1d96a644cf6c54ac43db46567eadbb2c200b0ef5416557440ba2106954f491ce 0.2s done
#5 extracting sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 0.1s
#5 extracting sha256:a4f564a4a58f8e9cd4ff1e0098405cb016a02b142eee4745a9a73f92076deff6 1.4s done
#5 extracting sha256:31ac69cb4246e72a40eb76f4573038f94f6b6c97427a863162ecd8f3fe89e475 done
#5 DONE 34.5s

#6 [2/8] WORKDIR /app
#6 DONE 0.5s

#7 [3/8] RUN apt-get update && apt-get install -y     gcc     && rm -rf /var/lib/apt/lists/*
#7 0.568 Hit:1 http://deb.debian.org/debian trixie InRelease
#7 0.653 Get:2 http://deb.debian.org/debian trixie-updates InRelease [47.3 kB]
#7 0.802 Get:3 http://deb.debian.org/debian-security trixie-security InRelease [43.4 kB]
#7 0.920 Get:4 http://deb.debian.org/debian trixie/main amd64 Packages [9669 kB]
#7 21.16 Get:5 http://deb.debian.org/debian trixie-updates/main amd64 Packages [5412 B]
#7 21.26 Get:6 http://deb.debian.org/debian-security trixie-security/main amd64 Packages [69.3 kB]
#7 22.48 Fetched 9834 kB in 22s (444 kB/s)
#7 22.48 Reading package lists...
#7 23.58 Reading package lists...
#7 24.63 Building dependency tree...
#7 24.84 Reading state information...
#7 25.20 The following additional packages will be installed:
#7 25.20   binutils binutils-common binutils-x86-64-linux-gnu cpp cpp-14
#7 25.20   cpp-14-x86-64-linux-gnu cpp-x86-64-linux-gnu gcc-14 gcc-14-x86-64-linux-gnu
#7 25.20   gcc-x86-64-linux-gnu libasan8 libatomic1 libbinutils libc-dev-bin libc6-dev
#7 25.20   libcc1-0 libcrypt-dev libctf-nobfd0 libctf0 libgcc-14-dev libgomp1
#7 25.20   libgprofng0 libhwasan0 libisl23 libitm1 libjansson4 liblsan0 libmpc3
#7 25.20   libmpfr6 libquadmath0 libsframe1 libtsan2 libubsan1 linux-libc-dev manpages
#7 25.20   manpages-dev rpcsvc-proto
#7 25.20 Suggested packages:
#7 25.20   binutils-doc gprofng-gui binutils-gold cpp-doc gcc-14-locales cpp-14-doc
#7 25.20   gcc-multilib make autoconf automake libtool flex bison gdb gcc-doc
#7 25.20   gcc-14-multilib gcc-14-doc gdb-x86-64-linux-gnu libc-devtools glibc-doc
#7 25.20   man-browser
#7 25.43 The following NEW packages will be installed:
#7 25.43   binutils binutils-common binutils-x86-64-linux-gnu cpp cpp-14
#7 25.43   cpp-14-x86-64-linux-gnu cpp-x86-64-linux-gnu gcc gcc-14
#7 25.43   gcc-14-x86-64-linux-gnu gcc-x86-64-linux-gnu libasan8 libatomic1 libbinutils
#7 25.43   libc-dev-bin libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0 libctf0
#7 25.43   libgcc-14-dev libgomp1 libgprofng0 libhwasan0 libisl23 libitm1 libjansson4
#7 25.43   liblsan0 libmpc3 libmpfr6 libquadmath0 libsframe1 libtsan2 libubsan1
#7 25.43   linux-libc-dev manpages manpages-dev rpcsvc-proto
#7 25.71 0 upgraded, 38 newly installed, 0 to remove and 0 not upgraded.
#7 25.71 Need to get 60.3 MB of archives.
#7 25.71 After this operation, 222 MB of additional disk space will be used.
#7 25.71 Get:1 http://deb.debian.org/debian trixie/main amd64 manpages all 6.9.1-1 [1393 kB]
#7 29.41 Get:2 http://deb.debian.org/debian trixie/main amd64 libsframe1 amd64 2.44-3 [78.4 kB]
#7 29.49 Get:3 http://deb.debian.org/debian trixie/main amd64 binutils-common amd64 2.44-3 [2509 kB]
#7 35.65 Get:4 http://deb.debian.org/debian trixie/main amd64 libbinutils amd64 2.44-3 [534 kB]
#7 37.20 Get:5 http://deb.debian.org/debian trixie/main amd64 libgprofng0 amd64 2.44-3 [808 kB]
#7 38.60 Get:6 http://deb.debian.org/debian trixie/main amd64 libctf-nobfd0 amd64 2.44-3 [156 kB]
#7 39.03 Get:7 http://deb.debian.org/debian trixie/main amd64 libctf0 amd64 2.44-3 [88.6 kB]
#7 39.14 Get:8 http://deb.debian.org/debian trixie/main amd64 libjansson4 amd64 2.14-2+b3 [39.8 kB]
#7 39.19 Get:9 http://deb.debian.org/debian trixie/main amd64 binutils-x86-64-linux-gnu amd64 2.44-3 [1014 kB]
#7 41.55 Get:10 http://deb.debian.org/debian trixie/main amd64 binutils amd64 2.44-3 [265 kB]
#7 41.98 Get:11 http://deb.debian.org/debian trixie/main amd64 libisl23 amd64 0.27-1 [659 kB]
#7 43.45 Get:12 http://deb.debian.org/debian trixie/main amd64 libmpfr6 amd64 4.2.2-1 [729 kB]
#7 44.99 Get:13 http://deb.debian.org/debian trixie/main amd64 libmpc3 amd64 1.3.1-1+b3 [52.2 kB]
#7 45.05 Get:14 http://deb.debian.org/debian trixie/main amd64 cpp-14-x86-64-linux-gnu amd64 14.2.0-19 [11.0 MB]
#7 69.12 Get:15 http://deb.debian.org/debian trixie/main amd64 cpp-14 amd64 14.2.0-19 [1280 B]
#7 69.12 Get:16 http://deb.debian.org/debian trixie/main amd64 cpp-x86-64-linux-gnu amd64 4:14.2.0-1 [4840 B]
#7 69.13 Get:17 http://deb.debian.org/debian trixie/main amd64 cpp amd64 4:14.2.0-1 [1568 B]
#7 69.13 Get:18 http://deb.debian.org/debian trixie/main amd64 libcc1-0 amd64 14.2.0-19 [42.8 kB]
#7 69.19 Get:19 http://deb.debian.org/debian trixie/main amd64 libgomp1 amd64 14.2.0-19 [137 kB]
#7 69.68 Get:20 http://deb.debian.org/debian trixie/main amd64 libitm1 amd64 14.2.0-19 [26.0 kB]
#7 69.79 Get:21 http://deb.debian.org/debian trixie/main amd64 libatomic1 amd64 14.2.0-19 [9308 B]
#7 69.83 Get:22 http://deb.debian.org/debian trixie/main amd64 libasan8 amd64 14.2.0-19 [2725 kB]
#7 75.47 Get:23 http://deb.debian.org/debian trixie/main amd64 liblsan0 amd64 14.2.0-19 [1204 kB]
#7 78.33 Get:24 http://deb.debian.org/debian trixie/main amd64 libtsan2 amd64 14.2.0-19 [2460 kB]
#7 83.58 Get:25 http://deb.debian.org/debian trixie/main amd64 libubsan1 amd64 14.2.0-19 [1074 kB]
#7 85.75 Get:26 http://deb.debian.org/debian trixie/main amd64 libhwasan0 amd64 14.2.0-19 [1488 kB]
#7 88.89 Get:27 http://deb.debian.org/debian trixie/main amd64 libquadmath0 amd64 14.2.0-19 [145 kB]
#7 89.19 Get:28 http://deb.debian.org/debian trixie/main amd64 libgcc-14-dev amd64 14.2.0-19 [2672 kB]
#7 95.59 Get:29 http://deb.debian.org/debian trixie/main amd64 gcc-14-x86-64-linux-gnu amd64 14.2.0-19 [21.4 MB]
#7 141.5 Get:30 http://deb.debian.org/debian trixie/main amd64 gcc-14 amd64 14.2.0-19 [540 kB]
#7 142.6 Get:31 http://deb.debian.org/debian trixie/main amd64 gcc-x86-64-linux-gnu amd64 4:14.2.0-1 [1436 B]
#7 142.6 Get:32 http://deb.debian.org/debian trixie/main amd64 gcc amd64 4:14.2.0-1 [5136 B]
#7 142.6 Get:33 http://deb.debian.org/debian trixie/main amd64 libc-dev-bin amd64 2.41-12 [58.2 kB]
#7 142.7 Get:34 http://deb.debian.org/debian-security trixie-security/main amd64 linux-libc-dev all 6.12.48-1 [2671 kB]
#7 148.2 Get:35 http://deb.debian.org/debian trixie/main amd64 libcrypt-dev amd64 1:4.4.38-1 [119 kB]
#7 148.3 Get:36 http://deb.debian.org/debian trixie/main amd64 rpcsvc-proto amd64 1.4.3-1 [63.3 kB]
#7 148.4 Get:37 http://deb.debian.org/debian trixie/main amd64 libc6-dev amd64 2.41-12 [1991 kB]
#7 153.2 Get:38 http://deb.debian.org/debian trixie/main amd64 manpages-dev all 6.9.1-1 [2122 kB]
#7 158.3 debconf: unable to initialize frontend: Dialog
#7 158.3 debconf: (TERM is not set, so the dialog frontend is not usable.)
#7 158.3 debconf: falling back to frontend: Readline
#7 158.3 debconf: unable to initialize frontend: Readline
#7 158.3 debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC entries checked: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.40.1 /usr/local/share/perl/5.40.1 /usr/lib/x86_64-linux-gnu/perl5/5.40 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.40 /usr/share/perl/5.40 /usr/local/lib/site_perl) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 8, <STDIN> line 38.)
#7 158.3 debconf: falling back to frontend: Teletype
#7 158.3 debconf: unable to initialize frontend: Teletype
#7 158.3 debconf: (This frontend requires a controlling tty.)
#7 158.3 debconf: falling back to frontend: Noninteractive
#7 160.5 Fetched 60.3 MB in 2min 13s (455 kB/s)
#7 160.6 Selecting previously unselected package manpages.
(Reading database ... 5644 files and directories currently installed.)
#7 160.6 Preparing to unpack .../00-manpages_6.9.1-1_all.deb ...
#7 160.6 Unpacking manpages (6.9.1-1) ...
#7 160.6 Selecting previously unselected package libsframe1:amd64.
#7 160.6 Preparing to unpack .../01-libsframe1_2.44-3_amd64.deb ...
#7 160.6 Unpacking libsframe1:amd64 (2.44-3) ...
#7 160.7 Selecting previously unselected package binutils-common:amd64.
#7 160.7 Preparing to unpack .../02-binutils-common_2.44-3_amd64.deb ...
#7 160.7 Unpacking binutils-common:amd64 (2.44-3) ...
#7 160.9 Selecting previously unselected package libbinutils:amd64.
#7 160.9 Preparing to unpack .../03-libbinutils_2.44-3_amd64.deb ...
#7 160.9 Unpacking libbinutils:amd64 (2.44-3) ...
#7 160.9 Selecting previously unselected package libgprofng0:amd64.
#7 160.9 Preparing to unpack .../04-libgprofng0_2.44-3_amd64.deb ...
#7 160.9 Unpacking libgprofng0:amd64 (2.44-3) ...
#7 161.0 Selecting previously unselected package libctf-nobfd0:amd64.
#7 161.0 Preparing to unpack .../05-libctf-nobfd0_2.44-3_amd64.deb ...
#7 161.0 Unpacking libctf-nobfd0:amd64 (2.44-3) ...
#7 161.1 Selecting previously unselected package libctf0:amd64.
#7 161.1 Preparing to unpack .../06-libctf0_2.44-3_amd64.deb ...
#7 161.1 Unpacking libctf0:amd64 (2.44-3) ...
#7 161.1 Selecting previously unselected package libjansson4:amd64.
#7 161.1 Preparing to unpack .../07-libjansson4_2.14-2+b3_amd64.deb ...
#7 161.1 Unpacking libjansson4:amd64 (2.14-2+b3) ...
#7 161.1 Selecting previously unselected package binutils-x86-64-linux-gnu.
#7 161.1 Preparing to unpack .../08-binutils-x86-64-linux-gnu_2.44-3_amd64.deb ...
#7 161.1 Unpacking binutils-x86-64-linux-gnu (2.44-3) ...
#7 161.3 Selecting previously unselected package binutils.
#7 161.3 Preparing to unpack .../09-binutils_2.44-3_amd64.deb ...
#7 161.3 Unpacking binutils (2.44-3) ...
#7 161.3 Selecting previously unselected package libisl23:amd64.
#7 161.3 Preparing to unpack .../10-libisl23_0.27-1_amd64.deb ...
#7 161.3 Unpacking libisl23:amd64 (0.27-1) ...
#7 161.4 Selecting previously unselected package libmpfr6:amd64.
#7 161.4 Preparing to unpack .../11-libmpfr6_4.2.2-1_amd64.deb ...
#7 161.4 Unpacking libmpfr6:amd64 (4.2.2-1) ...
#7 161.4 Selecting previously unselected package libmpc3:amd64.
#7 161.4 Preparing to unpack .../12-libmpc3_1.3.1-1+b3_amd64.deb ...
#7 161.4 Unpacking libmpc3:amd64 (1.3.1-1+b3) ...
#7 161.5 Selecting previously unselected package cpp-14-x86-64-linux-gnu.
#7 161.5 Preparing to unpack .../13-cpp-14-x86-64-linux-gnu_14.2.0-19_amd64.deb ...
#7 161.5 Unpacking cpp-14-x86-64-linux-gnu (14.2.0-19) ...
#7 162.1 Selecting previously unselected package cpp-14.
#7 162.1 Preparing to unpack .../14-cpp-14_14.2.0-19_amd64.deb ...
#7 162.1 Unpacking cpp-14 (14.2.0-19) ...
#7 162.1 Selecting previously unselected package cpp-x86-64-linux-gnu.
#7 162.1 Preparing to unpack .../15-cpp-x86-64-linux-gnu_4%3a14.2.0-1_amd64.deb ...
#7 162.1 Unpacking cpp-x86-64-linux-gnu (4:14.2.0-1) ...
#7 162.1 Selecting previously unselected package cpp.
#7 162.1 Preparing to unpack .../16-cpp_4%3a14.2.0-1_amd64.deb ...
#7 162.2 Unpacking cpp (4:14.2.0-1) ...
#7 162.2 Selecting previously unselected package libcc1-0:amd64.
#7 162.2 Preparing to unpack .../17-libcc1-0_14.2.0-19_amd64.deb ...
#7 162.2 Unpacking libcc1-0:amd64 (14.2.0-19) ...
#7 162.2 Selecting previously unselected package libgomp1:amd64.
#7 162.2 Preparing to unpack .../18-libgomp1_14.2.0-19_amd64.deb ...
#7 162.2 Unpacking libgomp1:amd64 (14.2.0-19) ...
#7 162.2 Selecting previously unselected package libitm1:amd64.
#7 162.2 Preparing to unpack .../19-libitm1_14.2.0-19_amd64.deb ...
#7 162.2 Unpacking libitm1:amd64 (14.2.0-19) ...
#7 162.3 Selecting previously unselected package libatomic1:amd64.
#7 162.3 Preparing to unpack .../20-libatomic1_14.2.0-19_amd64.deb ...
#7 162.3 Unpacking libatomic1:amd64 (14.2.0-19) ...
#7 162.3 Selecting previously unselected package libasan8:amd64.
#7 162.3 Preparing to unpack .../21-libasan8_14.2.0-19_amd64.deb ...
#7 162.3 Unpacking libasan8:amd64 (14.2.0-19) ...
#7 162.5 Selecting previously unselected package liblsan0:amd64.
#7 162.5 Preparing to unpack .../22-liblsan0_14.2.0-19_amd64.deb ...
#7 162.5 Unpacking liblsan0:amd64 (14.2.0-19) ...
#7 162.6 Selecting previously unselected package libtsan2:amd64.
#7 162.6 Preparing to unpack .../23-libtsan2_14.2.0-19_amd64.deb ...
#7 162.6 Unpacking libtsan2:amd64 (14.2.0-19) ...
#7 162.8 Selecting previously unselected package libubsan1:amd64.
#7 162.8 Preparing to unpack .../24-libubsan1_14.2.0-19_amd64.deb ...
#7 162.8 Unpacking libubsan1:amd64 (14.2.0-19) ...
#7 162.9 Selecting previously unselected package libhwasan0:amd64.
#7 162.9 Preparing to unpack .../25-libhwasan0_14.2.0-19_amd64.deb ...
#7 162.9 Unpacking libhwasan0:amd64 (14.2.0-19) ...
#7 163.1 Selecting previously unselected package libquadmath0:amd64.
#7 163.1 Preparing to unpack .../26-libquadmath0_14.2.0-19_amd64.deb ...
#7 163.1 Unpacking libquadmath0:amd64 (14.2.0-19) ...
#7 163.1 Selecting previously unselected package libgcc-14-dev:amd64.
#7 163.1 Preparing to unpack .../27-libgcc-14-dev_14.2.0-19_amd64.deb ...
#7 163.1 Unpacking libgcc-14-dev:amd64 (14.2.0-19) ...
#7 163.3 Selecting previously unselected package gcc-14-x86-64-linux-gnu.
#7 163.3 Preparing to unpack .../28-gcc-14-x86-64-linux-gnu_14.2.0-19_amd64.deb ...
#7 163.3 Unpacking gcc-14-x86-64-linux-gnu (14.2.0-19) ...
#7 164.1 Selecting previously unselected package gcc-14.
#7 164.1 Preparing to unpack .../29-gcc-14_14.2.0-19_amd64.deb ...
#7 164.1 Unpacking gcc-14 (14.2.0-19) ...
#7 164.1 Selecting previously unselected package gcc-x86-64-linux-gnu.
#7 164.1 Preparing to unpack .../30-gcc-x86-64-linux-gnu_4%3a14.2.0-1_amd64.deb ...
#7 164.1 Unpacking gcc-x86-64-linux-gnu (4:14.2.0-1) ...
#7 164.1 Selecting previously unselected package gcc.
#7 164.1 Preparing to unpack .../31-gcc_4%3a14.2.0-1_amd64.deb ...
#7 164.1 Unpacking gcc (4:14.2.0-1) ...
#7 164.2 Selecting previously unselected package libc-dev-bin.
#7 164.2 Preparing to unpack .../32-libc-dev-bin_2.41-12_amd64.deb ...
#7 164.2 Unpacking libc-dev-bin (2.41-12) ...
#7 164.2 Selecting previously unselected package linux-libc-dev.
#7 164.2 Preparing to unpack .../33-linux-libc-dev_6.12.48-1_all.deb ...
#7 164.2 Unpacking linux-libc-dev (6.12.48-1) ...
#7 164.8 Selecting previously unselected package libcrypt-dev:amd64.
#7 164.8 Preparing to unpack .../34-libcrypt-dev_1%3a4.4.38-1_amd64.deb ...
#7 164.8 Unpacking libcrypt-dev:amd64 (1:4.4.38-1) ...
#7 164.9 Selecting previously unselected package rpcsvc-proto.
#7 164.9 Preparing to unpack .../35-rpcsvc-proto_1.4.3-1_amd64.deb ...
#7 164.9 Unpacking rpcsvc-proto (1.4.3-1) ...
#7 164.9 Selecting previously unselected package libc6-dev:amd64.
#7 164.9 Preparing to unpack .../36-libc6-dev_2.41-12_amd64.deb ...
#7 164.9 Unpacking libc6-dev:amd64 (2.41-12) ...
#7 165.1 Selecting previously unselected package manpages-dev.
#7 165.1 Preparing to unpack .../37-manpages-dev_6.9.1-1_all.deb ...
#7 165.1 Unpacking manpages-dev (6.9.1-1) ...
#7 165.3 Setting up manpages (6.9.1-1) ...
#7 165.3 Setting up binutils-common:amd64 (2.44-3) ...
#7 165.3 Setting up linux-libc-dev (6.12.48-1) ...
#7 165.3 Setting up libctf-nobfd0:amd64 (2.44-3) ...
#7 165.3 Setting up libgomp1:amd64 (14.2.0-19) ...
#7 165.3 Setting up libsframe1:amd64 (2.44-3) ...
#7 165.3 Setting up libjansson4:amd64 (2.14-2+b3) ...
#7 165.3 Setting up rpcsvc-proto (1.4.3-1) ...
#7 165.3 Setting up libmpfr6:amd64 (4.2.2-1) ...
#7 165.3 Setting up libquadmath0:amd64 (14.2.0-19) ...
#7 165.3 Setting up libmpc3:amd64 (1.3.1-1+b3) ...
#7 165.3 Setting up libatomic1:amd64 (14.2.0-19) ...
#7 165.3 Setting up libubsan1:amd64 (14.2.0-19) ...
#7 165.3 Setting up libhwasan0:amd64 (14.2.0-19) ...
#7 165.3 Setting up libcrypt-dev:amd64 (1:4.4.38-1) ...
#7 165.3 Setting up libasan8:amd64 (14.2.0-19) ...
#7 165.3 Setting up libtsan2:amd64 (14.2.0-19) ...
#7 165.3 Setting up libbinutils:amd64 (2.44-3) ...
#7 165.3 Setting up libisl23:amd64 (0.27-1) ...
#7 165.4 Setting up libc-dev-bin (2.41-12) ...
#7 165.4 Setting up libcc1-0:amd64 (14.2.0-19) ...
#7 165.4 Setting up liblsan0:amd64 (14.2.0-19) ...
#7 165.4 Setting up libitm1:amd64 (14.2.0-19) ...
#7 165.4 Setting up libctf0:amd64 (2.44-3) ...
#7 165.4 Setting up manpages-dev (6.9.1-1) ...
#7 165.4 Setting up libgprofng0:amd64 (2.44-3) ...
#7 165.4 Setting up cpp-14-x86-64-linux-gnu (14.2.0-19) ...
#7 165.4 Setting up cpp-14 (14.2.0-19) ...
#7 165.4 Setting up libc6-dev:amd64 (2.41-12) ...
#7 165.4 Setting up libgcc-14-dev:amd64 (14.2.0-19) ...
#7 165.4 Setting up binutils-x86-64-linux-gnu (2.44-3) ...
#7 165.4 Setting up cpp-x86-64-linux-gnu (4:14.2.0-1) ...
#7 165.4 Setting up binutils (2.44-3) ...
#7 165.4 Setting up cpp (4:14.2.0-1) ...
#7 165.4 Setting up gcc-14-x86-64-linux-gnu (14.2.0-19) ...
#7 165.4 Setting up gcc-x86-64-linux-gnu (4:14.2.0-1) ...
#7 165.4 Setting up gcc-14 (14.2.0-19) ...
#7 165.4 Setting up gcc (4:14.2.0-1) ...
#7 165.4 Processing triggers for libc-bin (2.41-12) ...
#7 DONE 166.1s

#8 [4/8] COPY requirements.txt .
#8 DONE 0.0s

#9 [5/8] RUN echo "Flask==2.2.2" > requirements-docker.txt &&     echo "Werkzeug==2.2.3" >> requirements-docker.txt
#9 DONE 0.2s

#10 [6/8] RUN pip install --no-cache-dir --upgrade pip &&     pip install --no-cache-dir -r requirements-docker.txt
#10 2.385 Requirement already satisfied: pip in /usr/local/lib/python3.12/site-packages (25.0.1)
#10 2.757 Collecting pip
#10 3.023   Downloading pip-25.3-py3-none-any.whl.metadata (4.7 kB)
#10 3.076 Downloading pip-25.3-py3-none-any.whl (1.8 MB)
#10 4.722    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.8/1.8 MB 1.0 MB/s eta 0:00:00
#10 4.765 Installing collected packages: pip
#10 4.765   Attempting uninstall: pip
#10 4.770     Found existing installation: pip 25.0.1
#10 4.880     Uninstalling pip-25.0.1:
#10 5.226       Successfully uninstalled pip-25.0.1
#10 6.897 Successfully installed pip-25.3
#10 6.897 WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv. Use the --root-user-action option if you know what you are doing and want to suppress this warning.
#10 8.962 Collecting Flask==2.2.2 (from -r requirements-docker.txt (line 1))
#10 9.200   Downloading Flask-2.2.2-py3-none-any.whl.metadata (3.9 kB)
#10 9.303 Collecting Werkzeug==2.2.3 (from -r requirements-docker.txt (line 2))
#10 9.350   Downloading Werkzeug-2.2.3-py3-none-any.whl.metadata (4.4 kB)
#10 9.444 Collecting Jinja2>=3.0 (from Flask==2.2.2->-r requirements-docker.txt (line 1))
#10 9.489   Downloading jinja2-3.1.6-py3-none-any.whl.metadata (2.9 kB)
#10 9.552 Collecting itsdangerous>=2.0 (from Flask==2.2.2->-r requirements-docker.txt (line 1))
#10 9.599   Downloading itsdangerous-2.2.0-py3-none-any.whl.metadata (1.9 kB)
#10 9.683 Collecting click>=8.0 (from Flask==2.2.2->-r requirements-docker.txt (line 1))
#10 9.728   Downloading click-8.3.0-py3-none-any.whl.metadata (2.6 kB)
#10 9.958 Collecting MarkupSafe>=2.1.1 (from Werkzeug==2.2.3->-r requirements-docker.txt (line 2))
#10 10.00   Downloading markupsafe-3.0.3-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl.metadata (2.7 kB)
#10 10.06 Downloading Flask-2.2.2-py3-none-any.whl (101 kB)
#10 10.16 Downloading Werkzeug-2.2.3-py3-none-any.whl (233 kB)
#10 10.25 Downloading click-8.3.0-py3-none-any.whl (107 kB)
#10 10.30 Downloading itsdangerous-2.2.0-py3-none-any.whl (16 kB)
#10 10.34 Downloading jinja2-3.1.6-py3-none-any.whl (134 kB)
#10 10.39 Downloading markupsafe-3.0.3-cp312-cp312-manylinux2014_x86_64.manylinux_2_17_x86_64.manylinux_2_28_x86_64.whl (22 kB)
#10 10.42 Installing collected packages: MarkupSafe, itsdangerous, click, Werkzeug, Jinja2, Flask
#10 11.12
#10 11.12 Successfully installed Flask-2.2.2 Jinja2-3.1.6 MarkupSafe-3.0.3 Werkzeug-2.2.3 click-8.3.0 itsdangerous-2.2.0
#10 11.12 WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager, possibly rendering your system unusable. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv. Use the --root-user-action option if you know what you are doing and want to suppress this warning.
#10 DONE 11.7s

#11 [7/8] COPY app/ ./app/
#11 DONE 0.0s

#12 [8/8] COPY run.py .
#12 DONE 0.0s

#13 exporting to image
#13 exporting layers
#13 exporting layers 2.2s done
#13 writing image sha256:10ce933270cc48cc582eb2cc5743c0e37bbf8d802f6b873e296ce46f258b73b2 done
#13 naming to docker.io/library/python-app:1.0 done
#13 DONE 2.2s

</div>


- docker image ls | grep python

```
python-app   1.0       10ce933270cc   3 minutes ago   330MB
```

- docker run --rm -it -p 5000:5000 --name flask-microservices python-app:1.0
```
'FLASK_ENV' is deprecated and will not be used in Flask 2.3. Use 'FLASK_DEBUG' instead.
'FLASK_ENV' is deprecated and will not be used in Flask 2.3. Use 'FLASK_DEBUG' instead.
'FLASK_ENV' is deprecated and will not be used in Flask 2.3. Use 'FLASK_DEBUG' instead.
 * Serving Flask app 'app'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
192.168.40.50 - - [07/Nov/2025 11:37:34] "GET / HTTP/1.1" 404 -
192.168.40.50 - - [07/Nov/2025 11:37:35] "GET /favicon.ico HTTP/1.1" 404 -
192.168.40.50 - - [07/Nov/2025 11:37:40] "GET /users HTTP/1.1" 200 -
192.168.40.50 - - [07/Nov/2025 11:37:48] "GET /products HTTP/1.1" 200 -
192.168.40.50 - - [07/Nov/2025 11:37:52] "GET /products/1 HTTP/1.1" 200 -
```

- Test http://127.0.0.1:5000/users and http://127.0.0.1:5000/products

## 2. Provision a Kubernetes Cluster: Use Terraform to provision a Kubernetes cluster on a cloud provider (aws)

### Prerequisites
- AWS CLI installed and configured (access key)
- Terraform >= 1.0 installed (Terraform v1.13.5)
- kubectl installed (v1.34.1)

### Quick Start
```bash
# Navigate to terraform directory
cd terraform/

# Review and customize configuration
cp terraform.tfvars.example terraform.tfvars

# Deploy the EKS cluster
./deploy.sh
```

### What gets created:
- **VPC** with public/private subnets across 2 AZs
- **EKS Cluster** (v1.33) with managed node groups  
- **Security Groups** with proper ingress/egress rules
- **IAM Roles** for cluster and worker nodes
- **KMS encryption** for Kubernetes secrets
- **EKS Add-ons**: CoreDNS, kube-proxy, VPC CNI

### Configuration Options (terraform.tfvars):
```hcl
aws_region = "us-east-1"
cluster_name = "flask-microservices-cluster"
kubernetes_version = "1.33"
node_group_instance_types = ["t3.medium"]
node_group_desired_size = 2
node_group_max_size = 4
node_group_min_size = 1
```

### Estimated Cost:
- **EKS Cluster**: $0.10/hour (~$73/month)
- **2x t3.medium nodes**: ~$60/month  
- **NAT Gateways**: ~$32/month
- **Total**: ~$165/month

### Verify Deployment:
```bash
# Check cluster status
kubectl get nodes

# View all system pods  
kubectl get pods --all-namespaces

# Get cluster info
kubectl cluster-info
```

### Cleanup:
```bash
# Destroy all resources
cd terraform/
./destroy.sh
```

### Terraform Files Structure:
```
terraform/
├── main.tf              # VPC, networking, security groups
├── eks.tf               # EKS cluster and node groups  
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Configuration values
├── deploy.sh            # Automated deployment script
├── destroy.sh           # Cleanup script
└── README.md            # Detailed documentation
``` 


## 3. Deploy the Microservice: Deploy the containerized Python microservice on the Kubernetes cluster using Kubernetes YAML files

### Test in existing k8s cluster

- Copy docker image to specific worker
```
docker save -o python-app.tar python-app:1.0
ssh 192.168.xx.xx
sudo ctr -n=k8s.io --address /app1/data/containerd/containerd.sock images import python-app.tar
```

- Do the local test with just 2 files: deployment and service files
```
kubectl create ns test-python
kubectl apply -f deployment.yml -n test-python
kubectl apply -f svc.yml -n test-python
```

```
k get pod -n test-python -owide -w
NAME                          READY   STATUS    RESTARTS   AGE   IP            NODE                                 NOMINATED NODE   READINESS GATES
python-app-5d9d5f795d-z7pw4   1/1     Running   0          14s   10.47.64.80   <worker-name>   <none>           <none>

```

- Test
```
http://<master-ip>:31895/users
http://<master-ip>:31895/products
```

## 4. Expose the Service to the Internet: Ensure the deployed service is accessible externally by configuring a Kubernetes Ingress.

### Install the AWS Load Balancer Controller (one-time setup)
- Go to the EKS Console → Select your cluster.
- In the left menu, click "Add-ons".
- Click "Get more add-ons".
- Search for "AWS Load Balancer Controller" and install it.
- Follow the prompts to create the necessary IAM role (the console will guide you).
- Wait for the add-on to show as "Active".

### Deploy ingress for clusterIp service

- Create haproxy controller
```
cd ingress/haproxy-controller && helm install haproxy-controller kubernetes-ingress-1.40.1.tgz -f haproxy-controller-values.yml -n haproxy-controller
```
- Create the ingress
```
kubectl apply -f ingress/ingress.yml
```

## 5. Deployment: Implement a CI/CD pipeline to automate the build and deployment process. (GitLab CI/CD)

- ci-cd/.gitlab-ci.yml has build and deploy stage for both on-premises and aws.

## 6. Monitoring: Implement a monitoring stack for metrics monitoring to monitor the Kubernetes cluster and the application.

- for monitoring I will be using prometheus and grafana dashbaords. 
- kube-prometheus-stack provides service monitors to monitor k8s cluster. The stack also provides grafana
```
helm install prometheus-stack kube-prometheus-stack-66.3.1.tgz -f prometheus-values.yml -n monitoring
```
- For the python app, I will be using prometheus client python (https://prometheus.github.io/client_python/)
- Implement /metrics endpoint

in requirements.txt
```
prometheus-client==0.19.0
```

in app/__init__.py:
```
from prometheus_client import generate_latest, CONTENT_TYPE_LATEST
.
.
.
    @app.route('/metrics')
    def metrics():
        """ Exposes application metrics in a Prometheus-compatible format. """
        return generate_latest(), 200, {'Content-Type': CONTENT_TYPE_LATEST}
```

check:
```
python3 run.py
curl http://localhost:5000/metrics
```

- create servicemonitor for the python app svc (this is how we add targets to prometheus)
```
kubectl apply -f servicemonitor.yml -n monitoring
```



