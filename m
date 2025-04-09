Return-Path: <linux-rtc+bounces-3881-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F57A83276
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 250507AAF77
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE60221F04;
	Wed,  9 Apr 2025 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chJUj7jt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660E21ABA2
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231073; cv=none; b=NfzRXQBj/iZCrnsXr44hc0+hXXMmPkX9FguUZ/QftuWbDuM+di1FC/QeKFSZWMHDb0LvQH6nZ2wbXx+TveC/IKGx8W4cCPMBkJPCYDmuyujAVgi93YepuqbMpkz0uUTmhwFyLQvPpu94/nCQz97wNGaH/HAK2jYb4lEYuyIsqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231073; c=relaxed/simple;
	bh=6MAg2XALis+Rtua2lDVBlN4I/q6DE1qmn9E7X0+PP3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c67YSE5hwwahfuPVh8dOq1SpSmklaNqsII/uIz6KwKR1Sc5IWYJ/9Nju9ydvv9hauXoMbLj2/WtG0zsax9EhLnUn53Wiq9sxSICLrqLh8qV7VW7zISsPHCHACeMyA4oIYoz4io2UXIfxoQb16XPtJCSwmaiPhCgk/95rPdQqQak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chJUj7jt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso204865a12.3
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231063; x=1744835863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv6T8/JtNiPh/U9srmK1zriSPC7xSek3blAJnMyaQM0=;
        b=chJUj7jt/pif+O5xRFfOatyWKBZw/6diXVoYp0SXWS1x331yT9skOKjatRp4SdNUSp
         cJKmKB7bzAN+2Wze7f8f696SZ29+W0g9Jcv9xLo/hf3DNunDmyQruInM5o4zFpQuQB2j
         mNslGTWvdTbX3tuZTdAJLY85aeovWqypgJuxq6ss+3W7saEcSa17bskOL7SZcrFf/e8G
         2YW05s/0c2xLkLVeI9kasQ14JV5u5sxAhEHuxvx6ozXV6/MtsvkZsOGij+NLoJUNqBMZ
         o7fHpVbcv6uBOPL7FYjUmimL9oIP8BNBwyHWQ6p/HwaNDXr44C3ILG3MwgzxKTc7Qt7B
         E5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231063; x=1744835863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv6T8/JtNiPh/U9srmK1zriSPC7xSek3blAJnMyaQM0=;
        b=EACip6ifj4/TV1BsI8rkCZ7m9rpaK+VLZu/WOsdgUqr8GrEim+gatlrOnPpiIEuHfl
         LudXPl51tGQD8M4mOkpawXbcMeTSF5P8K0qhtieeQb5Q2GE+xBp1joilQcd2b8mGollp
         5xPRdwRXITAlPMdAWYg0IsWVBcnR5MAs/woYAoI3BSQDaOzNuKe1187Q2KYryXn3Pe5W
         ZR0L9hsr8yGZr1mAsfi+xp9S5TGYjnmYMM6jbesvyXn1EdL/iAyNAUvxgJn/fYvXYHQc
         I9d9dLQQFHMFgs2G+f7VfNkEOcktut/NzcimHRWgaByYry5xnQvWwanBGi5h1BDBzrIp
         jhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2WD5PSxi8+7YAljjTwG0Xi1nXnh9e+AFzeZufXAp819KW82q7qaQCdhTuALyIKcgrZqsLj9Lg0ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqQSea2JW7pcWHDXOquaUzzCSgVu1gEmK4LHU71W6/bqJbsypc
	sAnzr3M345ZTC+3htlTJgq1O3oplzMuVRUykdHBgj7Fi8297wAHn3cCTL29otdU=
X-Gm-Gg: ASbGncs3wAs0CDcKdUKcfUu+gLB23P68urZR9csfv9uEDy8+eNCj5T/ilHcypnFWfIP
	kCWFvt5c7t5I5KuEFQWB6cC/KeGxFVon2tjO+rA+jeTdbRS95CK2L9Ql4kHz5+T3Mn3AYo5zvgo
	rMFHy/Ee1RQCxjy2YFIoG6m4ENDADjQILZ4FoDX26OsJ7HHAtE2v3dEOACKoTAOCWzexNM343WM
	Md3a6x22lJW2CAg4FFJppZQyHUtF5+fdtHXlmUs3C3XcPclqJR3lZcPFdeTX80wlBAOo1Yf+5Y0
	blCntpS9kuqHwfr9OsTi9kAcCZ4ah4F+ZT4sB8CwQLGeBrHNQ6fP/qVl+fEyaRo8roytLs5NGme
	2pFwNFUYGYg3y1/8ZEzD67dOiZyhfT8pcnVN/sA==
X-Google-Smtp-Source: AGHT+IHuFxbIJJjU+odGQEb+Z2z7HvoeRr2IGwkfZgpVlPcf92trUW7rJVrEbL1uMQYZ7TzU/wGXvA==
X-Received: by 2002:a17:907:608d:b0:ac3:8895:2776 with SMTP id a640c23a62f3a-acabd12c4b4mr7347566b.5.1744231063463;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:48 +0100
Subject: [PATCH v4 27/32] rtc: s5m: add support for S2MPG10 RTC
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-27-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC RTC, which is similar to the
existing PMIC RTCs supported by this driver.

