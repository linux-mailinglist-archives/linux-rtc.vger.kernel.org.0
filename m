Return-Path: <linux-rtc+bounces-4159-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878EAC3D7C
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 11:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0DE21730E5
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 09:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC46D1F4262;
	Mon, 26 May 2025 09:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zi+6O438"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088F1F3FED
	for <linux-rtc@vger.kernel.org>; Mon, 26 May 2025 09:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253507; cv=none; b=N1P5uGl74qyJjYysMr/PMxYIb5jpQCmrHsqv1oHpQFrjuBR63VUzT/TOWXTqOgBN4YSD3pOEL4Ge1gahX0WBgXPKmfrQn0b2pQeQY2Lh+eG2j9vlJ9bRYIl2gr/WRspSOZpCL4244zuoKJQvz5C3qhbNgPSOD+Gyy5vCvOKXwK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253507; c=relaxed/simple;
	bh=01wlVeg860WtfNzlGREip3fyPeFq0pn9r0Dx2NrPhyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kt3H8mZz39VUPJ4Jeuzx4YSGqVbe9x5joHbxQm36Pfk95+/gLfuAcruWWp9AgzNi6NvXQfx1ViavR90YoSUoavih58TmQFjkK05cHi/pEhwlbD0YCnjyCKNAxGmupLGS/kdKV4ODI4uOb92OP7AOAkK73x1tf9dnnjoi9Obn3ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zi+6O438; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=aIdBVBebOZJBXXFgmL84aOdpDyKY/q2wSHA7igundHY=; b=Zi+6O4
	38I8zVZ7Y4gpvYjGenQcet5BIoG+7APJr4Vo8FIihn/IFFK10JvgDcVD5rQEnjA2
	lU3wWbQ912jHfw/bezL6SGisBps+ys6rhO6PfwvNqBE5F+vLl8jHG1QdE7Az7cfn
	1bKsVn2WFioZmBUilncUmtghvyDMu/K/Cu1yYoNUJo5h77FkTIPupPvIP6jCVK0W
	qjDIkEN/lKTJS8rzhcKA1qkNJXywgNXKA7VtKx9JWYCs3S+4cRmfD2l3nExPEwOh
	s/9ECTEWlZ8EqGZslgD3vx0JDiLI75Y7xzM8cc3bSgi39ye3MgPY8IA+wZcdGqVG
	rYwAcyH0kMbbxy8A==
Received: (qmail 769260 invoked from network); 26 May 2025 11:58:18 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2025 11:58:18 +0200
X-UD-Smtp-Session: l3s3148p1@PWu+/AY2OVJtKPCv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 2/3] rtc: rzn1: Disable controller before initialization
Date: Mon, 26 May 2025 11:58:03 +0200
Message-ID: <20250526095801.35781-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
References: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
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


