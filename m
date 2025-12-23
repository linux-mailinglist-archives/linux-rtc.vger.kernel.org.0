Return-Path: <linux-rtc+bounces-5609-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C401CD9609
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Dec 2025 13:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE3A4300451A
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Dec 2025 12:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204F032C331;
	Tue, 23 Dec 2025 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monogon-tech.20230601.gappssmtp.com header.i=@monogon-tech.20230601.gappssmtp.com header.b="ireOOJD0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6213311C11
	for <linux-rtc@vger.kernel.org>; Tue, 23 Dec 2025 12:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766494654; cv=none; b=nLRUiqOdEQ/ti/wJURQJPhAs/i59RTTyLVWZ9FEa/fI2SpjSZTRb2jctVuxlTvFCZsPae+jmZ9/XmKnKKeXhCvHCYExcgB7UehtrYx2U78JtgUCMCa6aRwOLYe3tVjvbuXaEiNchpUpZXAhNC40k2/o0l2lGjn/+eJ4j5cNmkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766494654; c=relaxed/simple;
	bh=9d3AqmeKXSAYnelLmGXoCLe/xzD7mfIltSiN9KW7kwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pYRKOHJhqWTzcf00btB9q3SXNZiJOjSTRJbtV13SHlnYTAHifhzDgNW4XM0DNMjSuA6MiCBrTWpLIlNGEeq7/4Zij1utOLEkxmub8DZlDs1lcRXYRG90rpmofgmxeo3gkmIT1LdqkzXPEE9yGsLocpRDRZ5ebOh/UF6gs5oqdHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech; spf=pass smtp.mailfrom=monogon.tech; dkim=pass (2048-bit key) header.d=monogon-tech.20230601.gappssmtp.com header.i=@monogon-tech.20230601.gappssmtp.com header.b=ireOOJD0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monogon.tech
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso41444395e9.3
        for <linux-rtc@vger.kernel.org>; Tue, 23 Dec 2025 04:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monogon-tech.20230601.gappssmtp.com; s=20230601; t=1766494650; x=1767099450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeLuMuU0rLR3L3IWE5TVg/ejx2unMg1hrN1IZeYRkAQ=;
        b=ireOOJD0dVw2TFr//wE3HX9ZFKRiMohUJSbLOBL1/N8gyrG634MDDBfIYemKP6r+r8
         +J+w8up/kAiYaQix+s/sc+FIFRKsIjadLRH4sFr/4fEpLY+thnZJk2OJ4qIYxgfVHeav
         /BR0iKuL/Me5KP0sCri9763cl7BFYPD25nv+XIr9kVPDoxaduvY8OkVUtveIAOJUN6AA
         1yFb0ow/PjR3hkLCrjgEztjj2cMQoPVHGR/ER6ezJZqjda5VwI84Q2fnzXKpemSeS0Qx
         +Rc6icVgfu0AIDSjnV5fBENaQfLyh4cjDtRElTNtGaNcYMqbr3X3VSt90EQGvqTXMcZ8
         mqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766494650; x=1767099450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeLuMuU0rLR3L3IWE5TVg/ejx2unMg1hrN1IZeYRkAQ=;
        b=sTFb9Ifm098biQ7d7Sw8jwkOVaIlgQGMfDhQBbX+FWf/MjpcAxrqUmfkPf1mGiM5d3
         abiQ7H5BJ4Xd83xI7VpiFQapEx13GqbQ+VJRvkbNkX6PxxZeSHMCbcIK2ysW/LG4eorN
         j/df0yYSNwsOMpk7l/6wJ54mNZmobOBfosLsejFL7mc1IX8GFsYG2O9gaV0z4na5pPhI
         uGVq5rIvdekpDxFeHtZst6uZI+FGjIePWqB0leCt32GNHl9T3BFsfyvEv03Tkp2LYwuQ
         5Oq0F69vfJzd9UjCGYr08KG7QnZIRKb5GetJTJdONSgusDywOR3C5diq/2paGbURXoPx
         e0VA==
X-Gm-Message-State: AOJu0YwiPAHS9lHjCJOhKKalmkstIB24XL4TAPQNgW2Yqm5ppcQEcjua
	jVu9tYo/yXrbKV1NHVgOmAsAZ/8ox1YUaOKl5ktdaDaMtdM/I1yN18Nwit0vGeuRYxSoZrj/L2W
	T1713BXc=
