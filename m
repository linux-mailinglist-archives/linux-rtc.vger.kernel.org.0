Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA21B8A8DE
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 23:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfHLVCa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 17:02:30 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:36697 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfHLVC3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 17:02:29 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9CE6C20008;
        Mon, 12 Aug 2019 21:02:27 +0000 (UTC)
Date:   Mon, 12 Aug 2019 23:02:27 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>
Subject: Re: [PATCH] rtc: bd70528: fix driver dependencies
Message-ID: <20190812210227.GU3600@piout.net>
References: <84462e01e43d39024948a3bdd24087ff87dc2255.1565591387.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84462e01e43d39024948a3bdd24087ff87dc2255.1565591387.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 12/08/2019 09:36:11+0300, Matti Vaittinen wrote:
> With CONFIG_BD70528_WATCHDOG=m, a built-in rtc driver cannot call
> into the low-level functions that are part of the watchdog module:
> 
> drivers/rtc/rtc-bd70528.o: In function `bd70528_set_time':
> rtc-bd70528.c:(.text+0x22c): undefined reference to `bd70528_wdt_lock'
> rtc-bd70528.c:(.text+0x2a8): undefined reference to `bd70528_wdt_unlock'
> drivers/rtc/rtc-bd70528.o: In function `bd70528_set_rtc_based_timers':
> rtc-bd70528.c:(.text+0x50c): undefined reference to `bd70528_wdt_set'
> 
> Add a Kconfig dependency which forces RTC to be a module if watchdog is a
> module. If watchdog is not compiled at all the stub functions for watchdog
> control are used. compiling the RTC without watchdog is fine.
> 
> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  Issue was found by kbuildbot from linux-next. Issue was addressed by
>  Arnd and Randy - but those solutions disallowed compiling the RTC
>  without watchdog. This patch is a result of discussion with Arnd and it
>  was created on top of Linus' tree (tag v5.3-rc4).
>  drivers/rtc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
