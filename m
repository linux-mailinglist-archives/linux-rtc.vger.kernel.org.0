Return-Path: <linux-rtc+bounces-6352-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NgXIZqy4Gm8kwAAu9opvQ
	(envelope-from <linux-rtc+bounces-6352-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:46 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1040CA5D
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 11:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 22A27302086D
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Apr 2026 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3614439DBEE;
	Thu, 16 Apr 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="A7xhCwCP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C497739D6F0
	for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776333437; cv=none; b=QQ1wvk7DcvA+gSa39CtohR+WjU9/PiqtYrydRELDBxGLf0aQ/U07bMEaA2wHgihxC9QzpNtBgB2D5InwOyF64NOpRoGuri6+aJNXEacrwShuONuw4PhJKSEGpfEQ9MkqLV9BExqLcXbuNVXV5OHqXxirahHv9ObyScy4nNNoE9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776333437; c=relaxed/simple;
	bh=lIJnDyanoQRdooXW+rb4vRnTiHA4NZZ2a5UsiOLgCzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXM965C5shWPaMwopDCZf6MbXmAGhjhkq962gtO7btqCP4i6GM8vL9AJYCmSR+TgYLq+d4pSEms4Qzf/LBjt20OVSXb1OTZ3WhK50dcz+Nz/Ys92LsMl/LVOCY32YTqhO4QL3AeIY5eVANpDBZ8G/bJ90W6e8mi7gHQlpEPWqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=A7xhCwCP; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2dd52990758so268699eec.1
        for <linux-rtc@vger.kernel.org>; Thu, 16 Apr 2026 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1776333435; x=1776938235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/1T705jUCHUuc7zYF9p5WCGH43XsT88FDPreDZ7P4Y=;
        b=A7xhCwCPhwfdNhXwpyVgqBtP5J7dey86XN3zXBRoSA1zyAn8nrZxohuS1t3a6F4Jye
         yKzbL7P/odW4m+A6E3OvRcOVfmx+JCgSUhHJtUDlFijLhfjF9GzR+Yy5lU76cAIzmcoh
         f0meYorTbcBqjlKGRjjWwo2anNpES6Dcy6LeVDLp7D9ljeW8yGVhhayCvzY+2M7IxEMD
         FZhRFV8WbS5lMyrAtPzl7CunAhIwnxHxPLRDMOHUJNPP6sAxhWwePLeTn6ArcWYBDtpw
         SWeiPuVan5eO1uTbp8RhROUouxAsW+aZCzg9vm6CiWrdBTLAXBQ4yna6okVS2a8gDa9w
         AClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776333435; x=1776938235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/1T705jUCHUuc7zYF9p5WCGH43XsT88FDPreDZ7P4Y=;
        b=ncKI9gllIHD1bnJ5MbT7S8rWP3cQUldvCbhkoOyOVJps47COCmt0pO7ttXcdAxhnjm
         0/n/avaCPDqKGKlxqF4KSDhb9bkf0izhi5CUZvNtAYXO4Qi+W6NV9P9rn7Yjowx7kSd3
         VP2VetSGCdOTh/y6eyYTdiLsmlR0ozCuSX1Ofo9vyBtDXHzYWxxtBn8y/KVdQ7058deb
         WvDQZQFzJRb0Rdz2kEoFek0CnT9/fUz8iA14mxvH3Zf+nLU8St0E+2s/v530VHt76t+3
         T3u/Il4ObrC/he7+h8S62PAVuHE9aGhDOmI8HqWTlBS2IiXumTRukosKuKRYLCHvMqCe
         BNfQ==
X-Gm-Message-State: AOJu0YzLjPzuu8Zf/dqy6FYM3ZKHlDDP7+OE+MaZ9fysbRCtHsMEaFS6
	Dp4TP89rV+60QleIr1aJF1RMDMVL7Prnpbb8ELeidz7hnvP3tVl+l9e+EPZ/Onu2Mg==
X-Gm-Gg: AeBDieuzI7julj+ySxPhuUgC3FVkd+yoCMOBx150mMMd1gddKA+VRIPEW62s2gpG2cX
	4d92igkqyu2GMMAoTLTC4f5aOFY0z4ers4luyutFyRO2mBBWAAHse5HVLpPM42/uszcYBqfgpk5
	4Kt3mCzYny7az4Gf3QdH7pv0hpoC9KfSlpBOvAkPvqOilprwkKRPrqbAezh6wPKfmP2hHWi/wDh
	mxIu7YDS4mNmgHuS/jXIjfoTPntOiF4pEdIogg45X+6dB8lmi+KmuIsEhwTQLu68HGxhbAIAchE
	49U7D9Mb/zpammAXl1MgpgTIJQNZnQDhK1HdWELppOuy2lvo/uVhz+GD5mrlGjul7mofwGAq9jk
	F5xJ6sX7cSZW1rwRYr5UgxZoqGSdx1pf5+6qu/kXEwCIn5PG+6vhzv/3XUm1gNxC0B4jjxEiNog
	EMHd48m4G3Z8/htWI9VhjmhMzTlUpwUWPxuBmawlnnvivc1U2W7nbr8VHHXR8=
X-Received: by 2002:a05:7022:6888:b0:119:e56b:c3f1 with SMTP id a92af1059eb24-12c658ed58cmr333493c88.1.1776333434608;
        Thu, 16 Apr 2026 02:57:14 -0700 (PDT)
Received: from adriana-schoodic-rtc.sjc.aristanetworks.com ([74.123.28.10])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c5f3f3d93sm4532913c88.15.2026.04.16.02.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:57:14 -0700 (PDT)
From: Adriana Stancu <adriana@arista.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Adriana Stancu <adriana@arista.com>
Subject: [PATCH v2 2/2] rtc: bq32000: add configurable delay between RTC reads
Date: Thu, 16 Apr 2026 02:57:06 -0700
Message-ID: <20260416095706.3212158-3-adriana@arista.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416095706.3212158-1-adriana@arista.com>
References: <20260416092414.3210383-1-adriana@arista.com>
 <20260416095706.3212158-1-adriana@arista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arista.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[arista.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[adriana@arista.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6352-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[arista.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arista.com:email,arista.com:dkim,arista.com:mid]
X-Rspamd-Queue-Id: BAE1040CA5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the RTC is used on systems without a interrupt line, userspace tools
like "hwclock" fall back to a frequent polling loop to synchronize with
the edge of the next second.

On the BQ32000, this aggressive polling can temporarly lock the register
refresh cycle, because the continuous transfers prevent the hardware from
updating the buffer. This results in stale data reads or select() timeouts
in userspace.

This patch introduces a configurable settle delay via "ti,read-settle-us"
property. If this property is specified, the driver uses a delay before
reading the RTC registers. This provides a sufficient idle time for the
hardware to sync with the register buffer.

Signed-off-by: Adriana Stancu <adriana@arista.com>
---
 drivers/rtc/rtc-bq32k.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
index 7ad34539be4d..0cbfa0909732 100644
--- a/drivers/rtc/rtc-bq32k.c
+++ b/drivers/rtc/rtc-bq32k.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/errno.h>
 #include <linux/bcd.h>
+#include <linux/delay.h>
 
 #define BQ32K_SECONDS		0x00	/* Seconds register address */
 #define BQ32K_SECONDS_MASK	0x7F	/* Mask over seconds value */
@@ -48,6 +49,11 @@ struct bq32k_regs {
 	uint8_t		years;
 };
 
+struct bq32k_data {
+	struct rtc_device *rtc;
+	u32 read_delay_us;
+};
+
 static struct i2c_driver bq32k_driver;
 
 static int bq32k_read(struct device *dev, void *data, uint8_t off, uint8_t len)
@@ -89,9 +95,17 @@ static int bq32k_write(struct device *dev, void *data, uint8_t off, uint8_t len)
 
 static int bq32k_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
+	struct bq32k_data *bq32k = dev_get_drvdata(dev);
 	struct bq32k_regs regs;
 	int error;
 
+	/*
+	 * When the device doesn't have the interrupt connected, prevent
+	 * userpace from polling the RTC registers to frequently.
+	 */
+	if (bq32k && bq32k->read_delay_us)
+		usleep_range(bq32k->read_delay_us, bq32k->read_delay_us + 50);
+
 	error = bq32k_read(dev, &regs, 0, sizeof(regs));
 	if (error)
 		return error;
@@ -253,13 +267,18 @@ static void bq32k_sysfs_unregister(struct device *dev)
 static int bq32k_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct rtc_device *rtc;
+	struct bq32k_data *bq32k;
 	uint8_t reg;
 	int error;
+	uint32_t settle_us = 0;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
+	bq32k = devm_kzalloc(dev, sizeof(*bq32k), GFP_KERNEL);
+	if (!bq32k)
+		return -ENOMEM;
+
 	/* Check Oscillator Stop flag */
 	error = bq32k_read(dev, &reg, BQ32K_SECONDS, 1);
 	if (!error && (reg & BQ32K_STOP)) {
@@ -280,10 +299,13 @@ static int bq32k_probe(struct i2c_client *client)
 	if (client->dev.of_node)
 		trickle_charger_of_init(dev, client->dev.of_node);
 
-	rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
-						&bq32k_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
+	bq32k->rtc = devm_rtc_device_register(&client->dev, bq32k_driver.driver.name,
+					      &bq32k_rtc_ops, THIS_MODULE);
+	if (IS_ERR(bq32k->rtc))
+		return PTR_ERR(bq32k->rtc);
+
+	device_property_read_u32(dev, "ti,read-settle-us", &settle_us);
+	bq32k->read_delay_us = settle_us;
 
 	error = bq32k_sysfs_register(&client->dev);
 	if (error) {
@@ -293,7 +315,7 @@ static int bq32k_probe(struct i2c_client *client)
 	}
 
 
-	i2c_set_clientdata(client, rtc);
+	i2c_set_clientdata(client, bq32k);
 
 	return 0;
 }
-- 
2.51.0


