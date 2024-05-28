Return-Path: <linux-rtc+bounces-1219-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB88D2160
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 18:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E6E21F25180
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2024 16:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C23171E60;
	Tue, 28 May 2024 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="Helwf6bZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9532C60
	for <linux-rtc@vger.kernel.org>; Tue, 28 May 2024 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912847; cv=none; b=T3xWzf2E0FBjEslDC6yCRwJ6LgjOnXDCaibwHISUkhNm9u22XOJHoG0PMu7MKYW8qFx5BQnMADh9QwUR+ixIb8HSFtbIWMo15Yx8Mfbe85ak+IJU3aPdGgI649/5g+3icDVgZwbGBCAqkJZEcgUEIJEnfl4SKJlh/N4stYyCaJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912847; c=relaxed/simple;
	bh=KwD892QOPII8MTSdjAkOVQhjbHcL8pYS06NWssSkCxg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ojAwBH4ytQ3yUvFhMAzGGHegdb44/DOZ2DHTq03JDNBosMrk6vZ0dig5G4DyUVWhnfbA/AYnzGA5WfGAlBp1VYanysyS1q7USXo+Oft33WElqpxnPVmRuYPDErPHeBn25q26MChJPIZ1lBbZMJoO4z1KmUoT/PGJoiI0El+nALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=Helwf6bZ; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5822EA0314;
	Tue, 28 May 2024 18:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=fylrPX9Znd89K1BJKAURRQL5g+I8RhACQLbb7ipCv/0=; b=
	Helwf6bZDJ5DCWEhMnt4CUcLDsBSW1utKqh8Dp9yX60vIw1gWQNujZaW1RWm0TK8
	jckUYjcwRVoj8csOIGfqJ+aeoMt2EGzz0cNlpdUSWupd9rSbr1OC748wDuoAIoGq
	PCf3qAxM3wnulQqGG4ipdmVGndsU1yPSUDoZZ75kRk/1sUS0tXQdI+QLGd1kZPHt
	QKJOyKG7uuRJsAsbDeB/EhTiqsyVnh3EO/Bc4bTHI4GVc/1VyPxlMoYWJINYfXog
	9U/TBZgTkOfpleeeTcIu0bLao39Tw0ehCg+vAQoC9RI4T2Qxga9yjbqwyvT4NMqt
	PomAQp3XJ3z0Bj8Y6suph2J1gYYyU1NAMQXj+G8LgdEkawJTyxK6Cp+i8THxqvUH
	SqnQpxfWFrLfZwNT69BPb5iNn3CfQijcZp34lTdPfgKF3/SYFtmFeXu4uYWrUZwH
	GkV6b5WcbYIMnXIoJWQm9cJN0LokBuRX7E0Cc254KKLLXgeSN4YW10OQQif0NV6N
	HXbVHr6PYp7hnqpSc6umd4QtXHmYE3kF3Qni6WeVW/KQx6/C6v8u0dVdU/Iih+RJ
	uteOOW4S/QP58UFKWLJthJfvkYm9WIz3pqXz9YG42XTb/T3BeEymzBH2aaa8Zgrq
	7v/J2R/hmIRA1W+CHulEhPWDkkZCFkc/0oS4rkZmLVY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <linux-rtc@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	=?UTF-8?q?Szentendrei=2C=20Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>
Subject: [PATCH 2/2] rtc: pcf2127: Add UIE capability through Seconds Interrupt
Date: Tue, 28 May 2024 18:13:42 +0200
Message-ID: <20240528161341.404407-3-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1716912834;VERSION=7972;MC=2323033567;ID=648213;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29916D3B54637165

PCF2127/29/31 is capable of generating an interrupt on every
second (SI) or minute (MI) change. It signals this through
the Minute/Second Flag (MSF) as well, which needs to be cleared.

Co-developed-by: "Szentendrei, Tamás" <szentendrei.tamas@prolan.hu>
Signed-off-by: "Szentendrei, Tamás" <szentendrei.tamas@prolan.hu>
Signed-off-by: "Csókás, Bence" <csokas.bence@prolan.hu>
---
 drivers/rtc/rtc-pcf2127.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 9c04c4e1a49c..7efff014a58d 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -31,6 +31,10 @@
 
 /* Control register 1 */
 #define PCF2127_REG_CTRL1		0x00
+/* Change interrupt. 1=seconds change, 2=minutes */
+#define PCF2127_CTRL1_MSI_MASK			GENMASK(1, 0)
+#define PCF2127_BIT_CTRL1_SI			BIT(0)
+#define PCF2127_BIT_CTRL1_MI			BIT(1)
 #define PCF2127_BIT_CTRL1_POR_OVRD		BIT(3)
 #define PCF2127_BIT_CTRL1_TSF1			BIT(4)
 #define PCF2127_BIT_CTRL1_STOP			BIT(5)
@@ -41,6 +45,7 @@
 #define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 #define PCF2127_BIT_CTRL2_WDTF			BIT(6)
+#define PCF2127_BIT_CTRL2_MSF			BIT(7)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
 #define PCF2127_BIT_CTRL3_BLIE			BIT(0)
@@ -92,6 +97,7 @@
 /* Mask for currently enabled interrupts */
 #define PCF2127_CTRL1_IRQ_MASK (PCF2127_BIT_CTRL1_TSF1)
 #define PCF2127_CTRL2_IRQ_MASK ( \
+		PCF2127_CTRL1_MSI_MASK | \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF | \
 		PCF2127_BIT_CTRL2_TSF2)
@@ -143,6 +149,7 @@
 #define PCF2131_BIT_INT_SI		BIT(4)
 #define PCF2131_BIT_INT_MI		BIT(5)
 #define PCF2131_CTRL2_IRQ_MASK ( \
+		PCF2127_CTRL1_MSI_MASK | \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF)
 #define PCF2131_CTRL4_IRQ_MASK ( \
@@ -604,6 +611,20 @@ static int pcf2127_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	return pcf2127_rtc_alarm_irq_enable(dev, alrm->enabled);
 }
 
+static int pcf2127_rtc_update_irq_enable(struct device *dev, u32 enable)
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
@@ -728,6 +749,8 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 
 	if (ctrl2 & PCF2127_BIT_CTRL2_AF)
 		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
+	else if (ctrl2 & PCF2127_BIT_CTRL2_MSF)
+		rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_UF);
 
 	pcf2127_wdt_active_ping(&pcf2127->wdd);
 
@@ -741,6 +764,7 @@ static const struct rtc_class_ops pcf2127_rtc_ops = {
 	.read_alarm       = pcf2127_rtc_read_alarm,
 	.set_alarm        = pcf2127_rtc_set_alarm,
 	.alarm_irq_enable = pcf2127_rtc_alarm_irq_enable,
+	.update_irq_enable = pcf2127_rtc_update_irq_enable,
 };
 
 /* sysfs interface */
-- 
2.34.1



