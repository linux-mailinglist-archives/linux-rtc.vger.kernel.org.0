Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C84A09D5F9
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 20:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbfHZSqZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 14:46:25 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41902 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfHZSqZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Aug 2019 14:46:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so11129915pgg.8;
        Mon, 26 Aug 2019 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/6h3pVn0Q7rW+oRgZfpi1qEbYbkTX7W5Kewm+Qyfumw=;
        b=AeTxTVZ62rRO8X3V6FctFGEAySquHBvu1vt4AzP5iJ4UFcE8xRlgNj8PpfMsoTgswX
         FHg229JAhwsvhyADqTB7tYYUXkSEOMni+ybhqQGf2d2OG/6b/ILfF6iMrHMqaU3LI4m7
         eym2zV+Ax1tk7vLrp+KFIQIlDBxYfdWWOJ/wy4PMqSjoSXRtLm/ozS6zq6Z3xOOKevMy
         SxYW6U80JSQiHOv0KurdN3EOg+k0aKZZRl5pQWZYTLpPwPJk7Kl9AtJ3v8QisxqxuRK7
         2+b25vcptpoDAsJlnOHAbfdnEVQi8g3FtiP+TleAgnf1lZ4RoF3CaMzgwjW3pf65l/HJ
         7Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=/6h3pVn0Q7rW+oRgZfpi1qEbYbkTX7W5Kewm+Qyfumw=;
        b=qLp3Ote21aZte+KNF6PjTlvFWjUDToydxNAvaUuqtjBEKgMVBhw+a2s/KzBfAbRHOB
         b/s4zg4decAariUzLzmji8UtpsZbxgal4kfboGDkphU84WltMEakdMPFOvZ4de9sR9yx
         WJgVQ5QLvNUlJad4hqxejJN3m89lzdelW81UmjV7CVMtg6Y4Ljoii6Uv8O9kDqr880aL
         mognXPvPJDRJcmZurcFG1CbpS2IoEcsLHwiLZdlR6Zld6YRTie0nCrGekBEpgpNtIs99
         BvtpVyI1Z9BjsPjy2K3zmd544kifK5mlSMXxQvhxyJ8+IpJwmJxPjYZn9VVzO+AysQhC
         ldeQ==
X-Gm-Message-State: APjAAAW8Es4uZBlAEtfmVBO0aJorFFmimXvSmZrlnJQ8lScN6qM8e/6f
        CvIfcCz6JB7TBf4lXLj2ZnM=
X-Google-Smtp-Source: APXvYqx4xVStJ6UDhAdc84ocj+lkuY4bLCG22gzHZVdSGsdeB8tzLodPzcaMTD8v148+0jEI8oIePQ==
X-Received: by 2002:a62:1cd1:: with SMTP id c200mr5417663pfc.174.1566845184715;
        Mon, 26 Aug 2019 11:46:24 -0700 (PDT)
Received: from localhost (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id 14sm12264699pfy.40.2019.08.26.11.46.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 11:46:23 -0700 (PDT)
Date:   Mon, 26 Aug 2019 11:46:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Yuehaibing <yuehaibing@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without
 CONFIG_WATCHDOG_CORE
Message-ID: <20190826184622.GA7766@roeck-us.net>
References: <20190823124553.19364-1-yuehaibing@huawei.com>
 <20190823140513.GB9844@piout.net>
 <4b608c55-2541-30cf-ad88-c19a5c0cc84f@huawei.com>
 <01a2b6b2-eb15-1b40-1edc-de122bbdb5a2@roeck-us.net>
 <CAH+2xPDw3ZWcH_g=Ui6u4Bzw2ii3EBnwGT0QuBseu1z+FgS9LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH+2xPDw3ZWcH_g=Ui6u4Bzw2ii3EBnwGT0QuBseu1z+FgS9LA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Aug 26, 2019 at 08:13:35PM +0200, Bruno Thomsen wrote:
> Den man. 26. aug. 2019 kl. 15.20 skrev Guenter Roeck <linux@roeck-us.net>:
> >
> > On 8/26/19 1:12 AM, Yuehaibing wrote:
> > >
> > >
> > > On 2019/8/23 22:05, Alexandre Belloni wrote:
> > >> On 23/08/2019 20:45:53+0800, YueHaibing wrote:
> > >>> If WATCHDOG_CORE is not set, build fails:
> > >>>
> > >>> drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
> > >>> drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'
> > >>>
> > >>> Add WATCHDOG_CORE Kconfig dependency to fix this.
> > >>>
> > >>> Reported-by: Hulk Robot <hulkci@huawei.com>
> > >>> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
> > >>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > >>> ---
> > >>>   drivers/rtc/Kconfig | 2 ++
> > >>>   1 file changed, 2 insertions(+)
> > >>>
> > >>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > >>> index 25af63d..9dce7dc 100644
> > >>> --- a/drivers/rtc/Kconfig
> > >>> +++ b/drivers/rtc/Kconfig
> > >>> @@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
> > >>>   config RTC_DRV_PCF2127
> > >>>     tristate "NXP PCF2127"
> > >>>     depends on RTC_I2C_AND_SPI
> > >>> +   depends on WATCHDOG
> > >>
> > >> Definitively not, I fixed it that way:
> > >> +       select WATCHDOG_CORE if WATCHDOG
> > >
> > >
> > > No, this still fails while WATCHDOG is not set
> > >
> >
> > Correct, there are no dummy functions for watchdog device registration.
> > There would have to be conditional code in the driver if the watchdog
> > is supposed to be optional.
> 
> Hi
> 
> During review of version 1, there was a wish for the watchdog feature not
> to be hidden behind Kconfig option, e.g. RTC_DRV_PCF2127_WDT, as
> it would not result in a much bigger driver.
> 
> I did not add any other selects/depends on in Kconfig as
> RTC_DRV_DS1374_WDT and RTC_DRV_M41T80_WDT options
> does not select WATCHDOG_CORE and/or WATCHDOG either.

Those drivers do not use the watchdog core but re-implement its
functionality. RTC_DRV_M41T80_WDT was written before the watchdog
core existed, so this is understandable. You would have to ask the
author of RTC_DRV_DS1374_WDT support why it doesn't use the
watchdog core but re-implements it.

> DS1374 and M41T80 does not seem to check on any other
> WATCHDOG defines other then their _WDT Kconfig.
> 
> I can create a patch that hides the watchdog code if WATCHDOG
> define is not set, if that's the right way?
> 

That is for you and the rtc maintainer to decide.

Guenter