S2MPG10 doesn't use I2C, so we expect the core driver to have created a
regmap for us.

Additionally, it can be used for doing a cold-reset. If requested to do
so (via DT), S2MPG10 is programmed with a watchdog configuration that
will perform a full power cycle upon watchdog expiry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- keep headers as alphabetical as possible (Krzysztof)
---
 drivers/rtc/rtc-s5m.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f8abcdee8611d1181fb575aeb8d094360538ca7e..c6394faaee860427e8b84e9c6df2d8229cf06d93 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/bcd.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/rtc.h>
 #include <linux/platform_device.h>
@@ -53,6 +54,7 @@ enum {
  * Device     | Write time | Read time | Write alarm
  * =================================================
  * S5M8767    | UDR + TIME |           | UDR
+ * S2MPG10    | WUDR       | RUDR      | AUDR
  * S2MPS11/14 | WUDR       | RUDR      | WUDR + RUDR
  * S2MPS13    | WUDR       | RUDR      | WUDR + AUDR
  * S2MPS15    | WUDR       | RUDR      | AUDR
@@ -99,6 +101,20 @@ static const struct s5m_rtc_reg_config s5m_rtc_regs = {
 	.write_alarm_udr_mask	= S5M_RTC_UDR_MASK,
 };
 
+/* Register map for S2MPG10 */
+static const struct s5m_rtc_reg_config s2mpg10_rtc_regs = {
+	.regs_count		= 7,
+	.time			= S2MPG10_RTC_SEC,
+	.ctrl			= S2MPG10_RTC_CTRL,
+	.alarm0			= S2MPG10_RTC_A0SEC,
+	.alarm1			= S2MPG10_RTC_A1SEC,
+	.udr_update		= S2MPG10_RTC_UPDATE,
+	.autoclear_udr_mask	= S2MPS15_RTC_WUDR_MASK | S2MPS15_RTC_AUDR_MASK,
+	.read_time_udr_mask	= S2MPS_RTC_RUDR_MASK,
+	.write_time_udr_mask	= S2MPS15_RTC_WUDR_MASK,
+	.write_alarm_udr_mask	= S2MPS15_RTC_AUDR_MASK,
+};
+
 /* Register map for S2MPS13 */
 static const struct s5m_rtc_reg_config s2mps13_rtc_regs = {
 	.regs_count		= 7,
@@ -238,6 +254,7 @@ static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
 		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
 		val &= S5M_ALARM0_STATUS;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -300,6 +317,7 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 	case S5M8767X:
 		data &= ~S5M_RTC_TIME_EN_MASK;
 		break;
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -351,6 +369,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -374,6 +393,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -411,6 +431,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -449,6 +470,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -487,6 +509,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -524,6 +547,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	switch (info->device_type) {
 	case S5M8767X:
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -604,6 +628,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
 		break;
 
+	case S2MPG10:
 	case S2MPS15X:
 	case S2MPS14X:
 	case S2MPS13X:
@@ -634,6 +659,25 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
 	return ret;
 }
 
+static int s5m_rtc_restart_s2mpg10(struct sys_off_data *data)
+{
+	struct s5m_rtc_info *info = data->cb_data;
+	int ret;
+
+	if (data->mode != REBOOT_COLD && data->mode != REBOOT_HARD)
+		return NOTIFY_DONE;
+
+	/*
+	 * Arm watchdog with maximum timeout (2 seconds), and perform full reset
+	 * on expiry.
+	 */
+	ret = regmap_set_bits(info->regmap, S2MPG10_RTC_WTSR,
+			      (S2MPG10_WTSR_COLDTIMER | S2MPG10_WTSR_COLDRST
+			       | S2MPG10_WTSR_WTSRT | S2MPG10_WTSR_WTSR_EN));
+
+	return ret ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
 static int s5m_rtc_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *s5m87xx = dev_get_drvdata(pdev->dev.parent);
@@ -689,6 +733,9 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		if (IS_ERR(info->regmap))
 			return dev_err_probe(&pdev->dev, PTR_ERR(info->regmap),
 					     "Failed to allocate regmap\n");
+	} else if (device_type == S2MPG10) {
+		info->regs = &s2mpg10_rtc_regs;
+		alarm_irq = S2MPG10_IRQ_RTCA0;
 	} else {
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "Unsupported device type %d\n",
@@ -735,6 +782,18 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 		device_init_wakeup(&pdev->dev, true);
 	}
 
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&
+	    info->device_type == S2MPG10) {
+		ret = devm_register_sys_off_handler(&pdev->dev,
+						    SYS_OFF_MODE_RESTART,
+						    SYS_OFF_PRIO_HIGH + 1,
+						    s5m_rtc_restart_s2mpg10,
+						    info);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+				       "Failed to register restart handler\n");
+	}
+
 	return devm_rtc_register_device(info->rtc_dev);
 }
 
@@ -766,6 +825,7 @@ static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_rtc_suspend, s5m_rtc_resume);
 
 static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s5m-rtc",		S5M8767X },
+	{ "s2mpg10-rtc",	S2MPG10 },
 	{ "s2mps13-rtc",	S2MPS13X },
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ "s2mps15-rtc",	S2MPS15X },

-- 
2.49.0.604.gff1f9ca942-goog