X-Gm-Gg: AY/fxX6r7Z3521jmO6sNCScWUkuObEkG2UlLgS62k9t+AY/zRvbwy7IcORhzu6hQSy5
	fqjOaQtaw6x8eVSql+4rBEZ0n5XF3Jar4IIROEpNIueaNUJgvHoqmudZWJCRuIQA1bFCqMFrZoK
	V2bm/SAus6OpxPly23KLmcC9lqkJUXqAvyX7gDsN9nosgWKKMQyYOphNl7/Vo8RVWlxqkOdvGSl
	9gKSetsJQbgm3A2AjMIbdm8cRhj1CljXOFdOdTTYDWm2c0HSGHfVYbBi8HnlzSEQqTHJCVaBQh8
	9Peugb+gB3QtWlXQOwCrJvmvXfbMZ5xoNxPXa6UEg/OM+Bj60jolJqiYJ/NZk+9fbVvkZs4cJNy
	+Mecx70VLIeVrdvs+w6r8OwGnOTf15SQuynSQjOGx1g41ueC/O8PmgTk6SYXPm3ZwR3M8k0rAfl
	OsaGFhUMQ=
X-Google-Smtp-Source: AGHT+IFUkkGVc8k9ykozTSpnm7D9Ypqn4/MAxOVssi28cYTsnAIOSOMxqjirN2CKQoAdjFQA/Y5Mow==
X-Received: by 2002:a05:600c:3b94:b0:471:13fa:1b84 with SMTP id 5b1f17b1804b1-47d19566b00mr170607805e9.12.1766494649580;
        Tue, 23 Dec 2025 04:57:29 -0800 (PST)
Received: from localhost ([2a02:168:4f87:c:f5d0:88fb:fc2b:b91d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d193d5372sm253675625e9.14.2025.12.23.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 04:57:29 -0800 (PST)
From: Lorenz Brun <lorenz@monogon.tech>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: s35390a: implement nvmem support
Date: Tue, 23 Dec 2025 13:57:26 +0100
Message-ID: <20251223125728.346073-1-lorenz@monogon.tech>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RTC has one "free" register which can be used to store arbitrary
data. Expose it as a nvmem resource in Linux.

Signed-off-by: Lorenz Brun <lorenz@monogon.tech>
---
 drivers/rtc/rtc-s35390a.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 3408d2ab2741..2ed39d1c8142 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -18,6 +18,7 @@
 #define S35390A_CMD_TIME1	2
 #define S35390A_CMD_TIME2	3
 #define S35390A_CMD_INT2_REG1	5
+#define S35390A_CMD_FREE_REG    7
 
 #define S35390A_BYTE_YEAR	0
 #define S35390A_BYTE_MONTH	1
@@ -416,6 +417,23 @@ static const struct rtc_class_ops s35390a_rtc_ops = {
 	.ioctl          = s35390a_rtc_ioctl,
 };
 
+static int s35390a_nvmem_read(void *priv, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct s35390a *s35390a = priv;
+
+	/* The offset is ignored because the NVMEM region is only 1 byte */
+	return s35390a_get_reg(s35390a, S35390A_CMD_FREE_REG, val, bytes);
+}
+
+static int s35390a_nvmem_write(void *priv, unsigned int offset, void *val,
+			       size_t bytes)
+{
+	struct s35390a *s35390a = priv;
+
+	return s35390a_set_reg(s35390a, S35390A_CMD_FREE_REG, val, bytes);
+}
+
 static int s35390a_probe(struct i2c_client *client)
 {
 	int err, err_read;
@@ -424,6 +442,15 @@ static int s35390a_probe(struct i2c_client *client)
 	struct rtc_device *rtc;
 	char buf, status1;
 	struct device *dev = &client->dev;
+	struct nvmem_config nvmem_cfg = {
+		.name = "s35390a_nvram",
+		.type = NVMEM_TYPE_BATTERY_BACKED,
+		.word_size = 1,
+		.stride = 1,
+		.size = 1,
+		.reg_read = s35390a_nvmem_read,
+		.reg_write = s35390a_nvmem_write,
+	};
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
@@ -490,6 +517,11 @@ static int s35390a_probe(struct i2c_client *client)
 	if (status1 & S35390A_FLAG_INT2)
 		rtc_update_irq(rtc, 1, RTC_AF);
 
+	nvmem_cfg.priv = s35390a;
+	err = devm_rtc_nvmem_register(rtc, &nvmem_cfg);
+	if (err)
+		return err;
+
 	return devm_rtc_register_device(rtc);
 }
 
-- 
2.49.0


