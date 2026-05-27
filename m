Return-Path: <linux-rtc+bounces-6575-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOTEFX5IF2qS/QcAu9opvQ
	(envelope-from <linux-rtc+bounces-6575-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2026 21:39:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D75E993F
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2026 21:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95BE63020FCB
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2026 19:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873A73914FE;
	Wed, 27 May 2026 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SfCMpCWa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF838AC9A;
	Wed, 27 May 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779910774; cv=none; b=HWZEMn8v0+pZnBKBK2QAeOIAAHmievfkmlu2iWdhcuJl+8/lMb0zyROu/oWyz7C4JeiuivAYMh/V5FoHLaACTHayVAKqXs5aSOFXq2nfVWlY7zj+3D2WbttLKBWJtgGwldE4a3piVa1/wpeuZsgNycycw92qAtMq8ceIQjniCWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779910774; c=relaxed/simple;
	bh=0PPLfjzQ8iVa/B67gDX8WmmXwgsIRB8Otg+Gy7CkuhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VxtVHmEz1Qk9waaEXEyhK79QYW1D2USIoVsOu//k1fk41qTaDbHqnHB+e9oziANUdLPhLv97WD7IaZfpji8P/crwmv6OMOPcaxucI8lRNDmNv4WZVS3Z9N2wGbeCyoFZ8YwNm3FKs/ZsjLg29b99IrW8jQFKm13GlwRuiduO8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SfCMpCWa; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10CF1F000E9;
	Wed, 27 May 2026 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779910771;
	bh=GALH5MBhn3i1yuFtT7lQ/Z41yxmFA83B+Cm0aqZttnE=;
	h=From:To:Cc:Subject:Date;
	b=SfCMpCWa2IsxE8RVZKXqZbJ4wXLd+xQgSVq9jwM1Tcls6xcEYbMlJzlRnXydMBJsc
	 dMs6o0ELNctDB3mWvPx+fMExl3UQ1epeQaQfuEDgbArHg1JIOm27ct76rhgSyFH/Cs
	 PdPPFAjWqPt4jgf2NqAN3mkgWIPXo6+QWokzqcogdF9wp0b5xavJHbdiiqqh8KKgdf
	 05V06fCo6EPNsxuSVFMIv0HgBG//uACnu9N3N1Y0foRPDLwGePhpe36AXlSrmLBx8i
	 /+Y9rFFT1zdseV/wUJRKBxpx+yVMP5XVDd7iagMN19V9VZ2nF22jpwzZoO1Onx5WJ3
	 9fKFUHUKp4u8Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: remove unused pcap driver
Date: Wed, 27 May 2026 21:39:03 +0200
Message-Id: <20260527193927.3523952-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6575-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 537D75E993F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The platform was removed a few years ago, and the mfd driver
is also gone now, so it is impossible to build or use it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/rtc/Kconfig    |   7 --
 drivers/rtc/Makefile   |   1 -
 drivers/rtc/rtc-pcap.c | 179 -----------------------------------------
 3 files changed, 187 deletions(-)
 delete mode 100644 drivers/rtc/rtc-pcap.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 364afc73f8ab..01def8231873 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1763,13 +1763,6 @@ config RTC_DRV_STMP
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-stmp3xxx.
 
-config RTC_DRV_PCAP
-	tristate "PCAP RTC"
-	depends on EZX_PCAP
-	help
-	  If you say Y here you will get support for the RTC found on
-	  the PCAP2 ASIC used on some Motorola phones.
-
 config RTC_DRV_MC13XXX
 	depends on MFD_MC13XXX
 	tristate "Freescale MC13xxx RTC"
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 6cf7e066314e..0347645b021f 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
 obj-$(CONFIG_RTC_DRV_PALMAS)	+= rtc-palmas.o
-obj-$(CONFIG_RTC_DRV_PCAP)	+= rtc-pcap.o
 obj-$(CONFIG_RTC_DRV_PCF2123)	+= rtc-pcf2123.o
 obj-$(CONFIG_RTC_DRV_PCF2127)	+= rtc-pcf2127.o
 obj-$(CONFIG_RTC_DRV_PCF85063)	+= rtc-pcf85063.o
diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
deleted file mode 100644
index d6651611a0c6..000000000000
--- a/drivers/rtc/rtc-pcap.c
+++ /dev/null
@@ -1,179 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- *  pcap rtc code for Motorola EZX phones
- *
- *  Copyright (c) 2008 guiming zhuo <gmzhuo@gmail.com>
- *  Copyright (c) 2009 Daniel Ribeiro <drwyrm@gmail.com>
- *
- *  Based on Motorola's rtc.c Copyright (c) 2003-2005 Motorola
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/mfd/ezx-pcap.h>
-#include <linux/rtc.h>
-#include <linux/slab.h>
-#include <linux/platform_device.h>
-
-struct pcap_rtc {
-	struct pcap_chip *pcap;
-	struct rtc_device *rtc;
-};
-
-static irqreturn_t pcap_rtc_irq(int irq, void *_pcap_rtc)
-{
-	struct pcap_rtc *pcap_rtc = _pcap_rtc;
-	unsigned long rtc_events;
-
-	if (irq == pcap_to_irq(pcap_rtc->pcap, PCAP_IRQ_1HZ))
-		rtc_events = RTC_IRQF | RTC_UF;
-	else if (irq == pcap_to_irq(pcap_rtc->pcap, PCAP_IRQ_TODA))
-		rtc_events = RTC_IRQF | RTC_AF;
-	else
-		rtc_events = 0;
-
-	rtc_update_irq(pcap_rtc->rtc, 1, rtc_events);
-	return IRQ_HANDLED;
-}
-
-static int pcap_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-	struct rtc_time *tm = &alrm->time;
-	unsigned long secs;
-	u32 tod;	/* time of day, seconds since midnight */
-	u32 days;	/* days since 1/1/1970 */
-
-	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_TODA, &tod);
-	secs = tod & PCAP_RTC_TOD_MASK;
-
-	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_DAYA, &days);
-	secs += (days & PCAP_RTC_DAY_MASK) * SEC_PER_DAY;
-
-	rtc_time64_to_tm(secs, tm);
-
-	return 0;
-}
-
-static int pcap_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
-{
-	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-	unsigned long secs = rtc_tm_to_time64(&alrm->time);
-	u32 tod, days;
-
-	tod = secs % SEC_PER_DAY;
-	ezx_pcap_write(pcap_rtc->pcap, PCAP_REG_RTC_TODA, tod);
-
-	days = secs / SEC_PER_DAY;
-	ezx_pcap_write(pcap_rtc->pcap, PCAP_REG_RTC_DAYA, days);
-
-	return 0;
-}
-
-static int pcap_rtc_read_time(struct device *dev, struct rtc_time *tm)
-{
-	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-	unsigned long secs;
-	u32 tod, days;
-
-	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_TOD, &tod);
-	secs = tod & PCAP_RTC_TOD_MASK;
-
-	ezx_pcap_read(pcap_rtc->pcap, PCAP_REG_RTC_DAY, &days);
-	secs += (days & PCAP_RTC_DAY_MASK) * SEC_PER_DAY;
-
-	rtc_time64_to_tm(secs, tm);
-
-	return 0;
-}
-
-static int pcap_rtc_set_time(struct device *dev, struct rtc_time *tm)
-{
-	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-	unsigned long secs = rtc_tm_to_time64(tm);
-	u32 tod, days;
-
-	tod = secs % SEC_PER_DAY;
-	ezx_pcap_write(pcap_rtc->pcap, PCAP_REG_RTC_TOD, tod);
-
-	days = secs / SEC_PER_DAY;
-	ezx_pcap_write(pcap_rtc->pcap, PCAP_REG_RTC_DAY, days);
-
-	return 0;
-}
-
-static int pcap_rtc_irq_enable(struct device *dev, int pirq, unsigned int en)
-{
-	struct pcap_rtc *pcap_rtc = dev_get_drvdata(dev);
-
-	if (en)
-		enable_irq(pcap_to_irq(pcap_rtc->pcap, pirq));
-	else
-		disable_irq(pcap_to_irq(pcap_rtc->pcap, pirq));
-
-	return 0;
-}
-
-static int pcap_rtc_alarm_irq_enable(struct device *dev, unsigned int en)
-{
-	return pcap_rtc_irq_enable(dev, PCAP_IRQ_TODA, en);
-}
-
-static const struct rtc_class_ops pcap_rtc_ops = {
-	.read_time = pcap_rtc_read_time,
-	.set_time = pcap_rtc_set_time,
-	.read_alarm = pcap_rtc_read_alarm,
-	.set_alarm = pcap_rtc_set_alarm,
-	.alarm_irq_enable = pcap_rtc_alarm_irq_enable,
-};
-
-static int __init pcap_rtc_probe(struct platform_device *pdev)
-{
-	struct pcap_rtc *pcap_rtc;
-	int timer_irq, alarm_irq;
-	int err = -ENOMEM;
-
-	pcap_rtc = devm_kzalloc(&pdev->dev, sizeof(struct pcap_rtc),
-				GFP_KERNEL);
-	if (!pcap_rtc)
-		return err;
-
-	pcap_rtc->pcap = dev_get_drvdata(pdev->dev.parent);
-
-	platform_set_drvdata(pdev, pcap_rtc);
-
-	pcap_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(pcap_rtc->rtc))
-		return PTR_ERR(pcap_rtc->rtc);
-
-	pcap_rtc->rtc->ops = &pcap_rtc_ops;
-	pcap_rtc->rtc->range_max = (1 << 14) * 86400ULL - 1;
-
-	timer_irq = pcap_to_irq(pcap_rtc->pcap, PCAP_IRQ_1HZ);
-	alarm_irq = pcap_to_irq(pcap_rtc->pcap, PCAP_IRQ_TODA);
-
-	err = devm_request_irq(&pdev->dev, timer_irq, pcap_rtc_irq, 0,
-				"RTC Timer", pcap_rtc);
-	if (err)
-		return err;
-
-	err = devm_request_irq(&pdev->dev, alarm_irq, pcap_rtc_irq, 0,
-				"RTC Alarm", pcap_rtc);
-	if (err)
-		return err;
-
-	return devm_rtc_register_device(pcap_rtc->rtc);
-}
-
-static struct platform_driver pcap_rtc_driver = {
-	.driver = {
-		.name  = "pcap-rtc",
-	},
-};
-
-module_platform_driver_probe(pcap_rtc_driver, pcap_rtc_probe);
-
-MODULE_DESCRIPTION("Motorola pcap rtc driver");
-MODULE_AUTHOR("guiming zhuo <gmzhuo@gmail.com>");
-MODULE_LICENSE("GPL");
-- 
2.39.5


