Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A312152D3D7
	for <lists+linux-rtc@lfdr.de>; Thu, 19 May 2022 15:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237974AbiESNXG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 May 2022 09:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235367AbiESNXF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 May 2022 09:23:05 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 227A76899A
        for <linux-rtc@vger.kernel.org>; Thu, 19 May 2022 06:23:03 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id B166C1BF203;
        Thu, 19 May 2022 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652966582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Z/bb61QBKrjsRjLxhOOKQger6DsEnFxrn/DYS4vl3pM=;
        b=OlsIjN6GaEk2Ol8mD0PaMJYNbfCk9/Vn61B9Z/ce8c8bZ9FVbXEmoNV5Ms1bHqSZpdDgTC
        waf9n7kEcGldSjafnkYlm8/oAKnMELE2VsSybvsRI4p74a5Bli025TkPIzgd8LGYGVtLP1
        yswcZZfixzR4clf/Z5d4CvNmiFATA68ClNdqpXD9L2y3TBBH+lBRsWZomxFYB/HG849E08
        hNT4l9r8kezv6FCEKNiHnLQ8W96P9D9aF+1X32YepgobJ6Vk2JOEOT3luirNP4xki/Hwzf
        A5mLNEwAwvBs7dbAnGef7CbStn6I965NTYTPrGk+DIpw4XUxEyZbJhX2d0XuaQ==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Tom Rix <trix@redhat.com>,
        Colin Ian King <colin.i.king@gmail.com>
Subject: [PATCH] rtc: rzn1: Avoid mixing variables
Date:   Thu, 19 May 2022 15:23:00 +0200
Message-Id: <20220519132300.424095-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

No real "Fixes:" applies here because the original patch has not yet
reached Linus' tree, but the offending commit is named:
"rtc: rzn1: Add oscillator offset support"

Reported-by: Tom Rix <trix@redhat.com>
Reported-by: Colin Ian King <colin.i.king@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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

