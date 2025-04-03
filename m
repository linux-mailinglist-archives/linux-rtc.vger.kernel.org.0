Return-Path: <linux-rtc+bounces-3757-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A057A79F6F
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 835F93AF0F4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ADD24FBF7;
	Thu,  3 Apr 2025 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BjAy18u5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF924BBF3
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670771; cv=none; b=kWMC1MBgM8dlHV5urpO7KHaUo9OgauE5zoj5fQzmSlAEIYZ+iRsFig05iuKWyDYoKRUhylsXdnu0+wv0kCj/qwWZglAKIF/5R3Mo+t0xsHjODCmznfqKmKJ6IClNJ+4Fkb57imiUYqdSV8V1otDUHCdd4zxN9PCPxTKe09SntV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670771; c=relaxed/simple;
	bh=GESUUSr32C5v+JmyTkWMyaf4NO/174Vzhegyb1L9aRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGHnURa2i4E24KK/fJ4XFlGduJqnwuvkrqzt8S0oniZ/EYzDlM2es5egAyTAZbjp+YmI7jLzRliJXy6Uc0segLzgAnaZUziAe2B77Tt4pJrZC6ae17m3rf0+f0IEikf79kGTjDewf0dnSqQqbnv/2YQ/iQF7JHnENvclB0gfMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BjAy18u5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so1282938a12.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=BjAy18u5MDej46oSBLQj9uVL1Sf6Rm4PoIgfKOjGinEeCUa9eopc4vUN5LTSw8eQ0O
         KTh/zspz9CGcOj4RXCBWPauFPj5z3+7caeFdcB3iMMHTiztBuqFll3G82TeCMsHP0uoO
         gRk/E6nTEEj/R+RXpo6u2RaPjb/3UGgr0PIugrhU4jbkxD1zmJ10jfQU76aLRnMq6liz
         wnRlZGQfZF47MrHsz/ttO99IjC19HSV+bATLwDazmoLahCcuXevWH71OM259jXhQTN+z
         UKI15hg7XN9Lf80ZWYNViOMEuCHA2wyOsXw5lVRCisF8y43b2auBJXwzz9Y3lNWV9Np2
         +wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=uNvdixD006ASgkCgn5ByWFw+wj3doJRnPibS1ePLXGpZqrtVIeUY+oIW+b0Ol4ApEO
         K9Ypawtm3/Cfit52b6ozNdxOK2yapwEBNzaiA8sG2q2EeF8fvaYo29uk28d/Cge/BsAn
         AHmJofI8Gysv3N5YQ45jR2Ze4gM7dGtBT3eMvDrhW3P469ZgEfbaFL8AdGL7Chq4i3iV
         k3483N20S/TZxrdb7QwJIMiCH+c6axfn83y3bl7YYJhuQ/2nTF+KyzCHr1SWAElp1krq
         Qh3q2/iq8wHWeaupFjIRD9TYgLmJcH8MrwbA+XRRyucX/zNbg8BohxZwDS4PbDNv/x5A
         M3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVouyBn4NJLIQfftkMScwHO5OWciML3Z0WQHutG9CYpFfIWBTC8CSgA1k6MsVLDERmLFDRTEuN241w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDE48gtAgNDcls9wyrTvx3ADfsztttUfZtWdwy+0dHBMSdvf3h
	gtSm73UcaUi/SmzPLtUIhyo9YG02I7/1dYFx219gQKlJ5O1kYjUWDtto+Hcmhzc=
X-Gm-Gg: ASbGncvI6ocHKd82sB8+y6uTD0Wa04opFV9SRXPYshwqPrgirWEoCv8398a8FCaSHny
	1PEUV+0DhhTp6qw+jsnUCZd4hVeEGArQzpL6VWywgM3IFOWU24zMwFIQhU3IGl3VUppxDM7RPSs
	kwFN1JFS5P2nASX+JM/w8RV+nPih9JjnTCpEMDsRvi144qXxw6mLSGgxZ63mlpj3LQTc1XtED6n
	wPM8I5oetWtfOUrqI7bSwyy8V6TpRwpy2bNjx0WebCTeJzVlohT0R46YrHc3UBtilLIoODVdkDw
	jemoGPZqE5d8Oi/3JzMI1B/96hN1+o0o5ShtlIb2+Tk+8pQPjh8jaWbQraEaFGR185YqXAeB11s
	7TYv4tn+O32vAjDNxKtZOBCWcp/LU
X-Google-Smtp-Source: AGHT+IH778midZRWwNsQwTegqpsc1cU2/xzEiQMSkFa1kd7UfUZDcEcX+jZvLbDF0curTDRXNPPiPQ==
X-Received: by 2002:a17:907:3d8f:b0:ac7:81bd:60e3 with SMTP id a640c23a62f3a-ac7c0935350mr136224366b.27.1743670758907;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:23 +0100
Subject: [PATCH v3 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-31-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra work in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.472.ge94155a9ec-goog


