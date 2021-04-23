Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD96368BC0
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Apr 2021 05:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235684AbhDWD7a (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Apr 2021 23:59:30 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:34736 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhDWD7a (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 22 Apr 2021 23:59:30 -0400
Received: by mail-lf1-f42.google.com with SMTP id t14so18308861lfe.1;
        Thu, 22 Apr 2021 20:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=0eV7WJ0ncRsT5nQfpmtxbVRtBKhtRlXZIoGCHBsMmKs=;
        b=sQD2rTdGVM04eTvGp7jPMv9pL1F5O40IbS5D7YCNBOher51Vt9/e5vV8H7hOw93p8p
         /3C0BcWFyi0M42qxVFjJ44Zr3XNepE2rm7Bj1eRq1CbMJ+XU9j/hN8Eazis5ChesBW/q
         8aoA6/B+1+5xQhw7xPjjSeL0xMGjs4oMuSpg1qc2HkFNZrnf+MCQILAuWxjsCZzWpobG
         oAtdR5HKV4rdpcNcfI47fWCvNHTuLOcvFulpVhRMfCpnt/X9m0b6UZSHde9TePD0uSQ9
         3gmNedmMjhkBMz8qy4EJ6999EylpOq7ltGDcdKScz/G5QLGtNe/m4qdX1TTT+Ivfe7Ix
         BTRA==
X-Gm-Message-State: AOAM530/aJBWe5AFozm9aR0ZtqYg1Cp6n9QZ9xSFWRg4qB5MEbt2OxVu
        7aRo+Waq8Mll/EytmGRr4ajdyTB3mdsZGA==
X-Google-Smtp-Source: ABdhPJyQO1ou7M62wnsOjoTfsf+Q+kNv5lLqfCoUxnrTISuuRHDQUetQLcCEJKoIp8HKmWhfgtlYJg==
X-Received: by 2002:a19:ca04:: with SMTP id a4mr1266892lfg.588.1619150332347;
        Thu, 22 Apr 2021 20:58:52 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id c3sm423744lfh.76.2021.04.22.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 20:58:52 -0700 (PDT)
Message-ID: <4615c817ee71164c7727d4c87033bb9e6d260745.camel@fi.rohmeurope.com>
Subject: Re: [PATCH] [v2] rtc: bd70528: fix BD71815 watchdog dependency
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Claudius Heine <ch@denx.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210422160819.GA104045@roeck-us.net>
References: <20210422151545.2403356-1-arnd@kernel.org>
         <20210422160819.GA104045@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Fri, 23 Apr 2021 06:58:45 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Arnd & Guenter,

On Thu, 2021-04-22 at 09:08 -0700, Guenter Roeck wrote:
> On Thu, Apr 22, 2021 at 05:15:21PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The added Kconfig dependency is slightly incorrect, which can
> > lead to a link failure when the watchdog is a loadable module:
> > 
> > arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function
> > `bd70528_set_rtc_based_timers':
> > rtc-bd70528.c:(.text+0x6cc): undefined reference to
> > `bd70528_wdt_set'
> > arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function
> > `bd70528_set_time':
> > rtc-bd70528.c:(.text+0xaa0): undefined reference to
> > `bd70528_wdt_lock'
> > arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0xab8): undefined
> > reference to `bd70528_wdt_unlock'
> > arm-linux-gnueabi-ld: drivers/rtc/rtc-bd70528.o: in function
> > `bd70528_alm_enable':
> > rtc-bd70528.c:(.text+0xfc0): undefined reference to
> > `bd70528_wdt_lock'
> > arm-linux-gnueabi-ld: rtc-bd70528.c:(.text+0x1030): undefined
> > reference to `bd70528_wdt_unlock'
> > 
> > The problem is that it allows to be built-in if MFD_ROHM_BD71828
> > is built-in, even when the watchdog is a loadable module.

Right. I overlooked this as the WDG is not present in BD71828 HW. But
you are correct, it does not mean it can't be configured in on system
with BD71828. (I think Guenter pointed this to me also earlier when I
thought the WDG should not be allowed to be configured in on system
with BD71828). Sorry for the trouble.

> > 
> > Rework this so that having the watchdog as a loadable module always
> > forces the rtc to be a module as well instead of built-in,
> > regardless of bd71828.

This sounds like the right thing to do. Thanks a lot for both of you!

> > 
> > Fixes: c56dc069f268 ("rtc: bd70528: Support RTC on ROHM BD71815")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

> 
> > ---
> > v2: Fix as suggested by Guenter Roeck, reword description
> > ---
> >  drivers/rtc/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > index d8c13fded164..914497abeef9 100644
> > --- a/drivers/rtc/Kconfig
> > +++ b/drivers/rtc/Kconfig
> > @@ -502,7 +502,8 @@ config RTC_DRV_M41T80_WDT
> >  
> >  config RTC_DRV_BD70528
> >  	tristate "ROHM BD70528, BD71815 and BD71828 PMIC RTC"
> > -	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528 &&
> > (BD70528_WATCHDOG || !BD70528_WATCHDOG)
> > +	depends on MFD_ROHM_BD71828 || MFD_ROHM_BD70528
> > +	depends on BD70528_WATCHDOG || !BD70528_WATCHDOG
> >  	help
> >  	  If you say Y here you will get support for the RTC
> >  	  block on ROHM BD70528, BD71815 and BD71828 Power Management
> > IC.
> > -- 
> > 2.29.2
> > 


