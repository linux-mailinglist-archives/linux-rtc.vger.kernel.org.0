Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D9C1DDD25
	for <lists+linux-rtc@lfdr.de>; Fri, 22 May 2020 04:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgEVC3u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 May 2020 22:29:50 -0400
Received: from inva020.nxp.com ([92.121.34.13]:59248 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726925AbgEVC3t (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 21 May 2020 22:29:49 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B46D21A0903;
        Fri, 22 May 2020 04:29:47 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 20F241A08DA;
        Fri, 22 May 2020 04:29:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B606E402B4;
        Fri, 22 May 2020 10:29:41 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/2] rtc: snvs: Add necessary clock operations for RTC APIs
Date:   Fri, 22 May 2020 10:19:56 +0800
Message-Id: <1590113996-31845-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590113996-31845-1-git-send-email-Anson.Huang@nxp.com>
References: <1590113996-31845-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

There could be still RTC registers access after RTC suspend
with clock disabled, need to add clock operations for each
RTC API to make sure accessing RTC registers is successfully.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/rtc-snvs.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index b9371f4..0263d99 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -148,10 +148,21 @@ static int snvs_rtc_enable(struct snvs_rtc_data *data, bool enable)
 static int snvs_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
-	unsigned long time = rtc_read_lp_counter(data);
+	unsigned long time;
+	int ret;
+
+	if (data->clk) {
+		ret = clk_enable(data->clk);
+		if (ret)
+			return ret;
+	}
 
+	time = rtc_read_lp_counter(data);
 	rtc_time64_to_tm(time, tm);
 
+	if (data->clk)
+		clk_disable(data->clk);
+
 	return 0;
 }
 
@@ -161,6 +172,12 @@ static int snvs_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	unsigned long time = rtc_tm_to_time64(tm);
 	int ret;
 
+	if (data->clk) {
+		ret = clk_enable(data->clk);
+		if (ret)
+			return ret;
+	}
+
 	/* Disable RTC first */
 	ret = snvs_rtc_enable(data, false);
 	if (ret)
@@ -173,6 +190,9 @@ static int snvs_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	/* Enable RTC again */
 	ret = snvs_rtc_enable(data, true);
 
+	if (data->clk)
+		clk_disable(data->clk);
+
 	return ret;
 }
 
@@ -180,6 +200,13 @@ static int snvs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 {
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 	u32 lptar, lpsr;
+	int ret;
+
+	if (data->clk) {
+		ret = clk_enable(data->clk);
+		if (ret)
+			return ret;
+	}
 
 	regmap_read(data->regmap, data->offset + SNVS_LPTAR, &lptar);
 	rtc_time64_to_tm(lptar, &alrm->time);
@@ -187,18 +214,33 @@ static int snvs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	regmap_read(data->regmap, data->offset + SNVS_LPSR, &lpsr);
 	alrm->pending = (lpsr & SNVS_LPSR_LPTA) ? 1 : 0;
 
+	if (data->clk)
+		clk_disable(data->clk);
+
 	return 0;
 }
 
 static int snvs_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 {
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
+	int ret;
+
+	if (data->clk) {
+		ret = clk_enable(data->clk);
+		if (ret)
+			return ret;
+	}
 
 	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR,
 			   (SNVS_LPCR_LPTA_EN | SNVS_LPCR_LPWUI_EN),
 			   enable ? (SNVS_LPCR_LPTA_EN | SNVS_LPCR_LPWUI_EN) : 0);
 
-	return rtc_write_sync_lp(data);
+	ret = rtc_write_sync_lp(data);
+
+	if (data->clk)
+		clk_disable(data->clk);
+
+	return ret;
 }
 
 static int snvs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
@@ -207,6 +249,12 @@ static int snvs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	unsigned long time = rtc_tm_to_time64(&alrm->time);
 	int ret;
 
+	if (data->clk) {
+		ret = clk_enable(data->clk);
+		if (ret)
+			return ret;
+	}
+
 	regmap_update_bits(data->regmap, data->offset + SNVS_LPCR, SNVS_LPCR_LPTA_EN, 0);
 	ret = rtc_write_sync_lp(data);
 	if (ret)
@@ -216,6 +264,9 @@ static int snvs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	/* Clear alarm interrupt status bit */
 	regmap_write(data->regmap, data->offset + SNVS_LPSR, SNVS_LPSR_LPTA);
 
+	if (data->clk)
+		clk_disable(data->clk);
+
 	return snvs_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
 
-- 
2.7.4

