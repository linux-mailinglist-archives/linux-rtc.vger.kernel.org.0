Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8D83BA0EF
	for <lists+linux-rtc@lfdr.de>; Fri,  2 Jul 2021 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhGBNLj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 2 Jul 2021 09:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhGBNLj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 2 Jul 2021 09:11:39 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87ABCC061762
        for <linux-rtc@vger.kernel.org>; Fri,  2 Jul 2021 06:09:06 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id h126so3178700vsc.6
        for <linux-rtc@vger.kernel.org>; Fri, 02 Jul 2021 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xs+5zV6gRmpdOEdR3+zKWEhmRYB6kLCUl+9YYHdWfP8=;
        b=si6nkl5pbIE+LuurKgRwgLbMSKGyP4B2dSnfs5JmBuk8eZAE3KOim2xR5tTO93D3La
         anTUZvntg5YWI86UMe2AyxfNGRwuj0LVz2J4UW6VaXVR/RFPazm9TOOEkqpc1BiJJR+c
         RYur46Z6d9Lrx9ttd5UB2pblwQNN6EHmdXEIQDlyKrKxUKLftZ86vWct7VFvmKKseNl5
         VIYF39CoUrYgWtnVL+0uqk+0IrmJyR6O755tUULx5K45SXPNMmOhsVvQMDnswQ33DTzv
         te6kRYKktyHM1c881Rnp2FX4sQBBP5vdd3+s0hNoS6Tn2UFg48ESmKOdtbWJhG8zBhIz
         iIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xs+5zV6gRmpdOEdR3+zKWEhmRYB6kLCUl+9YYHdWfP8=;
        b=r6Q0bgrQ6QtGYWFSvTyWbQez95XTle7uJhkEtutLTQe7S+h7Te1xsfDumGqORRPx2j
         b0KKLTczYoLJ21yk667bKCt1mjZsLjFNiQs/v0rybobGu3iEywuLiR7c9TjGZX3Ba3Cm
         qN5C5uWHEIH+6rTSjsdFBeqPaRKJz8ZzTjuIkmrXCXETTavogdqEN+NlqHWz42uzjd8u
         BwVdgMXWaFotT6GsXy1N0/Ph/cXwn65RBt19ppcZgH6f/IFxhSAhMYSCmcIgibW1RdDZ
         Xc60mafbfToxqyB/7Obn+GexTjRmoEBQTSRxvvtXiGW2l0V8jZA0/OGme/QVE8ZlC8HX
         JoaA==
X-Gm-Message-State: AOAM530eHrmISj10Eb94S6ZxHA5WtIQL8xOQfMl/RarChjqjm8aZJWrH
        K12e3+Ej/YKieZ/12efdglNqEfUDjdSCG/erfWNU
X-Google-Smtp-Source: ABdhPJzgpRwi5pqda2SK3lziqju3auwZwds1+o+8/egdu1WmCR9bT+G5bse5CdBjffytqGLe7qYQmYd3rphpEINGzeI=
X-Received: by 2002:a67:ee54:: with SMTP id g20mr6007913vsp.55.1625231345449;
 Fri, 02 Jul 2021 06:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <d7b7ce395a76a995f1998ff21266dfaf@mail.eclipso.de>
In-Reply-To: <d7b7ce395a76a995f1998ff21266dfaf@mail.eclipso.de>
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date:   Fri, 2 Jul 2021 22:08:38 +0900
Message-ID: <CABMQnVKD8hLoYtDXo7SQehkw=N6kinyhsvGZAWC+gJQdRMuS2g@mail.gmail.com>
Subject: Re: rtc_rv8803.ko does not create a /dev/rtc?
To:     Cedric.dewijs@eclipso.eu
Cc:     linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

2021=E5=B9=B47=E6=9C=881=E6=97=A5(=E6=9C=A8) 21:50 <Cedric.dewijs@eclipso.e=
u>:
>
> =C2=ADHi all,
>
> I have a raspberry pi 3B, running kernel 5.10.17. On the i2c bus, I've ad=
ded a rx8900 rtc chip. I would like to use this chip, but I fail to create =
a /dev/rtc for it.
>
> I have checked the kernel version:
> # uname -a
> Linux raspberrypi 5.10.17-v7+ #1421 SMP Thu May 27 13:59:01 BST 2021 armv=
7l GNU/Linux
>
> I've downloaded the rtc driver for this version of the kernel from here:
> https://github.com/raspberrypi/linux/blob/rpi-5.10.y/drivers/rtc/rtc-rv88=
03.c
>
> And compiled the driver with this makefile [1, see below] and installed t=
he resulting rtc-rv8803.ko here:
>
> $ modinfo /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv8803.ko
> filename:       /usr/lib/modules/5.10.17-v7+/kernel/drivers/rtc/rtc-rv880=
3.ko
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

> [  176.871589] i2c i2c-1: new_device: Instantiated device i2c:rx8900 at 0=
x32
>
> This does not give me a /dev/rtc device:
> # ls /dev/rtc*
> ls: cannot access '/dev/rtc*': No such file or directory
>
> The rtc is detected at address 0x32, but it's not claimed by any driver (=
that would have been indicated by UU instead of 32).
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

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 40AD1FA6
