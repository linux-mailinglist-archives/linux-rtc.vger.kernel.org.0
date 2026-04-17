Return-Path: <linux-rtc+bounces-6371-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NRhLLx+4mnk6gAAu9opvQ
	(envelope-from <linux-rtc+bounces-6371-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2026 20:41:00 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F141E053
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2026 20:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 302173020AA8
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Apr 2026 18:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B942A363095;
	Fri, 17 Apr 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7LexiBh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903C5354AF8
	for <linux-rtc@vger.kernel.org>; Fri, 17 Apr 2026 18:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776451146; cv=none; b=TmylEnvUYyR+rN+wqo4CLCdhqQAHnXvYUhtH+lxxZsbVycvWTLPnX58PkmlwiU3jSMXmYr53EUjP9MbGV/qDVWjc1ob6dFZXIyOFrTMGXiYRnXxfM+2oLHLi/VU5aKZe+3K/Hc8cRnJbi1SN+OKFjBJjpc0r7o41jhK/o5pChFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776451146; c=relaxed/simple;
	bh=eruQFKRUgPkE3r+A43zpiXBrcwIJH4olNTJgaLccCvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UdrPwxg4Li/Gf7yFJF2ztOLh1HfiMkqXuINioH21AO3DSIpcLZi/vAYYvdJpSAVnFysEm7zl0/PxebucSX7McR2y8PGjfJDZ4cBISz3zgb4EnHLHsy7JvvtMSoHk3ccnUf0JE93XuGUQ6AAZfSGKD5RltiUYTkBMWXJCD4QEqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7LexiBh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae4816912so6670985ad.2
        for <linux-rtc@vger.kernel.org>; Fri, 17 Apr 2026 11:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776451145; x=1777055945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ae4XyvpGcdln6f15kE7xb97ONw8HzTbOYKK48/K7Tqw=;
        b=I7LexiBhDZ18mR7sSDS88KKCUN0ldw8qRw0AJkQt9VQcwYAATV7l4B+qU1YEW715dM
         zpK/uq4ksMjmpzv2kSLBSRkpuoETSIs+iy8USfjlockqDhY+kEYgP361w5A6IVIMqhLG
         wmSUOPinxR2mkOh/yxprY5JRQ0Hn3DAIfMKV+zrfYNwvi2Pu6Pr/Bc9RztEpXWdxq4tU
         KOauxwL/+WXuhDO8jMZ2A/i+I+uFb35/mmV/KmYVptKwhevhefPmOu/H9FQJZfBOIYUD
         IK26jywjkXbvWE73qxUeVoc3wF5fvt70Rn08MftdQjsl1l97E/RgQ3ORv0oITaMyg/jN
         iO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776451145; x=1777055945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ae4XyvpGcdln6f15kE7xb97ONw8HzTbOYKK48/K7Tqw=;
        b=Lll00hHZQZWoUDO6BN5gjPmMLyDZP1VPDdRWNN8CYMCGjY5JWhexeKG0nmamDitUIT
         pQFhcr9YOm1lLNo2tS+BoOew+2SSX5yGVwOO3zJfCYk11hgLTdIa/czE66JxQSnFF4jp
         w51Jh/8OBxCMOf53lVlqTmw1VS7iwSsfC8D2pa5RaJur4aiJfWQgmbTTdMV0gFByWfGo
         REudfVDOcIacFAAT1v82Y2pgu2yREWZeCMYhDoZaoU6MUEG8QxHXsjgZaKDaJ+9dR/iP
         R4ANUm0Tpse/I4SiyX8R2m00+LXujMFPxq0i063qx6WPvp+5c7J5isyIpw68HkJU6Knu
         aLSw==
X-Gm-Message-State: AOJu0Yy44+9LkHU0VIbos9B2ugfOkATgLGuk/7suwIhPgDIHFjpw0ubn
	LKA0KgMmJcnthzxamtkDhze+xJ1IV6c0T/M050hpbMXB9WCHdm4EcYVW
X-Gm-Gg: AeBDietRh4kkd94dYjtsKV7rIJY+lqISNdfXrUK1SPWDCg/VmM366JQfcLXT4rfabc/
	ItwRZQn9mzViiyTSPyuJmF3+FagcRGkCNapG81LXlWh1rDQ8fL1+Eum7AEDpHy9pucCIVrIJFmf
	jIy3OfWFaGZ0hBAEYRaWnRPZnk6xbUQ70YHTiyeGTLgl6qQnTxy2VckZF9ZZ402rdcVsaIk9reX
	Jn7SjrUkkdkJdRM0vuxw0Z7zitDs9NdUhVcvYbN/bVixg99kcuXAp6H4m4EfF9ZL4YAtfUbNM9g
	RIVx82Okc+/LG4stoEbramaswkCBfrkgHsguiw9saykAlZJPUqBPtsQiWUnjYuDCneSPje3R+ms
	PW/cHKzyFrHaFfTxfRCm8I5UQ9B/Ha94CUnqQukwrAWXa57KXCfVhNW9TuJcbBt8CZXsSRlLPPT
	rjzYJBBVmjPAdisuPzuRj291yoeBzLwrBa3HKFeYaGdQ3VW+RTEFZNEYvR2qX7mT3XjAA=
X-Received: by 2002:a17:902:690a:b0:2b2:50bd:83b3 with SMTP id d9443c01a7336-2b5f9e8196fmr29987735ad.10.1776451144652;
        Fri, 17 Apr 2026 11:39:04 -0700 (PDT)
Received: from intel-VirtualBox.. ([185.213.82.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3a929sm25583465ad.72.2026.04.17.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:39:04 -0700 (PDT)
From: Brian Sune <briansune@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Sune <briansune@gmail.com>
Subject: [PATCH v1] Fix missing RTC charge ctrl
Date: Sat, 18 Apr 2026 02:38:49 +0800
Message-Id: <20260417183849.88144-1-briansune@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6371-lists,linux-rtc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briansune@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 116F141E053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Default driver did not consider battery supported
use cases, which DTS and probe did not control
the charge switch and strength. As such battery
could be dried out and possible dmanage.

Signed-off-by: Brian Sune <briansune@gmail.com>
---
 drivers/rtc/rtc-sd3078.c | 47 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index 10cc1dcfc774..871e6d9acd86 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -22,11 +22,17 @@
 #define SD3078_REG_CTRL1		0x0f
 #define SD3078_REG_CTRL2		0x10
 #define SD3078_REG_CTRL3		0x11
+#define SD3078_REG_AGTC			0x17
+#define SD3078_REG_CHARGE		0x18
 
 #define KEY_WRITE1		0x80
 #define KEY_WRITE2		0x04
 #define KEY_WRITE3		0x80
 
+#define CLK_F32K		0x40
+
+#define BAT_IIC			0x80
+
 #define NUM_TIME_REGS   (SD3078_REG_YR - SD3078_REG_SC + 1)
 
 /*
@@ -36,6 +42,13 @@
  */
 #define WRITE_PROTECT_EN	0
 
+static const char * const sd3078_charge_names[] = {
+	"10k", /* 0x00 */
+	"5k",  /* 0x01 */
+	"2k",  /* 0x02 */
+	"inf", /* 0x03 */
+};
+
 /*
  * In order to prevent arbitrary modification of the time register,
  * when modification of the register,
@@ -148,13 +161,15 @@ static const struct rtc_class_ops sd3078_rtc_ops = {
 static const struct regmap_config regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = 0x11,
+	.max_register = 0x18,
 };
 
 static int sd3078_probe(struct i2c_client *client)
 {
 	int ret;
+	unsigned int val;
 	struct regmap *regmap;
+	bool f32k_out, bat_iic;
 	struct rtc_device *rtc;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
@@ -182,6 +197,36 @@ static int sd3078_probe(struct i2c_client *client)
 
 	sd3078_enable_reg_write(regmap);
 
+	f32k_out = device_property_read_bool(&client->dev, "CLOCK_F32K");
+	regmap_update_bits(regmap, SD3078_REG_CTRL3,
+			   CLK_F32K, !f32k_out);
+
+	bat_iic = device_property_read_bool(&client->dev, "IIC_ON_BAT");
+	regmap_update_bits(regmap, SD3078_REG_AGTC,
+			   BAT_IIC, bat_iic);
+
+	ret = regmap_read(regmap, SD3078_REG_CHARGE, &val);
+	if (!ret) {
+		dev_info(&client->dev, "RTC BAT Charge: %s",
+			 (val & 0x80) ? "ON" : "OFF");
+	}
+
+	ret = device_property_read_u32(&client->dev, "BAT_CHARGE", &val);
+	if (!ret) {
+		// 0: 10k, 1: 5k, 2: 2k, 3: inf
+		dev_info(&client->dev, "Enable Battery Charge.\n");
+		regmap_write(regmap, SD3078_REG_CHARGE,
+			     (val < 3) ? (u8)(val|0x80) : 0x03);
+	}
+
+	ret = regmap_read(regmap, SD3078_REG_CHARGE, &val);
+	if (!ret) {
+		dev_info(&client->dev, "RTC BAT charge: %s",
+			 (val & 0x80) ? "ON" : "OFF");
+		dev_info(&client->dev, "RTC BAT Charge Strength: %s",
+			 sd3078_charge_names[val & 0x03]);
+	}
+
 	return 0;
 }
 
-- 
2.34.1


