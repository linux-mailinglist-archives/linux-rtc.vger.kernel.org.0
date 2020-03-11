Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D281820AB
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2020 19:23:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730825AbgCKSXh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Mar 2020 14:23:37 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:51338 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgCKSXh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 Mar 2020 14:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1583951009; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HedkotdwExnCiP3Lr9PeZYhG24zuOtsxcsR412zcJOw=;
        b=PLZRm9T+OZ0IEG7B6UdH4XL6+T4o2FoVxy++YD22lE2CoupxyRkkKKksdKhaAriOVyb0JV
        1Qtnm3CifPW8RTLxH3mdxBwkvHRmWnNPH1e5cOQcpBF2z8zKoTxClc20lgE8vvLmg7SkdE
        gsLjNUBFqOZe82AINeoPIC65fh0C9Zc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 2/3] rtc: jz4740: Rename vendor-specific DT properties
Date:   Wed, 11 Mar 2020 19:23:17 +0100
Message-Id: <20200311182318.22154-2-paul@crapouillou.net>
In-Reply-To: <20200311182318.22154-1-paul@crapouillou.net>
References: <20200311182318.22154-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

These properties are never set anywhere within any of the upstream
devicetree files, so I assume I'm not breaking the ABI with this change.

Rename vendor-specific DT properties to have the 'ingenic,' prefix,
which they should have had from the start.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index d764cd525c9a..e4c719085c31 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -374,13 +374,14 @@ static int jz4740_rtc_probe(struct platform_device *pdev)
 		if (!pm_power_off) {
 			/* Default: 60ms */
 			rtc->reset_pin_assert_time = 60;
-			of_property_read_u32(np, "reset-pin-assert-time-ms",
+			of_property_read_u32(np,
+					     "ingenic,reset-pin-assert-time-ms",
 					     &rtc->reset_pin_assert_time);
 
 			/* Default: 100ms */
 			rtc->min_wakeup_pin_assert_time = 100;
 			of_property_read_u32(np,
-					     "min-wakeup-pin-assert-time-ms",
+					     "ingenic,min-wakeup-pin-assert-time-ms",
 					     &rtc->min_wakeup_pin_assert_time);
 
 			dev_for_power_off = &pdev->dev;
-- 
2.25.1

