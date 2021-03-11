Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01808336E5B
	for <lists+linux-rtc@lfdr.de>; Thu, 11 Mar 2021 09:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhCKI6T (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Mar 2021 03:58:19 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44041 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhCKI57 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Mar 2021 03:57:59 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 552F91BF21D;
        Thu, 11 Mar 2021 08:57:57 +0000 (UTC)
Date:   Thu, 11 Mar 2021 09:57:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Corentin Labbe <clabbe.montjoie@gmail.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: rtc: rtc-m48t59: rtc-m48t59.0: IRQ index 0 not found
Message-ID: <YEnblWV1VWJJHtyv@piout.net>
References: <YEiXHjIrXfjkrv5U@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEiXHjIrXfjkrv5U@Red>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 10/03/2021 10:53:34+0100, Corentin Labbe wrote:
> Hello
> 
> On my SPARC sunblade 100, I got this:
> [   13.613727] rtc-m48t59 rtc-m48t59.0: IRQ index 0 not found
> [   13.805777] rtc-m48t59 rtc-m48t59.0: registered as rtc0
> [   14.385092] rtc-m48t59 rtc-m48t59.0: setting system clock to 2021-03-01T05:34:33 UTC (1614576873)
> 
> The IRQ index 0 message is found after 5.5
> 
> Testing rtc via hwclock give:
> hwclock: ioctl(3, RTC_UIE_ON, 0) to /dev/rtc0 failed: Input/output error
> But this hwclock behavior is present also on earlier kernel (tested 4.9.260, 4.19.179 and 4.14.224).
> 
> Does this Input/output error is normal ? (I think no)

This is due to 7723f4c5ecdb8d832f049f8483beb0d1081cedf6

Can you try that?

From 55cc33fab5ac9f7e2a97aa7c564e8b35355886d5 Mon Sep 17 00:00:00 2001
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 11 Mar 2021 09:48:09 +0100
Subject: [PATCH] rtc: m48t59: use platform_get_irq_optional

The IRQ is optional, avoid the error message by using
platform_get_irq_optional.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m48t59.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index 1d2e99a70fce..f0f6b9b6daec 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -421,7 +421,7 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	/* Try to get irq number. We also can work in
 	 * the mode without IRQ.
 	 */
-	m48t59->irq = platform_get_irq(pdev, 0);
+	m48t59->irq = platform_get_irq_optional(pdev, 0);
 	if (m48t59->irq <= 0)
 		m48t59->irq = NO_IRQ;
 
-- 
2.29.2

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
