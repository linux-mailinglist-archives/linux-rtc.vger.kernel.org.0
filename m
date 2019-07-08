Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD34C625DB
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jul 2019 18:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbfGHQLA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 8 Jul 2019 12:11:00 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37494 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbfGHQK7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 8 Jul 2019 12:10:59 -0400
Received: by mail-qt1-f194.google.com with SMTP id y26so6001453qto.4;
        Mon, 08 Jul 2019 09:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jh0oOry33evDCob3/YqLaYbNG4TIUCz5wsbv0do5P2w=;
        b=o7CzYH5vJ2cQkP1HRxkor1wrQwSukCQqGhU/EkdhIe0lrOesO0rhMYJH4uQsLIH95B
         2aonHfEVFYfzk3B+uAmksG1dOvsumq03tor8c5NWfIZSdQ0E2xtwRcheC+E5+509MbZF
         HG6c626n6aE7vDXYZxviTOyDVXz1OEWk3b6RUWxvwdG/ttRrGM2H7g2omCoT+Dq7bUpE
         dCbHanAqYHNp55UJ/iYuAqAv18/0RGBtsaG0J6TxDj1HmGGejSbWo55+XNbLIX/KSBge
         DFKM95ehtupl8fQAp+4aHPISOMWBP5j0Q/Hruzem81ZgLeeKu27RuvH1ePPZ6Goefdf7
         61CA==
X-Gm-Message-State: APjAAAWPiNxTUmaanWZbQei3UmMWyGP16IOeWk62QlZJKgxj6L9ANQCs
        qyLmLuyK/klE/IkPxFjS1iRjxKuoQhajBJWyJoc=
X-Google-Smtp-Source: APXvYqyUVlqAlYEFg1FiYPVuvS6vybH5FVE/+B+9DSKZt9RHUYdBNACismBwlh/kyryGPOKmOUdWAvsI1rvyHn+Ipoc=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr14543108qtn.304.1562602258765;
 Mon, 08 Jul 2019 09:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190708124227.3422311-1-arnd@arndb.de> <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
In-Reply-To: <e752a638c0bde6893adf805322f73de5bd459dbc.camel@fi.rohmeurope.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 8 Jul 2019 18:10:42 +0200
Message-ID: <CAK8P3a1HNnstePcreH-ZLyiJi3tNcCNJ=VozZUMnp-VLvYLSaA@mail.gmail.com>
Subject: Re: [PATCH] rtc: bd70528: fix link error
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 8, 2019 at 3:24 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:

> On Mon, 2019-07-08 at 14:41 +0200, Arnd Bergmann wrote:
> > With CONFIG_BD70528_WATCHDOG=m, a built-in rtc driver cannot call
> > into the low-level functions that are part of the watchdog module:
> >
> > drivers/rtc/rtc-bd70528.o: In function `bd70528_set_time':
> > rtc-bd70528.c:(.text+0x22c): undefined reference to
> > `bd70528_wdt_lock'
> > rtc-bd70528.c:(.text+0x2a8): undefined reference to
> > `bd70528_wdt_unlock'
> > drivers/rtc/rtc-bd70528.o: In function
> > `bd70528_set_rtc_based_timers':
> > rtc-bd70528.c:(.text+0x50c): undefined reference to `bd70528_wdt_set'
> >
> > Add a Kconfig dependency on this driver, but still allow compile-
> > testing
> > without it.
> >
> > Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528
> > RTC")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/rtc/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index 3bfc04a86529..7b071cc74422 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -498,8 +498,10 @@ config RTC_DRV_M41T80_WDT
> >       help
> >         If you say Y here you will get support for the
> >         watchdog timer in the ST M41T60 and M41T80 RTC chips series.
> > +
> >  config RTC_DRV_BD70528
> >       tristate "ROHM BD70528 PMIC RTC"
> > +     depends on BD70528_WATCHDOG || (COMPILE_TEST &&
> > !BD70528_WATCHDOG)
>
> I am not fan of this. There may well be use-cases where it is desirable
> to leave the watchdog out but still compile in the RTC. This is why we
> have static inline stubs in the header for cases where WDG is not
> compiled in. (RTC does not need to stop WDG if WDG driver is not
> included)
>
> Adding dependency from RTC to MFD for BD70528 should be done - this
> will avoid most of the issues (And there has been few patches sent for
> this already). But that's still not complete solution because
> configuring RTC and MFD to be built in-kernel and WDG as a module will
> cause errors again.
>
> Is there a way to force WDG in-kernel if RTC is in-kernel? (Or
> disallow configuring RTC in-kernel if WDG is a module - while still
> allow RTC to be built without WDG?

We could make this

        depends on BD70528_WATCHDOG || !BD70528_WATCHDOG

which would allow building with or without watchdog, even when not
compile-testing, but still disallow the combination of
BD70528_WATCHDOG=m with RTC_DRV_BD70528=y.

       Arnd
