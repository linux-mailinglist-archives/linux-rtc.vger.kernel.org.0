Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC159D591
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Aug 2019 20:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732482AbfHZSNx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Aug 2019 14:13:53 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41566 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731907AbfHZSNx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Aug 2019 14:13:53 -0400
Received: by mail-ed1-f68.google.com with SMTP id w5so27694317edl.8;
        Mon, 26 Aug 2019 11:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LkBa3xlPOxOIGFlL1z8V5TVoSldQC5MdlkD84cfKRv8=;
        b=tHtspKsJDGE101W9EwqaVw0RgyBItM+nuQ0t4HmFQxw8OOnTGWImttNiNv8SFEded0
         euMRRkgZfC6mLuNlT/9iBPDDCsrvMQRx6qLvSmCo3mqRpNXnzs1owfAUkCA0ufyldWzk
         a1vT7AJxa/lJFTDDZgGrNtxKfMEFCd0hc6Ey/0EvQKJetmZGByWPnf3nCrjkPZwtdQzJ
         2u4MaQUsrRM+/yYqGgNO44TpoKI57WUyZxletgfGyw6jPTWLk4o122qcSOGoe3J0hC2j
         Yo/DICe8ZKzPGUT1WkkyBuDUxnExLklDPdp6YlQler4ppFFb1gkE5TChtinAvj7OsX1F
         T1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LkBa3xlPOxOIGFlL1z8V5TVoSldQC5MdlkD84cfKRv8=;
        b=romdlgEE06Xe3gnt0aFqWnmPYyyYDsl5S6ZzZpkA6oltODiHl9aDxgnzAdEk2MCS04
         GGxfFQw/KFlOqxfRkDNPMBxyFktsiQCqzwsAQTpLF8sIuQSJJu+drOR9zbkkxQ2fntcD
         LSDMlncNAYB2/T2XYiUAWsA1bKVBUBK+LOPA9bhI0FENcXb1YOxkxeY04Gb578jkZL1z
         iGZ6AX0ODGTjiMnXNaVrY4JaXXtw5D8cJOElwBZ9cYRUhMcpUUGjre10P/vj1YNGsP0q
         boPna9724wpgdV5EYjjIY1q9Z2cTHfCIRm7+JQj9VEPuAaftt96zE+WERdeqDkt4Dj+H
         Axwg==
X-Gm-Message-State: APjAAAVKmYkw1FkuxE/z3pVserg57DkCUqyYN0zQGXyq6SYJbl1eGYT1
        Eddah+bH50bTTLfaEntFtRAne5PjGWTjUNR0Nt8W/qyvSI0=
X-Google-Smtp-Source: APXvYqyGAYp7Wc3WxOchrO2+Oxu8D11zxo36a83fsqpzYs2gbTmJmVVNOIKcNizLEW9OYby9yLqiVsld2qi68kngN+g=
X-Received: by 2002:a50:9401:: with SMTP id p1mr19812028eda.189.1566843231777;
 Mon, 26 Aug 2019 11:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190823124553.19364-1-yuehaibing@huawei.com> <20190823140513.GB9844@piout.net>
 <4b608c55-2541-30cf-ad88-c19a5c0cc84f@huawei.com> <01a2b6b2-eb15-1b40-1edc-de122bbdb5a2@roeck-us.net>
In-Reply-To: <01a2b6b2-eb15-1b40-1edc-de122bbdb5a2@roeck-us.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Mon, 26 Aug 2019 20:13:35 +0200
Message-ID: <CAH+2xPDw3ZWcH_g=Ui6u4Bzw2ii3EBnwGT0QuBseu1z+FgS9LA@mail.gmail.com>
Subject: Re: [PATCH -next] rtc: pcf2127: Fix build error without CONFIG_WATCHDOG_CORE
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Yuehaibing <yuehaibing@huawei.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Den man. 26. aug. 2019 kl. 15.20 skrev Guenter Roeck <linux@roeck-us.net>:
>
> On 8/26/19 1:12 AM, Yuehaibing wrote:
> >
> >
> > On 2019/8/23 22:05, Alexandre Belloni wrote:
> >> On 23/08/2019 20:45:53+0800, YueHaibing wrote:
> >>> If WATCHDOG_CORE is not set, build fails:
> >>>
> >>> drivers/rtc/rtc-pcf2127.o: In function `pcf2127_probe.isra.6':
> >>> drivers/rtc/rtc-pcf2127.c:478: undefined reference to `devm_watchdog_register_device'
> >>>
> >>> Add WATCHDOG_CORE Kconfig dependency to fix this.
> >>>
> >>> Reported-by: Hulk Robot <hulkci@huawei.com>
> >>> Fixes: bbc597561ce1 ("rtc: pcf2127: add watchdog feature support")
> >>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >>> ---
> >>>   drivers/rtc/Kconfig | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> >>> index 25af63d..9dce7dc 100644
> >>> --- a/drivers/rtc/Kconfig
> >>> +++ b/drivers/rtc/Kconfig
> >>> @@ -886,6 +886,8 @@ config RTC_DRV_DS3232_HWMON
> >>>   config RTC_DRV_PCF2127
> >>>     tristate "NXP PCF2127"
> >>>     depends on RTC_I2C_AND_SPI
> >>> +   depends on WATCHDOG
> >>
> >> Definitively not, I fixed it that way:
> >> +       select WATCHDOG_CORE if WATCHDOG
> >
> >
> > No, this still fails while WATCHDOG is not set
> >
>
> Correct, there are no dummy functions for watchdog device registration.
> There would have to be conditional code in the driver if the watchdog
> is supposed to be optional.

Hi

During review of version 1, there was a wish for the watchdog feature not
to be hidden behind Kconfig option, e.g. RTC_DRV_PCF2127_WDT, as
it would not result in a much bigger driver.

I did not add any other selects/depends on in Kconfig as
RTC_DRV_DS1374_WDT and RTC_DRV_M41T80_WDT options
does not select WATCHDOG_CORE and/or WATCHDOG either.
DS1374 and M41T80 does not seem to check on any other
WATCHDOG defines other then their _WDT Kconfig.

I can create a patch that hides the watchdog code if WATCHDOG
define is not set, if that's the right way?

Bruno
