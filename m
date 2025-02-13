Return-Path: <linux-rtc+bounces-3196-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B77A350C9
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 22:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105E43AA442
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 21:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD84B2698AD;
	Thu, 13 Feb 2025 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo1GCYyI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086D269837;
	Thu, 13 Feb 2025 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483828; cv=none; b=HwV36WOB3n5VnJdgZWx0fiX634UmREKc5DdCBZtnnuFHGd3hSpwyONiUXKNsi0FrrBMND+QJRgoEnZ6Np1rgChfg/CrNEAk1BJNcfOwRPtfvMEdrqaZ1euOC+KL+J3mrXpZ0QOWZmG8O9Xz1kJSlUWVcwSVxzeN7LuwHj97Kq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483828; c=relaxed/simple;
	bh=nMH8RpVPPDjuHL4kqWt8ZxllbsjE47OlV9xxxE7dtnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jqhx4Op/kx6xgIazyQ/2BkOfrV+BN5sjkAgqHejeBEdIHfqopolfALezUW6I0oQ1OvotZmOivr2CXVfv5AZZ6JWv7ux9ypjgWIeblfXr5HztVwwXX6/PddF1dEUMsIc9pkPKpP0KJo8I+A9LdFVsN8++I2XsbiwHhBPya4Ob8Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo1GCYyI; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7b80326cdso262155266b.3;
        Thu, 13 Feb 2025 13:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483825; x=1740088625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG6py7yu0z9B7maNjhp2/7SOVI/QwUJmvU/x6WtNkGo=;
        b=Vo1GCYyIsi1pS+hcL/jhI3uWGSH2R4yNpCv4d2h5Glsls8PHfMbLcrY3LQZu2lIWZC
         INSXodmzfKF0sRic/wrcHGF893DMVj585sWHocUD7CIT3hFIfkkm9EwkEtVklMUnwQoP
         0Isn2fSmaimCEBe9/Kk575DqgY/KbovILTId98aife/U5K6KY9VZFBobotXioRhiXfbU
         QDpDFh/FNbufOe7Q78dfXhaxhmaA+KTN9DC2QvA4ctBox96op3h+VTUkE7hhdFlOtNFf
         fHVJCfn6wrVDUQy9bUZU88mDLdgGVvrRmMj6EUpahdN4n9wQj0V4Rh2+NGYva71R55XD
         p38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483825; x=1740088625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG6py7yu0z9B7maNjhp2/7SOVI/QwUJmvU/x6WtNkGo=;
        b=jeLr+CbQfCLV4LiJHLk/2VG6116oQg+9+quBYkhaUYJrKMgN6TCgSSqM8HbBf7gADD
         2jsLcRiKRn8vTQf3wKRPEBIJ2tTLpdPMx+EeJbleqtEc9ceug17BwIyQGxByzTu1qUsU
         8erJv21MI1sG6r4aEFRMfyoLbi9UeG6Rs5GjZ76pvq98x1kpcjNsAluE3C/Swv7e1O4X
         /0VGVc0MEJsc4qs24LvikZUb1MdrygFtKzaWfZ+49vZlZGuKFq5KWFmaxf8BECjIzrQi
         PDgsQ63UeozHm320jcuVS2WYtscHrUaGQe8gVDzl7WAcQ6cvxyEepAt+9qs5DL6Jybbg
         nsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWr0ppAwwItUD0/Jz7U7q04LqZEc81mxp4yLJ84wSQyI66uBUyL/SbQEPa2ZtWKsYRmYEJdeqYRLeN4fI=@vger.kernel.org, AJvYcCX67/Fn/xede+kNAFG3Rs56VhXXTgYBsnCmTMQss/mVdmGpqYPSiVf3o+a0E4PY9TU63sJboM9TXq/C@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4CuH6bUbuhubamKmKucCnuCZfUa8gG9oGwzO72F3dR/npmBng
	pfZNbNolUyH+HtQyrby7VPSnocF00OKxYd0VzVeXt8WrMT6tFZoVZJ19oj7E
X-Gm-Gg: ASbGnctWmplhGCtgbFwP4VQ7BFCJIQAXXhHrqy9osweb9JnFfSrSEVIW2w3NG38whOT
	N3bQtM+Av9kK+AGFXxH30399lOecoYPaVy3H0DFLaXoiMK5bmKwkC230dXhQVXF4f5r5/bQsOXB
	0R5Dr5NkLwGnXNTJdeWvCZ5Rselr786svmXmqVIHiR2kZ1YydE5+MuEeSUfINcpVZAXdD8OYCyG
	u/QAWNSnpBvpF8eNKyQBssLL8UHdbE+b5pFXoQimo+E3eF3W/g0jWDpIIXtXKpLDDBIblZRj0SW
	vmztjgbZKYch9qNx4y5UyDHd4lUs
