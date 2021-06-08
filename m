Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC33239F67E
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Jun 2021 14:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhFHM0y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Jun 2021 08:26:54 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33839 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhFHM0y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Jun 2021 08:26:54 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1E7A0E000D;
        Tue,  8 Jun 2021 12:24:59 +0000 (UTC)
Date:   Tue, 8 Jun 2021 14:24:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     kernel test robot <lkp@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: pcf8523: rename REG_OFFSET register
Message-ID: <YL9hmwsdfX96ZABp@piout.net>
References: <20210606162423.22235-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606162423.22235-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/06/2021 09:24:23-0700, Randy Dunlap wrote:
> REG_OFFSET is defined both here and in arch/arm/mach-ixp4xx/, which
> causes a build warning, so rename this macro in the RTC driver.
> 
> ../drivers/rtc/rtc-pcf8523.c:44: warning: "REG_OFFSET" redefined
>    44 | #define REG_OFFSET   0x0e
> 
> ../arch/arm/mach-ixp4xx/include/mach/platform.h:25: note: this is the location of the previous definition
>    25 | #define REG_OFFSET 3
> 
> Fixes: bc3bee025272 ("rtc: pcf8523: add support for trimming the RTC oscillator")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> ---
>  drivers/rtc/rtc-pcf8523.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- linux-next-20210604.orig/drivers/rtc/rtc-pcf8523.c
> +++ linux-next-20210604/drivers/rtc/rtc-pcf8523.c
> @@ -41,7 +41,7 @@
>  #define REG_WEEKDAY_ALARM	0x0d
>  #define ALARM_DIS BIT(7)
>  
> -#define REG_OFFSET   0x0e
> +#define REG_OFFSET_TUNE   0x0e /* offset register is used for tuning */

All the other defines are using the names from the datasheet, probably
ixp4xx should be fixed instead?


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
