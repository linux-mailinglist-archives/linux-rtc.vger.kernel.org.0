Return-Path: <linux-rtc+bounces-4566-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A81B103B0
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 10:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01A316BB89
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jul 2025 08:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F04274B37;
	Thu, 24 Jul 2025 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jpvgTYWY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9013B7AE;
	Thu, 24 Jul 2025 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346225; cv=none; b=KMuNZXMJ+WwVDUYZLxNcXDWyx4QbxsbAMp+6kUmkEord6Qm5zJ2sn3s/UZbi4dCD5rCLLce9xJZdpq+VZJS8ulAx90vR+MuQmMJfISH5XFpKJpaLk7Uyav03zyHtuMQM9fmCDhnRMszZUAuLBkdCWNXTbmEcuE/TvSDcKcwdtFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346225; c=relaxed/simple;
	bh=5zHK1gypSFSJ5R5OCoZUs5g5bQEB7/aW8sgzBo7RkEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAN3r9wWhyeWBOkI9PzRbY2vjUiTSp42B/tToAUm0HVLCSJj4UV4g4U81Q81aQbk8q+Qm+ICp8QqmZ23mXOUf74/jirZwX5Fntar44WMPHr2Vuv8gR/dsudlt6nlggqZP705QmiQA1N2AfjfYT+69WqNdyM+oQ5Y/OFgdWt27wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jpvgTYWY; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95EB9430D1;
	Thu, 24 Jul 2025 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753346220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eOpVrwt2ySeTbW1TGckznyD/pe61HL05c0pjWx1jAbs=;
	b=jpvgTYWY+3mKwwEPC/lBT+BhUSu6b5j3w1UuafBs2t9CGzUrD0Ryl1+KETE+uFt6OWunAj
	zczdtYRQLMhznQIlHI7pyRXpzu6GB6Oxe5rrKV3eEfxPf/07VSYbWkg7IQKaDKJN+FzpzP
	wetnt2lFbgewpe8PzdcpISxV369C571Frg9wAyj/sfqgwHVPbVAZFvC2j/thvO4fZS9s8v
	lWeo7uVSS09c2LFTTeiqzazd2TPxGK8hXqffNpK0S5egBCUn6ry74FL9hi7rnCIDbOvF0I
	2mqwZ6/mHny/4336p+cT0ohP4JWZmAK/3kdnfXj/KSt6EwNtYIq6+Ga3esGWpA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel test robot <lkp@intel.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf85063: scope pcf85063_config structures
Date: Thu, 24 Jul 2025 10:36:57 +0200
Message-ID: <20250724083658.914047-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeejgeehtddtvdekudfglefftdfgffehtdekueegteeutedvvddtgedvveeujeejudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Fix possible warning:
>> drivers/rtc/rtc-pcf85063.c:566:37: warning: unused variable 'config_rv8063' [-Wunused-const-variable]
     566 | static const struct pcf85063_config config_rv8063 = {
         |                                     ^~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507241607.dmz2qrO5-lkp@intel.com/
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf85063.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index d9b67b959d18..0fb05f7c86d4 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -528,6 +528,7 @@ static struct clk *pcf85063_clkout_register_clk(struct pcf85063 *pcf85063)
 }
 #endif
 
+#if IS_ENABLED(CONFIG_I2C)
 static const struct pcf85063_config config_pcf85063 = {
 	.regmap = {
 		.reg_bits = 8,
@@ -562,7 +563,9 @@ static const struct pcf85063_config config_rv8263 = {
 	.has_alarms = 1,
 	.force_cap_7000 = 1,
 };
+#endif /* IS_ENABLED(CONFIG_I2C) */
 
+#if IS_ENABLED(CONFIG_SPI_MASTER)
 static const struct pcf85063_config config_rv8063 = {
 	.regmap = {
 		.reg_bits = 8,
@@ -574,6 +577,8 @@ static const struct pcf85063_config config_rv8063 = {
 	.has_alarms = 1,
 	.force_cap_7000 = 1,
 };
+#endif /* IS_ENABLED(CONFIG_SPI_MASTER) */
+
 
 static int pcf85063_probe(struct device *dev, struct regmap *regmap, int irq,
 			  const struct pcf85063_config *config)
-- 
2.50.1


