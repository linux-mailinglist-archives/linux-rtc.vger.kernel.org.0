Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA67B3BB75A
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jul 2021 08:56:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhGEG7c convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-rtc@lfdr.de>); Mon, 5 Jul 2021 02:59:32 -0400
Received: from mail.eclipso.de ([217.69.254.104]:51096 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhGEG7c (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 5 Jul 2021 02:59:32 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 11CED34A
        for <linux-rtc@vger.kernel.org>; Mon, 05 Jul 2021 08:56:54 +0200 (CEST)
Date:   Mon, 05 Jul 2021 08:56:54 +0200
MIME-Version: 1.0
Message-ID: <3527caffc044a13e023053dc5d173271@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <Cedric.dewijs@eclipso.eu>
Subject: Re: Fwd: Re: rtc_rv8803.ko does not create a /dev/rtc?
Reply-To: " " <Cedric.dewijs@eclipso.eu>
To:     <Cedric.dewijs@eclipso.eu>, <iwamatsu@nigauri.org>,
        "linux-rtc@vger.kernel.org>" <linux-rtc@vger.kernel.org>
In-Reply-To: <e565b6503bfcf0dcd704e2959640aee5@mail.eclipso.de>
References: <d7b7ce395a76a995f1998ff21266dfaf@mail.eclipso.de>
        <CABMQnVKD8hLoYtDXo7SQehkw=N6kinyhsvGZAWC+gJQdRMuS2g@mail.gmail.com>
        <e565b6503bfcf0dcd704e2959640aee5@mail.eclipso.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--- Ursprüngliche Nachricht ---
Von: " " <Cedric.dewijs@eclipso.eu>
Datum: 05.07.2021 06:32:30
An: <cedric.dewijs@eclipso.eu>
Betreff: Fwd: Re: rtc_rv8803.ko does not create a /dev/rtc?

--- Ursprüngliche Nachricht ---
Von: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Datum: 02.07.2021 15:08:38
An: Cedric.dewijs@eclipso.eu
Betreff: Re: rtc_rv8803.ko does not create a /dev/rtc?

Hi,

2021年7月1日(木) 21:50 <Cedric.dewijs@eclipso.eu>:
>
> ­Hi all,
>
> I have a raspberry pi 3B, running kernel 5.10.17. On the i2c bus, I've

added a rx8900 rtc chip. I would like to use this chip, but I fail to create

a /dev/rtc for it.
>
> I have checked the kernel version:
> # uname -a
> Linux raspberrypi 5.10.17-v7+ #1421 SMP Thu May 27 13:59:01 BST 2021

armv7l GNU/Linux
>
> I've downloaded the rtc driver for this version of the kernel from here:


> https://github.com/raspberrypi/linux/blob/rpi-5.10.y/drivers/rtc/rtc-rv8803.c


>
> And compiled the driver with this makefile [1, see below] and installed

the resulting rtc-rv8803.ko here:
>
> $ modinfo /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv8803.ko


> filename:       /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv8803.ko


> license:        GPL v2
> description:    Micro Crystal RV8803 RTC driver
> author:         Alexandre Belloni <alexandre.belloni@bootlin.com>


> srcversion:     0067552CB786360DEA9CADB
> alias:          i2c:rx8900
> alias:          i2c:rx8803
> alias:          i2c:rv8803
> alias:          of:N*T*Cepson,rx8900C*
> alias:          of:N*T*Cepson,rx8900
> alias:          of:N*T*Cepson,rx8803C*
> alias:          of:N*T*Cepson,rx8803
> alias:          of:N*T*Cmicrocrystal,rv8803C*
> alias:          of:N*T*Cmicrocrystal,rv8803
> depends:
> name:           rtc_rv8803
> vermagic:       5.10.17-v7+ SMP mod_unload modversions ARMv7 p2v8
>
> Next I do the following steps to load the module:
> # modprobe i2c:rx8900
> [  130.591843] rtc_rv8803: loading out-of-tree module taints kernel.



This is not necessary if the module is installed correctly.
The module will be loaded when you write to '/sys/class/
i2c-adapter/i2c-1/new_device' below.

>
> The module is loaded:
> # lsmod
> Module                  Size  Used by
> rtc_rv8803             16384  0
>
> Next I bind the driver to the i2c address 0x32:
> # echo i2c:rx8900 0x32 > /sys/class/i2c-adapter/i2c-1/new_device



I think ' i2c' is unnecessary.
Please check with following:
  echo rx8900 0x32 > /sys/class/i2c-adapter/i2c-1/new_device

> [  176.871589] i2c i2c-1: new_device: Instantiated device i2c:rx8900

at 0x32
>
> This does not give me a /dev/rtc device:
> # ls /dev/rtc*
> ls: cannot access '/dev/rtc*': No such file or directory
>
> The rtc is detected at address 0x32, but it's not claimed by any driver

(that would have been indicated by UU instead of 32).
> # i2cdetect -y 1
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
> 30: -- -- 32 -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- 49 4a -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>
> What did I miss?
>
> Kind regards,
> Cedric

Best regards,
  Nobuhiro


Hi, it worked:
pi@raspberrypi:~ $ sudo -i
root@raspberrypi:~# echo rx8900 0x32 > /sys/class/i2c-adapter/i2c-1/new_device

Jul  1 17:17:32 raspberrypi kernel: i2c i2c-1: new_device: Instantiated device rx8900 at 0x32
Jul  1 17:17:32 raspberrypi kernel: rtc_rv8803: loading out-of-tree module taints kernel.
Jul  1 17:17:32 raspberrypi kernel: rtc-rv8803 1-0032: Voltage low, temperature compensation stopped.
Jul  1 17:17:32 raspberrypi kernel: rtc-rv8803 1-0032: Voltage low, data loss detected.
Jul  1 17:17:32 raspberrypi kernel: rtc-rv8803 1-0032: An alarm maybe have been missed.
Jul  1 17:17:32 raspberrypi kernel: rtc-rv8803 1-0032: Voltage low, data is invalid.
Jul  1 17:17:32 raspberrypi kernel: rtc-rv8803 1-0032: registered as rtc0
Jul  1 17:21:02 raspberrypi dhcpcd[430]: wlan0: hardware address 00:00:00:00:00:00 claims 10.93.128.58
root@raspberrypi:~# ls -l /dev/rtc0 
crw------- 1 root root 252, 0 Jul  1 17:17 /dev/rtc0


root@raspberrypi:~# i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- -- 
30: -- -- UU -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- 49 4a -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- 68 -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- --                         

root@raspberrypi:~# hwclock -w
root@raspberrypi:~# hwclock -r
2021-07-01 17:29:37.223549+02:00
root@raspberrypi:~# hwclock -r
2021-07-01 17:29:49.788067+02:00

Thank you,
Cedric



________________________________________________________
Ihr Recht auf Privatsphäre. Schützen Sie Ihre Daten und wechseln jetzt zu eclipso Mail & Cloud - https://www.eclipso.de


