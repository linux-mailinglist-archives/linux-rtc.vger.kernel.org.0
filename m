Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C458324164
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Feb 2021 17:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhBXPzg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Feb 2021 10:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbhBXOz6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Feb 2021 09:55:58 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA79C061793;
        Wed, 24 Feb 2021 06:55:18 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mm21so3263612ejb.12;
        Wed, 24 Feb 2021 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3j0lhpP6wl1sNXXGOjAgQjtmVdXg0Q4ttmyImYyylq8=;
        b=Z9znUNeUXaL0Aza6POIYwbQm0Ntea6gy0q18rISzV7hBjNPJL+QJ2r5ObTKH9sye68
         gA4acDuFif3/2wHSnCFGi+pHeGpk6Oq37ihYrxvQmH7Q3FSVtPUn+6Cu//XggjwvzaTd
         KSwIDRdM4lvzrNlqqDBdAa8YsZxEEBYcDAflnDwPoXrxVDp9Zmd6eT74QJOIFGGDdHAC
         IUepO1U7PdVDK99B+X4JG8SS6P7VJWr/dnU/+Q0UJWGNdPNz959zWON/ueozhPuiJUIe
         cl+OmOI8m+Ua2EX8KnQeVS4un9nqruINYEL4OXRolKHfOHJ93b3LLVgDZfav+lZWzUSU
         1ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3j0lhpP6wl1sNXXGOjAgQjtmVdXg0Q4ttmyImYyylq8=;
        b=BFFCtHK4GX+Mxm7zAR2yllQinZW0RjcxrJqnJffGgJ/f9ZQMfHOc0HrGJzdqGs/PUA
         F1+MkBGMNTNqpSL8VuMf6y3xqnRce5zKs285KQ328WwK8HR8QMd86btKBpexh4P8vXuK
         VlZuBqxsvlQ0FHHJIk0uj3Z50ztuziMhZpON+SM2uKObm5UW6Ij2zycMIXbyVyUoyBNJ
         T6BStDhQDHhsvtplSCaMM5hCOOIeAya49YlcfA/M/SaWhbU1Gxq4k5qugHHey2L+USje
         lwZ8VoXpshUd1bScA2FuWW9aGns9E4mISXkG9YcU8KVntReImrNBLYObFUJRG9rkEdQL
         x7Sg==
X-Gm-Message-State: AOAM532PH0uqMfCo17mhIBsqfKXfHqRx7xCPYrPf30hD/wkjF9+EgQIX
        LjbLxuWQuIf3MuVlExLeykRQz5KyGNMCqz3g6XRSsNIYz6W7jw==
X-Google-Smtp-Source: ABdhPJwzoLFR9z8HNK5pzU4oY+7wvNKHChCFGqd02dOz+YXO9SlTW3G5S1oQ+8o+MJRmqkCSV39qF4IgIMYRc38PULI=
X-Received: by 2002:a17:907:7291:: with SMTP id dt17mr5204181ejc.526.1614178516794;
 Wed, 24 Feb 2021 06:55:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
 <20210222224325.GB177866@roeck-us.net>
In-Reply-To: <20210222224325.GB177866@roeck-us.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Wed, 24 Feb 2021 15:55:00 +0100
Message-ID: <CAH+2xPDDiUxKk3Y3R=fj0cOU+7vJRSC5yUb_XmfOUXnqoe+2Zg@mail.gmail.com>
Subject: Re: watchdog: pcf2127: systemd fails on 5.11
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Lars Alex Pedersen <laa@kamstrup.com>,
        Bruno Thomsen <bth@kamstrup.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den man. 22. feb. 2021 kl. 23.43 skrev Guenter Roeck <linux@roeck-us.net>:
>
> On Thu, Feb 18, 2021 at 01:35:36PM +0100, Bruno Thomsen wrote:
> > Hi,
> >
> > After updating the kernel from 5.8.17 to 5.11 systemd (246.6) is
> > unable to init watchdog in pcf2127 during boot. Kernel option
> > CONFIG_WATCHDOG_OPEN_TIMEOUT=300 is working as expected.
> > It's possible to get watchdog from userspace working in
> > the following 2 ways.
> > 1) Disable watchdog in systemd and use busybox watchdog.
> > 2) Restart systemd after boot with "kill 1".
> >
> > During boot setting the system clock from RTC is working.
> > RTC read/write from userland with hwclock is also working.
> >
> > DTS: imx7d-flex-concentrator-mfg.dts
> > SOC: NXP i.MX7D
> > Drivers: rtc-pcf2127, spi-imx
> > Communication: SPI
> >
> > There are no patches applied to the kernel.
> >
> > When systemd changes watchdog timeout it receives an
> > error that to our best knowledge comes from spi-imx[1].
> >
> > We suspect it's a race condition between drivers or
> > incompatible error handling.
> >
> > Any help in investigating the issue is appreciated.
> >
> Difficult to say without access to hardware. The code does have a
> potential problem, though: It calls pcf2127_wdt_ping not only from
> watchdog code but also from various rtc related functions, but there
> is not access protection. This is even more concerning because the ping
> function is called from an interrupt handler.  At the same time, the
> watchdog initialization sets min_hw_heartbeat_ms to 500, which suggests
> that there may be a minimum time between heartbeats (which is clearly
> violated by the current code).

Hi Guenter

Thanks for input.

You could be right about that, I don't think the watchdog feature should
be available for use if the alarm feature is enabled due to how CTRL2
register behaves.

The hardware I am testing on is a custom board, but it's actually
possible to get a Raspberry Pi module called RasClock that has
the chip.

I will test some locking around WD_VAL register access as that is used
in pcf2127_wdt_ping function.

My initial test shows that spin_lock_irqsave around regmap calls are not
a good idea as it result in:
BUG: scheduling while atomic: watchdog/70/0x00000002
BUG: scheduling while atomic: systemd/1/0x00000002

/Bruno
