Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1194352505C
	for <lists+linux-rtc@lfdr.de>; Thu, 12 May 2022 16:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355459AbiELOjk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 May 2022 10:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355453AbiELOjh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 May 2022 10:39:37 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E642E261972;
        Thu, 12 May 2022 07:39:33 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 4586A200012;
        Thu, 12 May 2022 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652366371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Aa5LvdpLvgqB9bJWjFNskoQwvcyOVkDYYmbCzOXgDQk=;
        b=PX4OTxjrnflVnyoM2vNia7eXFAnoEmPlxUh6VLzmcmJXxdRUGC8z14SmBXdgPCKWcXstN2
        4d/hYcTR4XWwU6kOOO+BH3p4NVonWH7tM+gyN4DTlb5l3Lcb0b8tVBnC/Bnbu6N+zH5PSg
        KVZ+LAhU66Gy5z3yc6dl+ga7fuZ7LRpNcfyfA/c2icD36WUCRiu0XkjxviUPNl/5PMLSV/
        O0owzLAsTqr2EFsKtN6u00peTq2i3/CYvQRSxYQAtdRI5FVT1/yFvmNmh1wNgW6FXCwBqZ
        VFxeUeEaKqRk3x/4anxvLi71vVBuD2MzsnXZxlxgYlpPsqMIS528zFzU+tem1A==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: [PATCH v5 3/5] rtc: rzn1: Add alarm support
Date:   Thu, 12 May 2022 16:39:18 +0200
Message-Id: <20220512143920.238987-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220512143920.238987-1-miquel.raynal@bootlin.com>
References: <20220512143920.238987-1-miquel.raynal@bootlin.com>
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

The RZN1 RTC can trigger an interrupt when reaching a particular date up
to 7 days ahead. Bring support for this alarm.

One drawback though, the granularity is about a minute.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/rtc-rzn1.c | 106 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 685cba87cd90..7ee190daa651 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -158,14 +158,107 @@ static int rzn1_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
+static irqreturn_t rzn1_rtc_alarm_irq(int irq, void *dev_id)
+{
+	struct rzn1_rtc *rtc = dev_id;
+
+	rtc_update_irq(rtc->rtcdev, 1, RTC_AF | RTC_IRQF);
+
+	return IRQ_HANDLED;
+}
+
+static int rzn1_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	u32 ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+
+	if (enable)
+		ctl1 |= RZN1_RTC_CTL1_ALME;
+	else
+		ctl1 &= ~RZN1_RTC_CTL1_ALME;
+
+	writel(ctl1, rtc->base + RZN1_RTC_CTL1);
+
+	return 0;
+}
+
+static int rzn1_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alrm->time;
+	unsigned int min, hour, wday, delta_days;
+	time64_t alarm;
+	u32 ctl1;
+	int ret;
+
+	ret = rzn1_rtc_read_time(dev, tm);
+	if (ret)
+		return ret;
+
+	min = readl(rtc->base + RZN1_RTC_ALM);
+	hour = readl(rtc->base + RZN1_RTC_ALH);
+	wday = readl(rtc->base + RZN1_RTC_ALW);
+
+	tm->tm_sec = 0;
+	tm->tm_min = bcd2bin(min);
+	tm->tm_hour = bcd2bin(hour);
+	delta_days = ((fls(wday) - 1) - tm->tm_wday + 7) % 7;
+	tm->tm_wday = fls(wday) - 1;
+
+	if (delta_days) {
+		alarm = rtc_tm_to_time64(tm) + (delta_days * 86400);
+		rtc_time64_to_tm(alarm, tm);
+	}
+
+	ctl1 = readl(rtc->base + RZN1_RTC_CTL1);
+	alrm->enabled = !!(ctl1 & RZN1_RTC_CTL1_ALME);
+
+	return 0;
+}
+
+static int rzn1_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
+	struct rtc_time *tm = &alrm->time, tm_now;
+	unsigned long alarm, farest;
+	unsigned int days_ahead, wday;
+	int ret;
+
+	ret = rzn1_rtc_read_time(dev, &tm_now);
+	if (ret)
+		return ret;
+
+	/* We cannot set alarms more than one week ahead */
+	farest = rtc_tm_to_time64(&tm_now) + (7 * 86400);
+	alarm = rtc_tm_to_time64(tm);
+	if (time_after(alarm, farest))
+		return -ERANGE;
+
+	/* Convert alarm day into week day */
+	days_ahead = tm->tm_mday - tm_now.tm_mday;
+	wday = (tm_now.tm_wday + days_ahead) % 7;
+
+	writel(bin2bcd(tm->tm_min), rtc->base + RZN1_RTC_ALM);
+	writel(bin2bcd(tm->tm_hour), rtc->base + RZN1_RTC_ALH);
+	writel(BIT(wday), rtc->base + RZN1_RTC_ALW);
+
+	rzn1_rtc_alarm_irq_enable(dev, alrm->enabled);
+
+	return 0;
+}
+
 static const struct rtc_class_ops rzn1_rtc_ops = {
 	.read_time = rzn1_rtc_read_time,
 	.set_time = rzn1_rtc_set_time,
+	.read_alarm = rzn1_rtc_read_alarm,
+	.set_alarm = rzn1_rtc_set_alarm,
+	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
 };
 
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
+	int alarm_irq;
 	int ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
@@ -178,6 +271,10 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc->base))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->base), "Missing reg\n");
 
+	alarm_irq = platform_get_irq(pdev, 0);
+	if (alarm_irq < 0)
+		return alarm_irq;
+
 	rtc->rtcdev = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc->rtcdev))
 		return PTR_ERR(rtc);
@@ -185,7 +282,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->ops = &rzn1_rtc_ops;
-	clear_bit(RTC_FEATURE_ALARM, rtc->rtcdev->features);
+	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
 
 	devm_pm_runtime_enable(&pdev->dev);
@@ -203,6 +300,13 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
+	ret = devm_request_irq(&pdev->dev, alarm_irq, rzn1_rtc_alarm_irq, 0,
+			       dev_name(&pdev->dev), rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "RTC timer interrupt not available\n");
+		goto dis_runtime_pm;
+	}
+
 	ret = devm_rtc_register_device(rtc->rtcdev);
 	if (ret)
 		goto dis_runtime_pm;
-- 
2.27.0

