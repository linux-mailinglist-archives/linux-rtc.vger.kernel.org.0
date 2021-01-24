Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F1A301CA0
	for <lists+linux-rtc@lfdr.de>; Sun, 24 Jan 2021 15:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbhAXOOT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Sun, 24 Jan 2021 09:14:19 -0500
Received: from mail.eclipso.de ([217.69.254.104]:55422 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbhAXOOS (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 24 Jan 2021 09:14:18 -0500
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Jan 2021 09:14:18 EST
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 255BA008
        for <linux-rtc@vger.kernel.org>; Sun, 24 Jan 2021 15:07:52 +0100 (CET)
Date:   Sun, 24 Jan 2021 15:07:52 +0100
MIME-Version: 1.0
Message-ID: <721fdcefb1cb3932cd0b715b2f689c8d@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <Cedric.dewijs@eclipso.eu>
Subject: out of tree rtc driver RX8900CE, has anybody updated it to the new v5
        kernel interface?
Reply-To: " " <Cedric.dewijs@eclipso.eu>
To:     <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

­Hi All,

I have a RX8900CE rtc, connected to the i2c bus of a raspberry pi. I've gotten a kernel module from the manufacturer of the chip [1][2], it's based on the kernel module for the RX-8025 [3]. I've compiled it with this makefile [4]:

This all worked without any problem, in kernel 4.19.76 but in newer kernels the structure of the rtc drivers has changed.

Has anybody already converted the RX8900CE driver to the new kernel interface?
After I update the kernel module, what steps do I have to take so it can be included in the mainline kernel?

Cheers,
Cedric


[1] https://www5.epsondevice.com/en/information/support/linux_rtc/down_load.html
[2] https://www5.epsondevice.com/en/information/support/soft/rx8900_k3.8-v1.0.zip
[3] https://github.com/torvalds/linux/blob/master/drivers/rtc/rtc-rx8025.c
[4] 
RX8900_DIR = $(shell pwd)
KSRC = /lib/modules/$(KVER)/build
KVER = $(shell uname -r)
MODDESTDIR = /lib/modules/$(KVER)/kernel/drivers/rtc

CROSS_COMPILE	=

AS              = $(CROSS_COMPILE)as
LD              = $(CROSS_COMPILE)ld
CC              = $(CROSS_COMPILE)gcc
CPP             = $(CC) -E
AR              = $(CROSS_COMPILE)ar
NM              = $(CROSS_COMPILE)nm
STRIP           = $(CROSS_COMPILE)strip
OBJCOPY         = $(CROSS_COMPILE)objcopy
OBJDUMP         = $(CROSS_COMPILE)objdump
DEPMOD          = /sbin/depmod
INSTALL			= /usr/bin/install
GREP			= /bin/grep

obj-m += rtc-rx8900.o

all:
	modules

modules:
	$(MAKE) -C $(KSRC) M=$(RX8900_DIR) CC=$(CC) modules

install: modules
	@$(GREP) rtc-rx8900.ko /lib/modules/$(shell uname -r)/modules.dep && rm -fr $(MODDESTDIR)/rtc-rx8900.ko || echo "No system rtc-rx8900.ko file found. Install the new rtc-rx8900.ko driver into the system"
	$(INSTALL) -p -m 644 rtc-rx8900.ko $(MODDESTDIR)
	@$(DEPMOD) -a
	
uninstall:
	@$(GREP) rtc-rx8900.ko /lib/modules/$(shell uname -r)/modules.dep && rm -fr $(MODDESTDIR)/rtc-rx8900.ko || echo "Remove the rtc-rx8900.ko driver from the system"
	@$(DEPMOD) -a
	
clean:
	$(MAKE) -C $(KSRC) M=$(RX8900_DIR) CC=$(CC) clean


---

Take your mailboxes with you. Free, fast and secure Mail &amp; Cloud: https://www.eclipso.eu - Time to change!


