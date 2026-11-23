# ix

Sinai is a small Linux root filesystem. Toybox supplies commands, musl
supplies libc, and Bash supplies a real shell. Git and Make are the ports
tools. gen, LD, lord, nsh and yhwh supply the English side of the system.

Build with Docker and Buildx on Linux. Build the filesystem as root so it
can assign UIDs 0, 1, and 2. QEMU starts the x86-64 guest. cpio and gzip
make its initramfs, and Syslinux starts the BIOS ISO. Alpine 3.23 supplies
musl and the binary dependencies. ix builds Toybox from a pinned source
archive.

~~~sh
sudo make world
sudo make chroot
sudo make check
sudo make boot
sudo make iso
sudo make container
docker run --rm -it ix:local
~~~

ROOT defaults to /mnt/sinai. Use ROOT=/tmp/another-ix for a fresh world.
An existing ix root is reused. The host can run a command via
**make chroot COMMAND='id user'**. The OS has a root console and three
accounts. Switch locally with **su - user** or **su - yhwh**.
Use **chsh -s /bin/yhwh user** as root to change an account's shell.

Each home starts with **make enterprise**. Commands installed via gen go in
/bin for root or ~/bin for other users. **make -C /** lists the system
entry points. **make -C /bin**, **make -C /etc**, and **make -C /lib**
each show something about their directory. **man @** is the introduction. Set GIT_ROOT to use a mirror
with the same group and repository names.

Set GEN_URL and GEN_MODEL to reach an agent from inside ix. The chroot
command forwards those settings, GEN_AGENT and GEN_KEY. For QEMU's default
user networking, the host is reachable at 10.0.2.2. Bring your own Git
authentication for private source trees.

The **distro-nixos**, **distro-arch** and **distro-gentoo** targets add the
same command and ports files to the corresponding container base. Each base
keeps its system and account management. Those targets need Docker access
and root to assemble the overlay.
