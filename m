Return-Path: <linux-rtc+bounces-6584-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDhkM8/lF2otUggAu9opvQ
	(envelope-from <linux-rtc+bounces-6584-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:50:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A95F5ED673
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A0EE315B1F5
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 06:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4592F3446C5;
	Thu, 28 May 2026 06:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="johLM7EA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627EE3446C9
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950921; cv=none; b=rgcspYQEw//3vgkh/5o6dBFBTLczFpBuLmF/lNVMfB0SYbPATy8XYAsmy709dgtSvrV6aziR1tGFoQAQavnjV5bbXFtP9IRvhOmtpbDX8/jr/bSII669yqbXfu+OB1A5ZQfQ2iJicEwQsdd13vvccsUSCSbR+XiKrXLihJQVdqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950921; c=relaxed/simple;
	bh=m5uGc/qKlrf55L8CXwzUdqW7cfhZwFz5pQDyvwJ1754=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Imm3JFR5/TaSTtjvYeop+toQzS9hSeDTzhqD+xWQM9nqJOUt3hwq9wRwPWwK+zkNy/xo5iQx1A8qah4eH442rMcy6A3sM2ORWf++4j+pw903rt6v5tbFn9BuVr/F89sssJsX51PNiFkz4TOO2yEKEwWvdk49+AewsT3X5oIu47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=johLM7EA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eeba68948so64333f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2026 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950915; x=1780555715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoBQjtq79NGF4+VCtC77fE1/QP+MOv2ih0K3njcQTfI=;
        b=johLM7EAaC11Kaog9XD5D4hE+KFNor67HkzRlf2X+C+kpBFLbMvZNINMu0UhHu1JWY
         PLu0nzi1aVrvfPA9bkQ9+7Gc6uslWOrgiOq76X/XDMaiCTsveYO1LKSKsVITGoSRKE7H
         YyXzKVF9J8SNGrtVuSeuqV1qTdAenBVRnK2Dy2zIgQYDNyE3codKzR1GwEIeK/oYGq5k
         EHsZOpxNTGFGVgosDd8gbjQBtwcW2kDLLBG1ECW5Kporz7YmojOeADgdwZtE5qEHv9zF
         hyIVDz3H4iYf3cwIjprGrXqv/4Sc+XGCrZHr6e5NTX0xAeSZtMmhGinLHANEMwd/jY9I
         aHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950915; x=1780555715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GoBQjtq79NGF4+VCtC77fE1/QP+MOv2ih0K3njcQTfI=;
        b=ItguAVB2xfgaaTiQ2cB+U5lL0QW6EtKkhM4883SirbvMobzM7udlgbSpvfTcVp/yXy
         21m/GA0BQOz7lEkE+ob7YSyZ4JyvoHHoO69XnEKEaB8X4+4SQ/R5/z1ZI6g9FJ5eCXJ7
         GGaMc1XiJwfqjwM/UgOL8Mel+FdH/FMvFpSeFpXz7/s4v/FikCrN/n3ieVx/nf45RcUY
         PAo3SzTKFr0kP76CCvB12Uvqz824dyNrB76farHX7KFFvg9X709QKIsZtsFD7UGLDYPi
         VDoyuA9V/wgA9MYGHbOX/O2Otl94qyfbDGng1cM9vC5Nk4fzFsdO/CyByT5xddJzMyDX
         jqrw==
X-Forwarded-Encrypted: i=1; AFNElJ+wwXLdmBhizLvv3KttfoHLWi1ALHfXpEU4SqCG9fXZwrZgwGAcr8tTAUP0p8/dqf2OnAxCI4gu4YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrUFuwAZc4rN/6GmemBzzBFxNhWx1r66A21hw/SEjct9jsezrP
	vv4RknVZ9Mo9uro/53l8oa47Au2oPA7WXr9EpQw/cJKG2AGA5jfPYnxXSybVfvvooII=
X-Gm-Gg: Acq92OGys2oqMpN2hYwbjkTxYrk0EciMsRPC6fpwDhinjXUz1wchCM/fuAjxqbGDXdE
	asNNtRcxDFhEuF+oK34Z/YFeDN2R9HIG+rfKVLM1SkjhdHS9zr79xbE9WTtBalHcZzIuXUn3j+J
	2RxCEvmIdDO+w+RleEJRCV5WL5Ifchu7rwelqE3K2VNeOcxv/iLM+GA4+yBremTQutNEHAbkoGT
	lfvlM9/5GEI4wC9LGh0AJ16BIb3BnI0DX6HotOmLxsRWipz0JZ7nskMhHcNO3wjHcH+kLmG6Zcr
	A7IQ318d9FuXFhI2s0OFcYWWIUUNMuBh8kcWTUJizThelPBCRJu0yx96eGGKaBco+xrZMSj6Wst
	0caaXgaiEgvnkZvwo4Vzstg30G1mlcfH9WPUCQTxd52YG5vLqTVSbTsHlycezCJS62LgRzzRejb
	S1LBj7aIl6prkXADY91mk+pE+GXiPdjpYDBgGtF4xgnzEk8i1ESdJS43RJj4FQp7rCXlTy6aCQa
	XgripoBtzWJLZVrtdRUOnEY8TaD4+2KFnU4
X-Received: by 2002:a05:6000:4612:b0:45e:e509:d2fa with SMTP id ffacd0b85a97d-45ee509d6a0mr2313536f8f.3.1779950914861;
        Wed, 27 May 2026 23:48:34 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb557679sm19913360f8f.10.2026.05.27.23.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v1 3/3] rtc: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 08:48:12 +0200
