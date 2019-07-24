Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C50E9728EB
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2019 09:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGXHSX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Jul 2019 03:18:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43445 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfGXHSX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Jul 2019 03:18:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id e3so46184079edr.10
        for <linux-rtc@vger.kernel.org>; Wed, 24 Jul 2019 00:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mg5NAuFGmeyZ+2PG/0W+EUmftqQ8AiNtDR5qG42cRqw=;
        b=mR1bqYhXcv6Seq8Uz5bDW939uPBBhlK7xpZd+Q/lVSerdeNIm2wqu7+H+p6KFQT26j
         jk0qwGyL9f1zmmDqldznTzn3BF/riKUVRgjmNsXRjFVVOrqXnwQqHkl0lZhroCBrszI+
         Qzw4n3brxB+DsL8zmTDFYgBgfsqV2yTTUJgmrWJL7voK5UBtb2LpupiYH64nJwO8dJ2t
         XW2xlAJbGiPNbi0oTkuJpX3RyI5YuGirKYfZI0FCNEOV8++xaoWKjHerHYRl2YKRk8bk
         l6gvTNrfT6KpFLhx2Jc/dkE9xZjE6rRoFRLHrEDQzgJO3+xFgdNLUAusmlP6SD3TBf9m
         qYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mg5NAuFGmeyZ+2PG/0W+EUmftqQ8AiNtDR5qG42cRqw=;
        b=fSGxhsYpOpCZEEzscUP/4UHpmWQBWTcWSwrLbSLSImMLtO8KmRS+tti5EeMuQr5fYc
         gjZcP24NNbpCUlcX/vSJDCk+2rt7w6mpT5wtR3ISLXkr8TWtqPHzhelOrW/kRu3YXCV7
         g42G9b11IrgFX27sn9iUSTggexZJZK52xrx1nFWuiEul826tgUO3/BrPJG2HT244AkqR
         IEEHfV4VxW52fVruU/PN8W8pn3BcKhVt27LM6AdrU6evtlkIo9uMJ+I/6xh4xp+6LPj8
         oIxaXP3YVxBiGnGVvjxG24NGUsSlfhKqhULsKCA7ordziHFf5SNoCOmxM2DDHZXy+ztQ
         sumQ==
X-Gm-Message-State: APjAAAUh6FhOtxhha7p1+f2UgkQ/BUwKvlrycgLnjz0qgI29gGgfhxR8
        XB7JnoFkFm5oPLEYT58mCGrKN2LZzsrmhehvXPw=
X-Google-Smtp-Source: APXvYqxqN/I8hwL15bR5nCJGNV3ScWmeRL9WR9lbqEafdQunUrfMs6QPBqc3PvnKO4Un1QfMCa5ngg8sJPUXhacWfr4=
X-Received: by 2002:a50:aeee:: with SMTP id f43mr70451526edd.221.1563952701393;
 Wed, 24 Jul 2019 00:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
 <20190722155811.11980-5-bruno.thomsen@gmail.com> <20190723184842.GM24911@piout.net>
In-Reply-To: <20190723184842.GM24911@piout.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Wed, 24 Jul 2019 09:18:05 +0200
Message-ID: <CAH+2xPAjafxayxFStQOFqiEKZKMtiNaNrYWfy5YbJVdmxYXq7g@mail.gmail.com>
Subject: Re: [PATCH 4/4] rtc: pcf2127: add watchdog feature support
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Thanks for review.

Den tir. 23. jul. 2019 kl. 20.48 skrev Alexandre Belloni
<alexandre.belloni@bootlin.com>:
>
> > +config RTC_DRV_PCF2127_WDT
> > +     bool "NXP PCF2127 watchdog timer"
> > +     depends on RTC_DRV_PCF2127
> > +     help
> > +       If you say Y here you will get support for the watchdog timer
> > +       in the NXP PCF2127 and PCF2129 real-time clock chips.
> > +
> > +       The watchdog is usually used together with systemd or the
> > +       watchdog daemon. Watchdog trigger cause system reset.
> > +
>
> I wouldn't add a new Kconfig entry for that. How much bigger will it be?

Delta size on rtc-pcf2127.ko is 3244 bytes when compiled for armv7a.

I only added Kconfig option to allow driver load on arm platforms where
you need to use internal watchdog to restart board. But I will remove it
for next version, should I extend help text on exiting Kconfig option to
also include information about other chip features? As this is not a
simple RTC chip.

> > +static const struct file_operations pcf2127_wdt_fops =3D {
> > +     .owner =3D THIS_MODULE,
> > +     .write =3D pcf2127_wdt_write,
> > +     .unlocked_ioctl =3D pcf2127_wdt_ioctl,
> > +};
> > +
> > +static struct miscdevice pcf2127_miscdev =3D {
> > +     .minor =3D WATCHDOG_MINOR,
> > +     .name =3D "watchdog",
> > +     .fops =3D &pcf2127_wdt_fops,
> > +};
>
> Wow, that is old school, please use the watchdog subsyste=C5=AF.

Okay, I was not aware that this was an old API. So I should convert
to struct watchdog_ops and devm_watchdog_register_device?

/Bruno
