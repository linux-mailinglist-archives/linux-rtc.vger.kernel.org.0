Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A749F6157D
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jul 2019 18:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfGGQMx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jul 2019 12:12:53 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38312 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfGGQMx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jul 2019 12:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jvyCMugQL7/NuCl9ddtc+AaWc6qGniwih5Ctu0V8hBI=; b=eCFtECBYHWlRWoPtA9P77SABb
        /7U7M8KF58zEr277TT9PpO3nNbaGj1/FzhD6I1xVkeguQRJysSXhQPMLXfv4lDd/HPg8s+BFVSh1F
        dCdJxbzeBabpVNmubtmcpnEf1ND9fv8YkxMwlV3lGo5jBfVRJB3sJK4w+VxIyxMFUoA0r+oF+0lpd
        8pfqm0IXCcXYY27VTkmlCGQ3EuObJ65jtVKc7ZifLc8mQPDtBa9zS7YZys3BJKm2PHAsYFrx3EBRt
        nRE7OKZj3eEaroj7mQmEFEVodp31Eh3IcRw13mUHeJNUK4YLk4jJdk9DdaXdg7Y2VzF40xMtXdmAA
        81nqB2B2w==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hk9mU-0001Lj-8I; Sun, 07 Jul 2019 16:12:50 +0000
To:     LKML <linux-kernel@vger.kernel.org>, linux-rtc@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] rtc: bd70528: add dependency to fix build errors
Message-ID: <420b921d-10ca-1d9a-ac46-5969a7f0e0b9@infradead.org>
Date:   Sun, 7 Jul 2019 09:12:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when MFD_ROHM_BD70528=m, BD70528_WATCHDOG=m,
and RTC_DRV_BD70528=y.  Fixes these build errors:

ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_alm_enable':
rtc-bd70528.c:(.text+0x3a2): undefined reference to `bd70528_wdt_lock'
ld: rtc-bd70528.c:(.text+0x3f8): undefined reference to `bd70528_wdt_unlock'
ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_rtc_based_timers':
rtc-bd70528.c:(.text+0x41c): undefined reference to `bd70528_wdt_set'
ld: drivers/rtc/rtc-bd70528.o: in function `bd70528_set_time':
rtc-bd70528.c:(.text+0x500): undefined reference to `bd70528_wdt_lock'
ld: rtc-bd70528.c:(.text+0x587): undefined reference to `bd70528_wdt_unlock'

Also add a blank line to separate the Kconfig entry from the one
above it.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: linux-rtc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
Found in mmotm but applies to linux-next.

 drivers/rtc/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- mmotm-2019-0706-2200.orig/drivers/rtc/Kconfig
+++ mmotm-2019-0706-2200/drivers/rtc/Kconfig
@@ -498,8 +498,10 @@ config RTC_DRV_M41T80_WDT
 	help
 	  If you say Y here you will get support for the
 	  watchdog timer in the ST M41T60 and M41T80 RTC chips series.
+
 config RTC_DRV_BD70528
 	tristate "ROHM BD70528 PMIC RTC"
+	depends on MFD_ROHM_BD70528
 	help
 	  If you say Y here you will get support for the RTC
 	  on ROHM BD70528 Power Management IC.


