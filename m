Return-Path: <linux-rtc+bounces-3555-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE37A68A85
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 12:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB763160912
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 11:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5AD25484D;
	Wed, 19 Mar 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OZ89A9Gk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457B251788
	for <linux-rtc@vger.kernel.org>; Wed, 19 Mar 2025 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382196; cv=none; b=rp8mTi+ntEtsFscNs3BnVEoRPcA40IalHKi4S5fRcMXZZXN+Ydb/OOeke51zzaGHCXe+Bm6Tm1jUdIO8s4vSqH27xOEUB2zaMqLVVwsf9CuoNE8sxmFsCwufQbU1gIQSQjXVXc7/N2XgsWZaGwIB1E2kN7sZE510IEQnj1yvDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382196; c=relaxed/simple;
	bh=01wlVeg860WtfNzlGREip3fyPeFq0pn9r0Dx2NrPhyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2RYv0Vzw/H22xgSUhgpuudXuuQwmEe1xid/kGzsqMTjWLI/Sayt2IX3malPZa9YssfhjT7dBCSHoaNazaniJU503ZWUDunDWa8s6p+jXwlC9eOxP15D+cYmLZLAwfAea8zFMUeYJzWp/QFQsBnktKrd4QtdCHvLKcdPW2QqTSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OZ89A9Gk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aIdBVBebOZJBXXFgmL84aOdpDyKY/q2wSHA7igundHY=; b=OZ89A9
	GkPBuymWreM6rpLmEU6UcPxn3Qac0iXLkQ+BLyKNNzexqzRC43WGAeaKcQhKyiT2
	xdCp01LOFuSNP2KXnXzoJqAclANEWRJS62KqkeMawyk8jI+erBVzPnJPi8okUQMK
	L/c1WEOu23w3gYYeseJU9dccT+W8vEC8LgSDblCNb2Q+wLk0S1S7cW5zNEsyeR2n
	r98SPifZBEMJk3+Ihd6XAGr0Ah5FKPDJ8bpB2IA6aXf7v04tuYD7WUL9KsCMvWlG
	n+vwjS9p7in8LUplBamOJecEPZa7kCGlhMvLNjUXcgHW3wO/5Y42VOMnxtWYXNQL
	RSp3CRjs3slAlkIA==
Received: (qmail 81854 invoked from network); 19 Mar 2025 12:03:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 12:03:13 +0100
X-UD-Smtp-Session: l3s3148p1@1z6r968w9LwgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 2/3] rtc: rzn1: Disable controller before initialization
Date: Wed, 19 Mar 2025 12:03:03 +0100
Message-ID: <20250319110305.19687-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Datasheet says that the controller must be disabled before setting up
either SUBU or SCMP. This did not matter so far because the driver only
supported SUBU which was the default, too. It is good practice to follow
datasheet recommendations, though. It will also be needed because SCMP
mode will be added in a later patch.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-rzn1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 3c2861983ff1..7777df1e3426 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -25,6 +25,7 @@
 #define   RZN1_RTC_CTL0_SLSB_SUBU 0
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
 #define   RZN1_RTC_CTL0_AMPM BIT(5)
+#define   RZN1_RTC_CTL0_CEST BIT(6)
 #define   RZN1_RTC_CTL0_CE BIT(7)
 
 #define RZN1_RTC_CTL1 0x04
@@ -369,6 +370,7 @@ static const struct rtc_class_ops rzn1_rtc_ops = {
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
+	u32 val;
 	int irq;
 	int ret;
 
@@ -406,6 +408,14 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	 * Ensure the clock counter is enabled.
 	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
 	 */
+	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
+	writel(val, rtc->base + RZN1_RTC_CTL0);
+	/* Wait 2-4 32k clock cycles for the disabled controller */
+	ret = readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
+				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
+	if (ret)
+		goto dis_runtime_pm;
+
 	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
 	       rtc->base + RZN1_RTC_CTL0);
 
-- 
2.47.2


