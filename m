Return-Path: <linux-rtc+bounces-1274-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C2903FB7
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 17:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF2DA1F25A2D
	for <lists+linux-rtc@lfdr.de>; Tue, 11 Jun 2024 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229EC36AF8;
	Tue, 11 Jun 2024 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="l7HTjWa4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315F31A67;
	Tue, 11 Jun 2024 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118323; cv=none; b=lJ2ZhJnX+e3OcehR8vKSfSF1yGs+pFur9yZHQ5w5CEpoeDsE9rCYD0Zb/4yItVgGgyycAYvMFfeDtGdU0Nz/wN/j5Zt6A7liFb99NNJcxguXv4lf0qerJdj/GAFcm8HvLP41VqcEVi4gig5jI0qCjoiDi4dDuDEx6bXJEzEBQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118323; c=relaxed/simple;
	bh=P72QsLH+8/jWiurELIwCL/nO3BnOjTTwh3Qgcgx8QLs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YKVAMWX71P8yPPNT4bZE+BLesYqqALrggH4+1Izz8vuZwat/U8NtSkG7mmydyBnby9rrMABmE6MCVnT7pCnNFqk8qcgX5iXcD9rremCPQZUlgpY3k2nAy6l954Ba83nXTEvibYJgsaC46OOjsihM9YKrrl9ybqtQxuVmAz1uVbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=l7HTjWa4; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5A240A0A9B;
	Tue, 11 Jun 2024 17:05:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=N2IQcnNGQek261Ir4SpT079v/L6Op0mNgfLYyIaARm0=; b=
	l7HTjWa4TXCJEdfhCzXgUaNcAASosQjsKLuf2ZFh6pFkkS6OArCz5m+bWIJG1gEW
	afQwZZOLVL7cqZfFCMOd1MHFjoFdObXZ+TKLi15ecuzo7vz8gpJugL4t70SXGETp
	bzGajbGUbqhzCZWSzfGZtX67we6UhBL22LKHAdFfY3f88XLTIVUzNjnbREmfM07W
	jL9kKLtF58WtSgHng9VrcxnIDSYWvajzuV5jTT95iqQ59GV961EMF++VyunV1s0c
	WSImGzxIlvUupR3ikeJHfIqwXDJocOnJOkwLhsZ+vFH8azVMSDDUS0kDZyNK9x68
	7bqBUz0iKb5oH0PdOg53A1MKp6I3m34muEtPEvLxPwe1nZI4uybcZJ5/CdOC6irZ
	lpGaWQMf8pqOt122haQf7mbHIgMVU1B6BCpXTUbRR5tVQ9vUkFYb2bfGAxfL963L
	lu/MqWoJCHuDoS7ZeiXVFyWsd0/ckNb9lpL5MhGDOgHdXdUIisf1/CzdKZZ9YHiv
	DF5Hp6C9+o/TlujB7SqM1vWKgYsQJMJX47T/m2uSzlC3CkKz3jQKquoTqZ0ph/ta
	7rMT7DUTaaamPCOJI+2gG3WVJnO9JWw8ieqJvo3UvkFgNlyIV+KBojS9T/A8l43M
	z2gNRNwz0gmMc7eA+EUlIj0GrDWxNmVSL0hrQqT4XbQ=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>,
	Richard Cochran <richardcochran@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds Interrupt
Date: Tue, 11 Jun 2024 17:04:57 +0200
Message-ID: <20240611150458.684349-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.45.2.437.gf7de8c0566
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1718118318;VERSION=7972;MC=2539552168;ID=232581;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2945A12957627C65

PCF2127/29/31 is capable of generating an interrupt on every
second (SI) or minute (MI) change. It signals this through
the Minute/Second Flag (MSF) as well, which needs to be cleared.

Cc: Szentendrei, Tamás <szentendrei.tamas@prolan.hu>
Cc: Richard Cochran <richardcochran@gmail.com>

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/rtc/rtc-pcf2127.c | 49 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..352ea12c15b9 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -27,10 +27,15 @@
 #include <linux/of_irq.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
