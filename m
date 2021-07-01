Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2EF93B91C5
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Jul 2021 14:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbhGAMwj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Thu, 1 Jul 2021 08:52:39 -0400
Received: from mail.eclipso.de ([217.69.254.104]:49362 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236192AbhGAMwj (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 1 Jul 2021 08:52:39 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 0D4C08A2
        for <linux-rtc@vger.kernel.org>; Thu, 01 Jul 2021 14:50:08 +0200 (CEST)
Date:   Thu, 01 Jul 2021 14:50:08 +0200
MIME-Version: 1.0
Message-ID: <d7b7ce395a76a995f1998ff21266dfaf@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <Cedric.dewijs@eclipso.eu>
Subject: rtc_rv8803.ko does not create a /dev/rtc?
Reply-To: " " <Cedric.dewijs@eclipso.eu>
To:     <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

­Hi all,

I have a raspberry pi 3B, running kernel 5.10.17. On the i2c bus, I've added a rx8900 rtc chip. I would like to use this chip, but I fail to create a /dev/rtc for it.

I have checked the kernel version:
# uname -a
Linux raspberrypi 5.10.17-v7+ #1421 SMP Thu May 27 13:59:01 BST 2021 armv7l GNU/Linux

I've downloaded the rtc driver for this version of the kernel from here:
https://github.com/raspberrypi/linux/blob/rpi-5.10.y/drivers/rtc/rtc-rv8803.c

And compiled the driver with this makefile [1, see below] and installed the resulting rtc-rv8803.ko here:

$ modinfo /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv8803.ko 
filename:       /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv8803.ko
license:        GPL v2
description:    Micro Crystal RV8803 RTC driver
author:         Alexandre Belloni <alexandre.belloni@bootlin.com>
srcversion:     0067552CB786360DEA9CADB
alias:          i2c:rx8900
alias:          i2c:rx8803
alias:          i2c:rv8803
alias:          of:N*T*Cepson,rx8900C*
alias:          of:N*T*Cepson,rx8900
alias:          of:N*T*Cepson,rx8803C*
alias:          of:N*T*Cepson,rx8803
alias:          of:N*T*Cmicrocrystal,rv8803C*
alias:          of:N*T*Cmicrocrystal,rv8803
depends:        
name:           rtc_rv8803
vermagic:       5.10.17-v7+ SMP mod_unload modversions ARMv7 p2v8 

Next I do the following steps to load the module:
# modprobe i2c:rx8900
[  130.591843] rtc_rv8803: loading out-of-tree module taints kernel.

The module is loaded:
# lsmod
Module                  Size  Used by
rtc_rv8803             16384  0

Next I bind the driver to the i2c address 0x32:
# echo i2c:rx8900 0x32 > /sys/class/i2c-adapter/i2c-1/new_device
[  176.871589] i2c i2c-1: new_device: Instantiated device i2c:rx8900 at 0x32

This does not give me a /dev/rtc device:
# ls /dev/rtc*
ls: cannot access '/dev/rtc*': No such file or directory

The rtc is detected at address 0x32, but it's not claimed by any driver (that would have been indicated by UU instead of 32).
# i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- -- 
30: -- -- 32 -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- 49 4a -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         

What did I miss?

Kind regards,
Cedric

[1] 
$ cat Makefile
RV8803_DIR = $(shell pwd)
KSRC = /lib/modules/$(KVER)/build
KVER = $(shell uname -r)
MODDESTDIR = /lib/modules/$(KVER)/kernel/drivers/rtc

CROSS_COMPILE    =

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
INSTALL            = /usr/bin/install
GREP            = /bin/grep

obj-m += rtc-rv8803.o

all:
    modules

modules:
    $(MAKE) -C $(KSRC) M=$(RV8803_DIR) CC=$(CC) modules

install: modules
    @$(GREP) rtc-rv8803.ko /lib/modules/$(shell uname -r)/modules.dep && rm -fr $(MODDESTDIR)/rtc-rv8803.ko || echo "No system rtc-rv8803.ko file found. Install the new rtc-rv8803.ko driver into the system"
    $(INSTALL) -p -m 644 rtc-rv8803.ko $(MODDESTDIR)
    @$(DEPMOD) -a
    
uninstall:
    @$(GREP) rtc-rv8803.ko /lib/modules/$(shell uname -r)/modules.dep && rm -fr $(MODDESTDIR)/rtc-rv8803.ko || echo "Remove the rtc-rv8803.ko driver from the system"
    @$(DEPMOD) -a
    
clean:
________________________________________________________
Ihr Recht auf Privatsphäre. Schützen Sie Ihre Daten und wechseln jetzt zu eclipso Mail & Cloud - https://www.eclipso.de


