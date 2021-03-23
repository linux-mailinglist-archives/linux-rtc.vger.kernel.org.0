Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C842346BF1
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Mar 2021 23:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhCWWP2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Tue, 23 Mar 2021 18:15:28 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38145 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbhCWWOw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Mar 2021 18:14:52 -0400
Received: from localhost.localdomain ([82.142.25.162]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MJEMt-1l4g6s3aWJ-00KkmU; Tue, 23 Mar 2021 23:14:34 +0100
From:   Laurent Vivier <laurent@vivier.eu>
To:     linux-kernel@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] m68k: Add Virtual M68k Machine
Date:   Tue, 23 Mar 2021 23:14:28 +0100
Message-Id: <20210323221430.3735147-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:j8CPgu/CLqP6+6iZqF5GKlyEcInJxjDbuDcQ1KDqVzrJjRIJ0Qs
 OZBKydzC53HxbPRvKcCMNJQczqrpXbd9VOUPCjmlc83I2qXQpkiYXTc5Ukb+kUb9JmFZvxs
 J0GvNZQo8mQzpc1glFv1Ri2bJl3vb/Yiz1hL+rnP7u106v78WmjL5sg+h6ygyuEKQcvuEph
 n76E2q5f/j8ARjM4bT4Vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UYqdyMaw7L0=:YjOZR8DQq4wWyPa53zBtew
 nzc9yEl8ZBIY9jc1xT3sZQfBiRXNEuThEs3k1rj266bvIExHma5c+0A4FtwZiiHsG3DaMEtPa
 hJBld2vj0XAyVoh+F9U0wwCXmhE1S2598COjaI23aISMEQ76C5mm5WN8q4l+4jKnQEqTvhtqu
 79IIpsf7ESDs4nywQaHbJCKR4EmVPODrJSAfM0yKoukihbfc53nm4ENaiJOV5jJfIyZp0AGWo
 ptaVFL+yvvCiTqz/bKC1tUscnqP5Ge7a30qgNeYJN7oJ43XFdJkJnhGprDol0PZ1LIrDyP+vY
 /HpGl65L7iy18on2ABcyeZi/6ZpMGtKy1Vd/URMBYMpDeP8Vwd5lrJjI3yvI0DXB9IiVFr8Ob
 NA/cU09mmSwtUc8ccGHC5lckld0xxJqquqdUm7XCKgBVYfPpGX8Fp5Exn79LkwWTLsrooZr7I
 7+Szfeg1sg==
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The most powerful m68k machine emulated by QEMU is a Quadra 800,
but this machine is very limited: only 1 GiB of memory and only some
specific interfaces, with no DMA.

The Virtual M68k Machine is based on Goldfish interfaces defined by Google
for Android simulator. It uses Goldfish-rtc (timer and RTC),
Goldfish-pic (PIC) and Goldfish-tty (for early tty).

The machine is created with 128 virtio-mmio buses, and they can
be used to add serial console, GPU, disk, NIC, HID, hwrng, 9PFS...

The virtual m68k machine has been merged in QEMU and will be available
with the release 6.0.

This series introduces the support of this new machine in the linux kernel.

If you want to try:

- Configure and build latest QEMU with (or download qemu 6.0 binary):

  .../configure --target-list=3Dm68k-softmmu --enable-virglrenderer
  make

- Configure and build linux with:

  make virt_defconfig
  make vmlinux

A pre-installed qcow2 disk image is available at:

http://vivier.eu/debian-10.0.qcow2

You can run the machine with something like:

qemu-system-m68k -M virt \
  -m 3G \
  -chardev stdio,signal=3Doff,mux=3Don,id=3Dchar0 \
  -mon chardev=3Dchar0,mode=3Dreadline \
  -kernel vmlinux \
  -append "console=3Dhvc0 root=3D/dev/vda2" \
  -blockdev node-name=3Dsystem,driver=3Dfile,filename=3Ddebian-10.0.qcow2 \
  -blockdev node-name=3Ddrive0,driver=3Dqcow2,file=3Dsystem \
  -device virtio-blk-device,drive=3Ddrive0 \
  -serial chardev:char0 \
  -device virtio-net-device,netdev=3Dhostnet0 \
  -netdev bridge,id=3Dhostnet0,br=3Dvirbr0,helper=3D/usr/libexec/qemu-bridge-=
helper \
  -device virtio-serial-device \
  -device virtio-gpu-device \
  -device virtconsole,chardev=3Dchar0 \
  -device virtio-keyboard-device \
  -device virtio-mouse-device

You can watch a presentation about the machine on the Planet m68k channel:

    https://youtu.be/s_ve0bCC9q4
    [Demo at 38:00]

Thanks,
Laurent

Laurent Vivier (2):
  rtc: goldfish: remove dependency to OF
  m68k: introduce a virtual m68k machine

 arch/m68k/Kbuild                           |   1 +
 arch/m68k/Kconfig.machine                  |  17 +++
 arch/m68k/configs/virt_defconfig           |  93 ++++++++++++++++
 arch/m68k/include/asm/irq.h                |   3 +-
 arch/m68k/include/asm/pgtable_mm.h         |   7 ++
 arch/m68k/include/asm/setup.h              |  44 ++++++--
 arch/m68k/include/asm/virt.h               |  26 +++++
 arch/m68k/include/uapi/asm/bootinfo-virt.h |  18 ++++
 arch/m68k/include/uapi/asm/bootinfo.h      |   1 +
 arch/m68k/kernel/Makefile                  |   1 +
 arch/m68k/kernel/head.S                    |  30 ++++++
 arch/m68k/kernel/setup_mm.c                |   9 ++
 arch/m68k/mm/kmap.c                        |  20 ++--
 arch/m68k/virt/Makefile                    |   6 ++
 arch/m68k/virt/config.c                    | 118 +++++++++++++++++++++
 arch/m68k/virt/ints.c                      | 110 +++++++++++++++++++
 arch/m68k/virt/platform.c                  |  80 ++++++++++++++
 arch/m68k/virt/timer.c                     |  91 ++++++++++++++++
 drivers/rtc/Kconfig                        |   2 +-
 19 files changed, 659 insertions(+), 18 deletions(-)
 create mode 100644 arch/m68k/configs/virt_defconfig
 create mode 100644 arch/m68k/include/asm/virt.h
 create mode 100644 arch/m68k/include/uapi/asm/bootinfo-virt.h
 create mode 100644 arch/m68k/virt/Makefile
 create mode 100644 arch/m68k/virt/config.c
 create mode 100644 arch/m68k/virt/ints.c
 create mode 100644 arch/m68k/virt/platform.c
 create mode 100644 arch/m68k/virt/timer.c

--=20
2.30.2

