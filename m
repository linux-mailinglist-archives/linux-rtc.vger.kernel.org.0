Return-Path: <linux-rtc+bounces-6976-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WCS8GzzuVmpwDAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6976-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 04:19:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56775A087
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 04:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sl4sF5uA;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6976-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6976-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5576F300D768
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Jul 2026 02:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8F73655EA;
	Wed, 15 Jul 2026 02:19:38 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6686341
	for <linux-rtc@vger.kernel.org>; Wed, 15 Jul 2026 02:19:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081978; cv=none; b=deYdL6g9Z2By6qnqvPVpHsVR80+ovKH4+k8WEKrRygMFHK0LO1i8crCp2tLVwzXWUM9H01FJBktsBiVe0W2SXnkdHtf6UnnO25PX0dXhqRNci2eVgvnE/5W202Mb+zF97z3MZgdgb9qP23Dyuv+8KSiTL3YxuVljkLQYQc0+l8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081978; c=relaxed/simple;
	bh=9hNvJLwHoOEou8LLYeKhtdn5GPgGf0qbTrk5z2xNAq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQyKN/JyLEJ5i0STonDq5cFaolTlDnEx0V0ag3IS2w8ohtlcnPEII8i3tIsTnx2itJqDAgGBI7jRQ1aKyBx0iuwBWRTcm/YyBh5Mc3nmJVV+qTLmmQDCK73aV2W33TepFlsfpqrWC6RFhdPWhqTo6pW5wsn/66PBaPgAaasYkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sl4sF5uA; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cae1a3a744so36312265ad.3
        for <linux-rtc@vger.kernel.org>; Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784081976; x=1784686776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=sl4sF5uALUtSIQeKm52rsSwsCMcxl6TVWslB5xdwtMYw73CTiXFfE4uZJAtAvKuzAL
         4L5TwCJE5D/JAqks0MyrHQk23056tEUjKxAu6f5fYtuDHdk8sgi/Mu0YRe99xBpnr102
         +RK8Rf0p6Opz9fpvQK0s1u9m862jaz1A97liPOdkzNESRXn87VH9DhjanwDpfCa95E+N
         W74xAv9F83WYlySInF+aIcKujY6TL8J/L7OWdJjDl6T1SI2gHPto9JBr4glP6CAJTWrx
         s5Wq6BlFNzBo8EPfQpSo+A6o8YqhA6BS615cvsmRhrvUaXY2RQGB0hnc9dBc35/6LZ4A
         fZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784081976; x=1784686776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=HR8ViX/7uy9ud6KIzflIjIJqA3bM+e+JInzk4xRZI3GMoBVu381Bhf3KMlCFieuRNY
         9bLow/8EtncF/euPyW74XVaM4EnGpVxuVHSP+KSXTET7ZWYsxQ7o6TL1YvJGd2cB/t9Z
         UGhJQPzLK8kBauKp3VLSy56ARaplSfutNIPvXghtXvkCcmXkqABwZKO7MEkBS5Wrca5R
         RKH0WrNccnLQAy8/I2Bj95omRGvOyBALPhHFVd5SV7eOqJ4s+B8i0mEgDTZqWoWprQ6O
         UsVTvjLdZaXDQtPwd8V1qZY9kZOR9feflxZwqMmpYOn144mJpcOxzvGpWycosVB1VXXq
         PBgQ==
X-Gm-Message-State: AOJu0Yyzo6tG3+7eFX57c+K4jfuVdoSZUJ9C97C9WUQCtQPZJKqBYOEV
	IGLfJHzbnrDfvd5X5jf1LMyjerKPhA7GIGVW1RB1OrVPp4FuMMiPVYa68FgjxZAq
X-Gm-Gg: AfdE7ckQnAZpQsBuEeAvBc28aDdHJaXOWBNeoFtLGh03W+VHztzjbQlXQQTv3LrrcyF
	E6DjS/IUdKbYHoHLg7axXe4O0N9NZbYj6ShGKUjYsr1XtQNvz4IvQWnswMa4GjKZ6POwVV1w9ud
	wjJ15DMpC54VMGRYDlzIt/wZNDY0VQiDjEC5RwSCYCWzUm5YwoMrcKztXJKs/YAMQHW9dtn4MgC
	oAtFlKPYAqp62IWA5AfmRZzfQIT5otnAJVeeQsSUA+52+rTMiJtVwIUKhlUT0XOZ6a/pXU3NpGK
	5G0HC0zyh1hY37rPeRc8F6tHBgWXJM1D0kGdIrkWyuHcVd0BajoqWJReH4OJU1rOf20GeA9MynN
	TaY/G3DdWIsfpVZM53qEI2WR6dy/soxJ8Klyf/bi0015rEmT8aCh0HNbiCmYeAqBrPPkqdtrhDL
	ndwrinxpGrXsyA/qOe1bPgSSb9ipjVdIxBqGfXcsVkbFVvbJQiEXs/f52pTpjO92X8MXRqC/B/G
	2umscaqQ0cGb91G32JHZY0DwRX2iivzhTyU8uU/9+CO4Mj7M+b/mR0fV48p+Ox+3A==
X-Received: by 2002:a05:6a20:3d92:b0:3c0:9c1a:893e with SMTP id adf61e73a8af0-3c34d8c599fmr6957139637.70.1784081976192;
        Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca7f626fb78sm8653754a12.13.2026.07.14.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:19:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 19:19:33 -0700
Message-ID: <20260715021933.1551663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6976-lists,linux-rtc=lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bootlin.com,gmail.com,foss.st.com,kernel.org,google.com,st-md-mailman.stormreply.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-rtc@vger.kernel.org,m:alexandre.belloni@bootlin.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:nathan@kernel.org,m:ndesaulniers@google.com,m:morbo@google.com,m:justinstitt@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF56775A087

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Built for ARM (mxs_defconfig + CONFIG_RTC_DRV_STMP) with LLVM=1;
drivers/rtc/rtc-stmp3xxx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-stmp3xxx.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..05f128ccf827 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -245,28 +245,21 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
 	int err;
 
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
+	rtc_data->io = io;
 	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
-- 
2.55.0