Message-ID:  <d14b9076b2c7703708bcc5cc35f339cd97fc10cd.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4899; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=m5uGc/qKlrf55L8CXwzUdqW7cfhZwFz5pQDyvwJ1754=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+Uy5Ols39Cbig7Hkh4SbnBhc4NVgRtOtNMxp p4NvkrvTg6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflMgAKCRCPgPtYfRL+ TszwCAC02fMR+WvzmWHjOpRMzvb312T2IK+IlESAE1RgLXFdBFszV0itM1PUUkQ+l6i5sc7qeJ/ B555Dxg1NDPROfSNV1ykGbFmw4I81fMtpndCrJTqao5VAmyg1WjpygSHvcGWSG3+20Fs5FARpXi As1m0yF6TjTLjiUaL6oHJJbxLFM5hpiBk/xvqr+2G7bhhXEtNbXwvkVASq4NAatvEQnZPPdiR+0 fKDI+/cLUsKd3fUqdNPR9HgIqXVcGVxu64wm3JeZjGLXNwcbtTzQf2NNZTo6KDYZrd9rjmEdx2F 3UqB/KI+0vlLeVFfJwenqJhuFHshSEJrprhxapZBlcdMIsn+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6584-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_CC(0.00)[matfyz.cz,gmail.com,samsung.com,kernel.org,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4A95F5ED673
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-88pm886.c  |  2 +-
 drivers/rtc/rtc-bd70528.c  |  8 ++++----
 drivers/rtc/rtc-max77686.c | 10 +++++-----
 drivers/rtc/rtc-max8998.c  |  4 ++--
 drivers/rtc/rtc-s5m.c      | 12 ++++++------
 drivers/rtc/rtc-tps6594.c  |  4 ++--
 6 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-88pm886.c b/drivers/rtc/rtc-88pm886.c
index 57e9b0a66eed..13aa3ae82239 100644
--- a/drivers/rtc/rtc-88pm886.c
+++ b/drivers/rtc/rtc-88pm886.c
@@ -78,7 +78,7 @@ static int pm886_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pm886_rtc_id_table[] = {
-	{ "88pm886-rtc", },
+	{ .name = "88pm886-rtc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, pm886_rtc_id_table);
diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 4c8599761b2e..482810b61495 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -341,10 +341,10 @@ static int bd70528_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd718x7_rtc_id[] = {
-	{ "bd71828-rtc", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd71815-rtc", ROHM_CHIP_TYPE_BD71815 },
-	{ "bd72720-rtc", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71828-rtc", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd71815-rtc", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ .name = "bd72720-rtc", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd718x7_rtc_id);
 
diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 3cdfd78a07cc..375565a3bddf 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -866,11 +866,11 @@ static SIMPLE_DEV_PM_OPS(max77686_rtc_pm_ops,
 			 max77686_rtc_suspend, max77686_rtc_resume);
 
 static const struct platform_device_id rtc_id[] = {
-	{ "max77686-rtc", .driver_data = (kernel_ulong_t)&max77686_drv_data, },
-	{ "max77802-rtc", .driver_data = (kernel_ulong_t)&max77802_drv_data, },
-	{ "max77620-rtc", .driver_data = (kernel_ulong_t)&max77620_drv_data, },
-	{ "max77714-rtc", .driver_data = (kernel_ulong_t)&max77714_drv_data, },
-	{},
+	{ .name = "max77686-rtc", .driver_data = (kernel_ulong_t)&max77686_drv_data },
+	{ .name = "max77802-rtc", .driver_data = (kernel_ulong_t)&max77802_drv_data },
+	{ .name = "max77620-rtc", .driver_data = (kernel_ulong_t)&max77620_drv_data },
+	{ .name = "max77714-rtc", .driver_data = (kernel_ulong_t)&max77714_drv_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rtc_id);
 
diff --git a/drivers/rtc/rtc-max8998.c b/drivers/rtc/rtc-max8998.c
index c873b4509b3c..a2c946edcd1a 100644
--- a/drivers/rtc/rtc-max8998.c
+++ b/drivers/rtc/rtc-max8998.c
@@ -299,8 +299,8 @@ static int max8998_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8998_rtc_id[] = {
-	{ "max8998-rtc", TYPE_MAX8998 },
-	{ "lp3974-rtc", TYPE_LP3974 },
+	{ .name = "max8998-rtc", .driver_data = TYPE_MAX8998 },
+	{ .name = "lp3974-rtc", .driver_data = TYPE_LP3974 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8998_rtc_id);
diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c6ed5a4ca8a0..aa706074ec3e 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -807,12 +807,12 @@ static int s5m_rtc_suspend(struct device *dev)
 static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_rtc_suspend, s5m_rtc_resume);
 
 static const struct platform_device_id s5m_rtc_id[] = {
-	{ "s5m-rtc",		S5M8767X },
-	{ "s2mpg10-rtc",	S2MPG10 },
-	{ "s2mps13-rtc",	S2MPS13X },
-	{ "s2mps14-rtc",	S2MPS14X },
-	{ "s2mps15-rtc",	S2MPS15X },
-	{ },
+	{ .name = "s5m-rtc",     .driver_data = S5M8767X },
+	{ .name = "s2mpg10-rtc", .driver_data = S2MPG10 },
+	{ .name = "s2mps13-rtc", .driver_data = S2MPS13X },
+	{ .name = "s2mps14-rtc", .driver_data = S2MPS14X },
+	{ .name = "s2mps15-rtc", .driver_data = S2MPS15X },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
 
diff --git a/drivers/rtc/rtc-tps6594.c b/drivers/rtc/rtc-tps6594.c
index 7c6246e3f029..2cebd54c2dbf 100644
--- a/drivers/rtc/rtc-tps6594.c
+++ b/drivers/rtc/rtc-tps6594.c
@@ -485,8 +485,8 @@ static int tps6594_rtc_suspend(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tps6594_rtc_pm_ops, tps6594_rtc_suspend, tps6594_rtc_resume);
 
 static const struct platform_device_id tps6594_rtc_id_table[] = {
-	{ "tps6594-rtc", },
-	{}
+	{ .name = "tps6594-rtc" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, tps6594_rtc_id_table);
 
-- 
2.47.3