+#include <linux/pps_kernel.h>
 #include <linux/watchdog.h>
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+/* Change interrupt. 1=seconds change, 2=minutes */
+#define PCF2127_CTRL1_MSI_MASK			GENMASK(1, 0)
+#define PCF2127_BIT_CTRL1_SI			BIT(0)
+#define PCF2127_BIT_CTRL1_MI			BIT(1)
 #define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 #define PCF2127_BIT_CTRL1_STOP			BIT(5)
@@ -41,6 +46,7 @@
 #define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 #define PCF2127_BIT_CTRL2_WDTF			BIT(6)
+#define PCF2127_BIT_CTRL2_MSF			BIT(7)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
 #define PCF2127_BIT_CTRL3_BLIE			BIT(0)
@@ -92,6 +98,7 @@
 /* Mask for currently enabled interrupts */
 #define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
 #define PCF2127_CTRL2_IRQ_MASK ( \
+		PCF2127_CTRL1_MSI_MASK | \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF | \
 		PCF2127_BIT_CTRL2_TSF2)
@@ -143,6 +150,7 @@
 #define PCF2131_BIT_INT_SI		BIT(4)
 #define PCF2131_BIT_INT_MI		BIT(5)
 #define PCF2131_CTRL2_IRQ_MASK ( \
+		PCF2127_CTRL1_MSI_MASK | \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF)
 #define PCF2131_CTRL4_IRQ_MASK ( \
@@ -207,6 +215,7 @@ struct pcf2127 {
 	bool irq_enabled;
 	time64_t ts[PCF2127_MAX_TS_SUPPORTED]; /* Timestamp values. */
 	bool ts_valid[PCF2127_MAX_TS_SUPPORTED];  /* Timestamp valid indication. */
+	struct pps_device *pps;
 };
 
 /*
@@ -604,6 +613,20 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
 
+static int pcf2127_rtc_pps_irq_enable(struct device *dev, u32 enable)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL1,
+				 PCF2127_CTRL1_MSI_MASK,
+				 enable ? PCF2127_BIT_CTRL1_SI : 0);
+	if (ret)
+		return ret;
+
+	return pcf2127_wdt_active_ping(&pcf2127->wdd);
+}
+
 /*
  * This function reads one timestamp function data, caller is responsible for
  * calling pcf2127_wdt_active_ping()
@@ -667,9 +690,13 @@ static void pcf2127_rtc_ts_snapshot(struct device *dev, int ts_id)
 static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	struct pps_event_time ts;
 	unsigned int ctrl2;
 	int ret = 0;
 
+	/* First of all we get the time stamp... */
+	pps_get_ts(&ts);
+
 	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
 	if (ret)
 		return IRQ_NONE;
@@ -728,6 +755,8 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 
 	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
 		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	else if (ctrl2 & PCF2127_BIT_CTRL2_MSF)
+		pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
 
 	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
@@ -1159,6 +1188,26 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		set_bit(RTC_FEATURE_ALARM, pcf2127->rtc->features);
 	}
 
+	if (alarm_irq > 0 && device_property_read_bool(dev, "pps-source")) {
+		struct pps_source_info pps_info = {
+			.mode = PPS_CAPTUREASSERT | PPS_OFFSETASSERT |
+				PPS_ECHOASSERT | PPS_CANWAIT | PPS_TSFMT_TSPEC,
+			.owner = THIS_MODULE,
+		};
+
+		snprintf(&pps_info.name, PPS_MAX_NAME_LEN - 1, "%s", dev_name(dev));
+
+		pcf2127->pps = pps_register_source(&pps_info, PPS_CAPTUREASSERT | PPS_OFFSETASSERT);
+		if (IS_ERR(pcf2127->pps)) {
+			dev_err(dev, "failed to register PPS source\n");
+			return PTR_ERR(pcf2127->pps);
+		}
+
+		ret = pcf2127_rtc_pps_irq_enable(dev, TRUE);
+		if (ret)
+			return ret;
+	}
+
 	if (pcf2127->cfg->has_int_a_b) {
 		/* Configure int A/B pins, independently of alarm_irq. */
 		ret = pcf2127_configure_interrupt_pins(dev);
-- 
2.34.1



