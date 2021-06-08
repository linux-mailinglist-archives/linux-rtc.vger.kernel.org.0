Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB373A06F5
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jun 2021 00:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFHWiH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Jun 2021 18:38:07 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34765 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFHWiH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Jun 2021 18:38:07 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6D4861BF204;
        Tue,  8 Jun 2021 22:36:12 +0000 (UTC)
Date:   Wed, 9 Jun 2021 00:36:11 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8523: rename REG_OFFSET register
Message-ID: <YL/w2/l7eLj0/S2R@piout.net>
References: <20210606162423.22235-1-rdunlap@infradead.org>
 <YL9hmwsdfX96ZABp@piout.net>
 <e78253f6-88f8-7d9b-416c-c48e70785b41@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e78253f6-88f8-7d9b-416c-c48e70785b41@infradead.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/06/2021 10:07:47-0700, Randy Dunlap wrote:
> On 6/8/21 5:24 AM, Alexandre Belloni wrote:
> > On 06/06/2021 09:24:23-0700, Randy Dunlap wrote:
> >> REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
> >> causes a build warning, so rename this macro in the RTC driver.
> >>
> >> ../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
> >>    44 | #define REG_OFFSET   0x0e
> >>
> >> ../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the location of the previous definition
> >>    25 | #define REG_OFFSET 3
> >>
> >> Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC oscillator")
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> >> Cc: Alessandro Zummo <a.zummo@towertech.it>
> >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Cc: linux-rtc@vger.kernel.org
> >> ---
> >>  drivers/rtc/rtc-pcf8523.c |    6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> --- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
> >> +++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
> >> @@ -41,7 +41,7 @@
> >>  #define REG_WEEKDAY_ALARM	0x0d
> >>  #define ALARM_DIS BIT(7)
> >>  
> >> -#define REG_OFFSET   0x0e
> >> +#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */
> > 
> > All the other defines are using the names from the datasheet, probably
> > ixp4xx should be fixed instead?
> 
> That would be something like 25 changes in 14 files instead
> of 3 changes in one file.
> 

But REG_OFFSET from mach-ixp4xx/include/mach/platform.h is the one
leaking out. I think you can agree that rtc-pcf8523.c is self contained.

> But for both locations, names like REG_OFFSET are just too generic.
> They should be more specific so that name clashes won't happen.
> 

This name clash wouldn't happen if ixp4xx was converted to multiplatform
as this would prevent it from including random headers globally but
there hasn't been any significant move in that direction since February
2019. I know nslu2 is a popular platform but maybe at some point we should
consider simply dropping ixp4 support if it doesn't improve.

I remember that at the time I took the patch I though the REG_ prefix
was a bit generic but again, this is pretty self-contained in the
driver.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
