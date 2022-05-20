Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F9E52E731
	for <lists+linux-rtc@lfdr.de>; Fri, 20 May 2022 10:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245043AbiETIW0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 20 May 2022 04:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232820AbiETIWZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 20 May 2022 04:22:25 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363ED14041B
        for <linux-rtc@vger.kernel.org>; Fri, 20 May 2022 01:22:24 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 100131C0011;
        Fri, 20 May 2022 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1653034942;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=9r44gCPTxmjMUI+mElEq+xtNkHDH/Mgr0gPK+4Yyz5E=;
        b=KwwF1rHrBUFh4a5gK0Ev3G7i8nXykbWC4CBJA1TMvkYFYIQc2DRAm2ff3ox0cVsP3gBJzC
        EvXscWfoWYcxGZCbPn/cXEAos/miCPwN45hc9pgUxjrXka/IHKT2GzDnw/oWZBEY1Rl8j5
        wczdq0lykIPtpglAAaKHI4Hf1B4cqZAiL5FGnF6tcymaRU5HYu0YchBRLUhWns6m6w51GI
        52+ankxC3Rl/wM1YqH/izDsYxJXpnqiHwf8zv59LaNA1BTDEtVaOW6EKFtt+hsqGvUyHGC
        CA2+1q8oyfgRSKducVsD13013ISobNjcJ6BfHsc5pK2D3FqFbDALFS/fURyv9Q==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Tom Rix <trix@redhat.com>,
        Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH v2] rtc: rzn1: Avoid mixing variables
Date:   Fri, 20 May 2022 10:22:21 +0200
Message-Id: <20220520082221.488849-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the ->set_offset() callback, the 'val' variable is used for two
different purposes at the same time, which is oviously wrong:
- It contains the intermediate value of the SUBU register that must be
  written at the end of ->set_offset().
- It is used in the middle of the above calculations to poll the CTL2
  register for a specific value.

Let's introduce a 'ctl2' variable just for the readl_poll_timeout()
call and use it there in place of 'var'.

In order to avoid mixing those two variables again, let's rename the
remaining occurences of 'val' into 'subu' and initialize it to 0 to
avoid the uninitialized variable situation reported by Tom Rix and Colin
Ian King already.

Fixes: be4a11cf98af ("rtc: rzn1: Add oscillator offset support")
Reported-by: Tom Rix <trix@redhat.com>
Reported-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Add a real Fixes: tag.

 drivers/rtc/rtc-rzn1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 980ade8c9601..bdd4ebd5c887 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -272,7 +272,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	unsigned int steps;
 	int stepsh, stepsl;
-	u32 val;
+	u32 subu = 0, ctl2;
 	int ret;
 
 	/*
@@ -288,7 +288,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	if (stepsh >= -0x3E && stepsh <= 0x3E) {
 		/* 1017 ppb per step */
 		steps = stepsh;
-		val |= RZN1_RTC_SUBU_DEV;
+		subu |= RZN1_RTC_SUBU_DEV;
 	} else if (stepsl >= -0x3E && stepsl <= 0x3E) {
 		/* 3051 ppb per step */
 		steps = stepsl;
@@ -300,18 +300,18 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 		return 0;
 
 	if (steps > 0) {
-		val |= steps + 1;
+		subu |= steps + 1;
 	} else {
-		val |= RZN1_RTC_SUBU_DECR;
-		val |= (~(-steps - 1)) & 0x3F;
+		subu |= RZN1_RTC_SUBU_DECR;
+		subu |= (~(-steps - 1)) & 0x3F;
 	}
 
-	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, val,
-				 !(val & RZN1_RTC_CTL2_WUST), 100, 2000000);
+	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL2, ctl2,
+				 !(ctl2 & RZN1_RTC_CTL2_WUST), 100, 2000000);
 	if (ret)
 		return ret;
 
-	writel(val, rtc->base + RZN1_RTC_SUBU);
+	writel(subu, rtc->base + RZN1_RTC_SUBU);
 
 	return 0;
 }
-- 
2.34.1

