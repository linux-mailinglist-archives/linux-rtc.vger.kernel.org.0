Return-Path: <linux-rtc+bounces-4149-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E993EAC374A
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 00:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6616C189222E
	for <lists+linux-rtc@lfdr.de>; Sun, 25 May 2025 22:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B9F1ADC83;
	Sun, 25 May 2025 22:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o9iHWg2N"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360CE3FE5;
	Sun, 25 May 2025 22:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748211727; cv=none; b=miI3+fcT6pqolQ9BnOUlkxH5cLcKIIpm/IoJq8HYNViG038nKqzrLAi99JrznTHODUMV468eUoguV4tSfX7G6ZnluQHDZXIUa5raS/hYVDsRIyHUEQDIGjanDWlUbAi2BK3++gB3tHbFs50YjnsJScVQYRicAYX/2w+Z3l3/Aak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748211727; c=relaxed/simple;
	bh=rZvI+8myGxLlIzGSuSRFEOn3dBsw7nru718zBg8JJUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmHxdE5gEnSpbzLQAounGPEr1nHQtBg9XfylkgPoCLEWGc3C+pZOPPNEiIvjqux3Q2Ks0ryVLEERr9SitFqjYf+21XwzOQgG8uTIV74jBiY2imI6FEdzlnzujtlox4HApsrRGe5/SpHaLsM13GXsfjXDX1imcYIn9xZabILT00k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=o9iHWg2N; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA5EA4328F;
	Sun, 25 May 2025 22:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748211716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aViUPgYuu1A1UVMf69xV1upAAbd4N0efbHGYdCi4XBo=;
	b=o9iHWg2NCH3Yd6LGgfyRr8dbGQAaUrN6/EvF3GVOBXTMDGLa8qAavY71yqpe3MOzTZlSSs
	wdtgyhABTbPEDNUomWVaglvEVlzw/+mQ0Il3jLJxsJdD/3Ifw8u73ce8YSvlBhXtLHYRDX
	EhOKCHgvKFmM/xR2s4QsrG4B67bAxcLSpftgLq0bJJXZYioYjL1KPc99Z3LcV/V1tVc5hO
	uBdAf9cChjPYbuGHYE2vdrBG9hZPOoromD6EX4LlnEBEOyFJXv6MLc5MGrX9teskwKcMQ3
	ddnjZM2raYYdWGGH/8wT2bCu6jVwf9L7Bb/ko6Leoy0XxV7kbTm/XwgXoVcriA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: m41t80: reduce verbosity
Date: Mon, 26 May 2025 00:21:52 +0200
Message-ID: <20250525222153.1472917-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheekudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhenucggtffrrghtthgvrhhnpeegtdffueegfeettdffhfeitdejfeeiueevleffteelvdeuledugeegtdejgfevveenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghls
 ehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The driver currently uses dev_err for messages that have a very low probability
of being read by the user as the error will probably never happen and the
systems with the RTC probably don't have any user able to read the message.

Moreover, the only user action after getting this message is the restart the
action so drop the level to dev_dbg.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m41t80.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 7074d086f1c8..c568639d2151 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -212,7 +212,7 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	err = i2c_smbus_read_i2c_block_data(client, M41T80_REG_SSEC,
 					    sizeof(buf), buf);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to read date\n");
+		dev_dbg(&client->dev, "Unable to read date\n");
 		return err;
 	}
 
@@ -268,7 +268,7 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 	err = i2c_smbus_write_i2c_block_data(client, M41T80_REG_SSEC,
 					     sizeof(buf), buf);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to write to date registers\n");
+		dev_dbg(&client->dev, "Unable to write to date registers\n");
 		return err;
 	}
 	if (flags & M41T80_FLAGS_OF) {
@@ -276,12 +276,12 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 		dev_warn(&client->dev, "OF bit is still set, kickstarting clock.\n");
 		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, M41T80_SEC_ST);
 		if (err < 0) {
-			dev_err(&client->dev, "Can't set ST bit\n");
+			dev_dbg(&client->dev, "Can't set ST bit\n");
 			return err;
 		}
 		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, flags & ~M41T80_SEC_ST);
 		if (err < 0) {
-			dev_err(&client->dev, "Can't clear ST bit\n");
+			dev_dbg(&client->dev, "Can't clear ST bit\n");
 			return err;
 		}
 		/* oscillator must run for 4sec before we attempt to reset OF bit */
@@ -289,14 +289,14 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
 		/* Clear the OF bit of Flags Register */
 		err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS, flags & ~M41T80_FLAGS_OF);
 		if (err < 0) {
-			dev_err(&client->dev, "Unable to write flags register\n");
+			dev_dbg(&client->dev, "Unable to write flags register\n");
 			return err;
 		}
 		flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
 		if (flags < 0) {
 			return flags;
 		} else if (flags & M41T80_FLAGS_OF) {
-			dev_err(&client->dev, "Can't clear the OF bit check battery\n");
+			dev_dbg(&client->dev, "Can't clear the OF bit check battery\n");
 			return err;
 		}
 	}
@@ -336,7 +336,7 @@ static int m41t80_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 	retval = i2c_smbus_write_byte_data(client, M41T80_REG_ALARM_MON, flags);
 	if (retval < 0) {
-		dev_err(dev, "Unable to enable alarm IRQ %d\n", retval);
+		dev_dbg(dev, "Unable to enable alarm IRQ %d\n", retval);
 		return retval;
 	}
 	return 0;
@@ -361,7 +361,7 @@ static int m41t80_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	err = i2c_smbus_write_byte_data(client, M41T80_REG_ALARM_MON,
 					ret & ~(M41T80_ALMON_AFE));
 	if (err < 0) {
-		dev_err(dev, "Unable to clear AFE bit\n");
+		dev_dbg(dev, "Unable to clear AFE bit\n");
 		return err;
 	}
 
@@ -375,7 +375,7 @@ static int m41t80_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
 					ret & ~(M41T80_FLAGS_AF));
 	if (err < 0) {
-		dev_err(dev, "Unable to clear AF bit\n");
+		dev_dbg(dev, "Unable to clear AF bit\n");
 		return err;
 	}
 
-- 
2.49.0