X-Google-Smtp-Source: AGHT+IGZkO+tFWVJ/XSuIahWDkoxtDrJAoFaUbSRaWC5deMFCkWx1eq6xUWev2dyvM2gpdCMvuD1Yw==
X-Received: by 2002:a17:907:944a:b0:ab7:bc17:b3ae with SMTP id a640c23a62f3a-aba4ec15dffmr550867166b.34.1739483825104;
        Thu, 13 Feb 2025 13:57:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 3/3] rtc: sophgo: cv18xx: Add restart handler
Date: Thu, 13 Feb 2025 22:56:47 +0100
Message-ID: <20250213215655.2311793-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently provided ATF firmware for ARM64 Sophgo SoCs is binary-only.
To make Linux independent from this binary firmware, provide restart
handler triggering COLD or WARM reboot directly via RTC HW block as
alternative to PSCI interface.

Handler priority SYS_OFF_PRIO_DEFAULT of 0 is desired, because if PSCI
is indeed present, its priority of 129 will override the new one. On RiskV
side the behaviour is unchanged as well because SBI SRST handler has higher
priority as well (192).

Tested on SG2000 in ARM64 mode.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
v11:
- patch introduced;

 drivers/rtc/rtc-cv1800.c | 51 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cv1800.c b/drivers/rtc/rtc-cv1800.c
index 5c30f7388983..586d7195f1f4 100644
--- a/drivers/rtc/rtc-cv1800.c
+++ b/drivers/rtc/rtc-cv1800.c
@@ -9,17 +9,23 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 
+#define CTRL_UNLOCKKEY         0x0004
+#define CTRL0                  0x0008
 #define SEC_PULSE_GEN          0x1004
 #define ALARM_TIME             0x1008
 #define ALARM_ENABLE           0x100C
 #define SET_SEC_CNTR_VAL       0x1010
 #define SET_SEC_CNTR_TRIG      0x1014
 #define SEC_CNTR_VAL           0x1018
+#define EN_PWR_CYC_REQ         0x10C8
+#define EN_WARM_RST_REQ        0x10CC
 
 /*
  * When in VDDBKUP domain, this MACRO register
@@ -28,6 +34,10 @@
 #define MACRO_RO_T             0x14A8
 #define MACRO_RG_SET_T         0x1498
 
+/* CTRL0 bits */
+#define REQ_PWR_CYC            BIT(3)
+#define REQ_WARM_RST           BIT(4)
+
 #define ALARM_ENABLE_MASK      BIT(0)
 #define SEL_SEC_PULSE          BIT(31)
 
@@ -160,6 +170,29 @@ static const struct rtc_class_ops cv1800_rtc_ops = {
 	.alarm_irq_enable = cv1800_rtc_alarm_irq_enable,
 };
 
+static int cv1800_restart_handler(struct sys_off_data *data)
+{
+	struct cv1800_rtc_priv *info = data->cb_data;
+	u32 reg_en = EN_WARM_RST_REQ;
+	u32 request = 0xFFFF0800;
+
+	if (data->mode == REBOOT_COLD) {
+		reg_en = EN_PWR_CYC_REQ;
+		request |= REQ_PWR_CYC;
+	} else {
+		request |= REQ_WARM_RST;
+	}
+
+	/* Enable reset request */
+	regmap_write(info->rtc_map, reg_en, 1);
+	/* Enable CTRL0 register access */
+	regmap_write(info->rtc_map, CTRL_UNLOCKKEY, 0xAB18);
+	/* Request reset */
+	regmap_write(info->rtc_map, CTRL0, request);
+
+	return NOTIFY_DONE;
+}
+
 static int cv1800_rtc_probe(struct platform_device *pdev)
 {
 	struct cv1800_rtc_priv *rtc;
@@ -205,7 +238,23 @@ static int cv1800_rtc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "cannot register interrupt handler\n");
 
-	return devm_rtc_register_device(rtc->rtc_dev);
+	ret = devm_rtc_register_device(rtc->rtc_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "cannot register RTC\n");
+
+	/*
+	 * SYS_OFF_PRIO_DEFAULT of 0 is desired here because both RiscV SBI SRST
+	 * (prio 192) and ARM PSCI (prio 129) will override this one; this
+	 * handler shall serve as a fallback in cases where firmware is not
+	 * present.
+	 */
+	ret = devm_register_restart_handler(&pdev->dev, cv1800_restart_handler,
+					    rtc);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "cannot register restart handler\n");
+
+	return 0;
 }
 
 static const struct of_device_id cv1800_dt_ids[] = {
-- 
2.48.1


