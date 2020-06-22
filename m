Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B71B203938
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 16:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgFVO1A (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 10:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729597AbgFVO06 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jun 2020 10:26:58 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103F5C061573;
        Mon, 22 Jun 2020 07:26:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g12so7640861pll.10;
        Mon, 22 Jun 2020 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/r3bF+tmpPN3A1FZstc/snO04L2kX1d7AjII16N9G5g=;
        b=PrIZIlI/Yn3nD9hrNjJvDv6BZi1oqSPTzzIn1XSzVZ9JM58DJOi17YI9tnWo1jhuPn
         dtz7cS/d0w9A96WXjA3jXAA7QPRW5x2naSUfMTgrE7CIeT8FQxACPlpM+6FkGkSi8RaF
         Hk9afPxXO8sIK7jNgxoqcdBRoj4UJHlhY5Qea4M+CJ2sJ2hZALL6qvRGmL/EoKjLDkhD
         YSh1fI/hfsLVsr7mZC6tFEVnii5LngEbIhRddXsW9dUf6WIYVRgAq43NNcPjNfMWD7jv
         W+0tCvO31i/IWJpeVvuPFYaWRY7I9Goo1QAl7R4hgrVPo2DTMRNzMHLPSFkfnO3KdiRu
         YjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=/r3bF+tmpPN3A1FZstc/snO04L2kX1d7AjII16N9G5g=;
        b=Mpv0OfNeLFKbgvXegg8uLIWf0aMFQw1hHtnCU+0G8EZKIHPgCc2pQppQkni7fHR84C
         /WomI7IMrBAWe7KgxSm0/O3KtDq/Ph7IyymA/iscUr+p9nMD08l3Rv3fnivkX+J9ZGm9
         wve1vMOm3bU4453A89YnTHnRNzDLtnBLFjcMP11z718o8wl7PvXw0DTsn5Rywdu/9Grf
         2/ZR+Sekm7NiluUaTRysQou7BUdWNeC/WiZN4MriykKbatVkwrlZCBv5YtuB4Be0A5KW
         Rm/Uewx0M2369OarPn7i9SVdJFzkwk1G7ycA8nPMpOdY+4p7nBi9ONxaAOsE4wCZL8kY
         1Icg==
X-Gm-Message-State: AOAM531HYKA5b2w3U4aIffO35xbsmB5yQ4Rbproros8RlCEa1ji/gs/q
        34VKbGk0tFPh4oXSxb1H588=
X-Google-Smtp-Source: ABdhPJyTZ+rZ5KBtsK2Zn1v8LHaQ2xA/L+YW2HNOMvVeRR0Ydc7Qe5SRfTI0SX3tSTY5RN5Vypw0YQ==
X-Received: by 2002:a17:90a:1e:: with SMTP id 30mr17329730pja.25.1592836017574;
        Mon, 22 Jun 2020 07:26:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h3sm14965860pje.28.2020.06.22.07.26.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 07:26:57 -0700 (PDT)
Date:   Mon, 22 Jun 2020 07:26:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
 driver
Message-ID: <20200622142656.GA102380@roeck-us.net>
References: <HK2PR01MB328111AB2520315A7D4A1172FA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200622111413.GV954398@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200622111413.GV954398@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jun 22, 2020 at 12:14:13PM +0100, Lee Jones wrote:
> On Mon, 22 Jun 2020, Johnson CH Chen (陳昭勳) wrote:
> 
> > Dallas/Maxim DS1374 is a counter designed to continuously count
> > time in seconds. It provides an I2C interface to the host to
> > access RTC clock or Alarm/Watchdog timer.
> > 
> > Add MFD Core driver, supporting the I2C communication to RTC and
> > Watchdog devices.
> > 
> > Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> > ---
> >  drivers/mfd/Kconfig  |  11 +++++
> >  drivers/mfd/Makefile |   2 +
> >  drivers/mfd/ds1374.c | 101 +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 114 insertions(+)
> >  create mode 100644 drivers/mfd/ds1374.c
> 
> Not sure I see the point of this driver.
> 

Not entirely sure either. Seems to me the idea is to use the watchdog
subsystem for watchdog functionality, but that is just a guess and not
really necessary (the conversion could be done in the rtc driver).
I don't think the code as written works - the rtc code uses a mutex
which the watchdog driver obviously isn't aware of. The mutex would
have to be moved into the mfd code, with respective access functions.

Overall this adds a lot of complexity, and it seems the interdependencies
between rtc and watchdog functionality are not well understood. Plus,
other watchdog drivers have recently been added to other rtc clock chips,
so this adds some inconsistencies in the rtc subsystem. Are we going
to see this change for all those combined rtc/watchdog drivers ?
If so, it might make sense to communicate that now to ensure consistency.

Guenter

> How/where is the device part registered?
> 
> Is it DT only?  If not, what else?
> 
> Also where are the bindings?
> 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 687e9c848053w.d16031f4b487 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1980,6 +1980,17 @@ config MFD_STM32_LPTIMER
> >  	  To compile this driver as a module, choose M here: the
> >  	  module will be called stm32-lptimer.
> >  
> > +config MFD_DS1374
> > +	tristate "Support for Dallas/Maxim DS1374"
> > +	depends on I2C
> > +	select MFD_CORE
> > +	help
> > +	  Say yes here to add support for Dallas/Maxim DS1374 Semiconductor.
> > +	  This driver provides RTC and watchdog.
> > +
> > +	  This driver can also be built as a module. If so, module will be
> > +	  called ds1374.
> > +
> >  config MFD_STM32_TIMERS
> >  	tristate "Support for STM32 Timers"
> >  	depends on (ARCH_STM32 && OF) || COMPILE_TEST
> 
> -- 
> Lee Jones [李琼斯]
> Senior Technical Lead - Developer Services
> Linaro.org │ Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog
