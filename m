Return-Path: <linux-rtc+bounces-4290-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36AAD73F4
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Jun 2025 16:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CDE169222
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Jun 2025 14:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C57246BC9;
	Thu, 12 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="Do0VcHHd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f98.google.com (mail-ej1-f98.google.com [209.85.218.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52142048
	for <linux-rtc@vger.kernel.org>; Thu, 12 Jun 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738830; cv=none; b=oUG8K/fal+ZB/1AcgXgfvSX0HQhEVphHI1im7s6XzucwdsYzr6WDrH/rpfTBNjWxJtEf9DiO+Qf+l9BwT+lwgP4RUE7gV3Dfxm+xc4E2t5QRhno9+xYKpsz2hClVFOFHqb59Mt0NZpF8TbU6PlppCeF9obUXl6ZxzcVCcj/r9GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738830; c=relaxed/simple;
	bh=YSUbtUuizklExpnzU8VpfcNv0fngsTJdsERQci1RWp0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0x8hTXG4X1X0tUdt44c8ReUIMCMteeBJ/gzR7luFrNTJtNgGivn0QYC/cHDzijhXQ6BE0LQSThCbiUBKnBey9NIQeWyhH3YKX015kkF3Pdb3QCwe4qDI91PxaXiW0FiSd/50aJ3rS19mSb7Q74jv9nrLqyHgUx/bRouaAVxNPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=sferalabs.cc; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=Do0VcHHd; arc=none smtp.client-ip=209.85.218.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sferalabs.cc
Received: by mail-ej1-f98.google.com with SMTP id a640c23a62f3a-ade30256175so194518866b.1
        for <linux-rtc@vger.kernel.org>; Thu, 12 Jun 2025 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1749738824; x=1750343624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkFa1Jh0hAp7VXFgDt4c5m6aT1cILx31aOxZ9A4iZ3Q=;
        b=Do0VcHHdwB3mogd0mPbdmhVLLjHHpGY15RIHUCRRjNfRWuzl2gPeDz45UkPCdO0p3f
         ED5hNaB2967Ptt1Spu5kA19Rps6cVEp+NLycDL4iH52RhxNBzlVkKs6PlWejtYvO7uv0
         EmgarXU1KdrI1EbLyRUeMBu/3CeCq6dCs6F/BKPGbd/qgCzyyBxmY4QqmDs6P/091Fik
         0USQ8+Va7hKxFwIAgVqLI1J0m+Dzvd3yPZRpUG8SWNOif0nQCqEhOJlF3eLWuCk3aHGe
         rkUEqvLEnEN3ubvAXdSEK5jPrGtQPEo2qG3B7gsZfZeqGBNbovQMlD+fbvlRLp5k6Mu8
         6qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738824; x=1750343624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkFa1Jh0hAp7VXFgDt4c5m6aT1cILx31aOxZ9A4iZ3Q=;
        b=CvtaCc+6oPDLaibR1IjohMDeVHjLUc/kft+qOurrEUoSmumvd4UI+RPJDD6wmxSRCw
         MKkQtslcPXQcOKWbBdU8ox1vQa4r5gL1B4L43F+4utquBKl3TLZfehNBtzQHC1StbSP/
         mWwVU8UMpXyTJPX7CTFdKA1LYdBSm6dp92mudh+FMOCs89lKA08OLXw/4sDQ1FaTXT9U
         miCGknefzVUXW16Nu3DJQlpspQNkHG6li2uj/J8oo14eo7wgQEvrKKdSPsD4HsUPnmlH
         AeKL6kGlQD5qpOUonycNaSNwKLj//cy9cH9rGUhY8KHdbnkl0oWAAuoGFkm5MIcwsFTo
         qPlg==
X-Forwarded-Encrypted: i=1; AJvYcCWhfN0Dd/3n0WlLthAYN0nCGxwtWtUcqzA1uyau2GgZrsvjgMQ5ullBmTnJdappTljZOhKaQ7hRuEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyYOjbfZMDb/G1aQHnUcu4dZ3Mds/7s0aZs0BRVHfgZvaie3f/
	m1+5uhHgAW2TovZzHmgcKrwrvsfiPlwfoAbrLNrjFM5ZAErVTqOy1acZSm+qVxI5ePYDlh+IroU
	TAxxKR45zuL97hTxrmhI0oD607VQIbh2cOAFE
X-Gm-Gg: ASbGnct4eVwetjAWJrT1tA++qClrlo9Bd7q30/S5nRhfi54a7f2fhz4V0XY6qE18Dua
	hdm1jMnTixkDEaZu6C14Rqi6S3/jMojdjJSpwq5tGkkF6JB2nlzI+Ghx1g0Sc+F1hLZ+NLsI1d6
	eAFro3wVCuTg5+EmjOrcOnBHZPHZTSMRgUFrTwnkeNo/CgxaFBw8GkTazmVw9+QTsgw7+xHQS7M
	kklEqLZ+WiFZ+oIIqYB79ss3zdNpTf3CFeEQkHxioXfGODGoO4H7bSWhmOeC7pC1FhU48A9QQ2j
	xHFSpt1w3oBf8JQZJPYIue5TBYNleG/REWIHq0qaInJSa2MQnseRcN0fo2qVLVXYeTrf/PEqU78
	W3lo=
X-Google-Smtp-Source: AGHT+IGnhKK23yR1xHZZWzF61fUpeG2TlhMWsxzXLzc1dL1xHOAteivntPVBueKnIToEoqjGc4A6kecpFjzD
X-Received: by 2002:a17:907:e895:b0:ad1:fa48:da0a with SMTP id a640c23a62f3a-adea9410734mr337093666b.35.1749738824090;
        Thu, 12 Jun 2025 07:33:44 -0700 (PDT)
Received: from giampiero.localdomain (net-5-89-7-58.cust.vodafonedsl.it. [5.89.7.58])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-adeadb636acsm9220266b.183.2025.06.12.07.33.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Jun 2025 07:33:44 -0700 (PDT)
X-Relaying-Domain: sferalabs.cc
From: Giampiero Baggiani <giampiero@sferalabs.cc>
To: alexandre.belloni@bootlin.com
Cc: Giampiero Baggiani <giampiero@sferalabs.cc>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: add power management device properties
Date: Thu, 12 Jun 2025 16:33:38 +0200
Message-Id: <20250612143338.45943-1-giampiero@sferalabs.cc>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added the "backup-switchover-mode" and the "battery-low-detection-set"
device properties.
Especially relevant for PCF2131 which comes with BSM and BLD disabled
by default.
If the properties are not specified the driver behaves as before, keeping
the configuration unchanged.
The "battery-low-detection-set" property solves the current issue of BLD
config lost when switching between BSMs.
The RTC_FEATURE_BACKUP_SWITCH_MODE is also set.

Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
---
 drivers/rtc/rtc-pcf2127.c | 206 ++++++++++++++++++++++++++++++--------
 1 file changed, 163 insertions(+), 43 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..b381b31b6d20 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -182,6 +182,12 @@ struct pcf21xx_ts_config {
 	u8 ie_bit; /* Interrupt enable bit. */
 };
 
+struct pcf21xx_pwrmng_config {
+	int bsm;
+	bool bld;
+	bool pfd;
+};
+
 struct pcf21xx_config {
 	int type; /* IC variant */
 	int max_register;
@@ -209,6 +215,7 @@ struct pcf2127 {
 	bool irq_enabled;
 	time64_t ts[PCF2127_MAX_TS_SUPPORTED]; /* Timestamp values. */
 	bool ts_valid[PCF2127_MAX_TS_SUPPORTED];  /* Timestamp valid indication. */
+	bool bld_set;
 };
 
 /*
@@ -333,26 +340,130 @@ static int pcf2127_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+static int pcf2127_rtc_get_pwrmng(struct device *dev,
+				  struct pcf21xx_pwrmng_config *cfg)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	u32 value;
+	unsigned int value;
+	int ret;
+
+	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+	if (ret < 0)
+		return ret;
+
+	value = FIELD_GET(PCF2127_CTRL3_PM, value);
+
+	switch (value) {
+	case 0:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = true;
+		cfg->pfd = true;
+		break;
+
+	case 1:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	case 2:
+		cfg->bsm = RTC_BSM_LEVEL;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+
+	case 3:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = true;
+		cfg->pfd = true;
+		break;
+
+	case 4:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	case 5:
+		cfg->bsm = RTC_BSM_DIRECT;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+
+	case 6:
+		cfg->bsm = RTC_BSM_DISABLED;
+		cfg->bld = false;
+		cfg->pfd = true;
+		break;
+
+	default:
+		cfg->bsm = RTC_BSM_DISABLED;
+		cfg->bld = false;
+		cfg->pfd = false;
+		break;
+	}
+
+	return 0;
+}
+
+static int pcf2127_rtc_set_pwrmng(struct device *dev,
+				  struct pcf21xx_pwrmng_config *cfg)
+{
+	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
+	unsigned int value;
+
+	if (cfg->bld)
+		cfg->pfd = true;
+
+	switch (cfg->bsm) {
+	case RTC_BSM_LEVEL:
+		if (cfg->bld)
+			value = 0;
+		else if (cfg->pfd)
+			value = 1;
+		else
+			value = 2;
+		break;
+
+	case RTC_BSM_DIRECT:
+		if (cfg->bld)
+			value = 3;
+		else if (cfg->pfd)
+			value = 4;
+		else
+			value = 5;
+		break;
+
+	case RTC_BSM_DISABLED:
+		if (cfg->bld)
+			return -EINVAL;
+		else if (cfg->pfd)
+			value = 6;
+		else
+			value = 7;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				  PCF2127_CTRL3_PM,
+				  FIELD_PREP(PCF2127_CTRL3_PM, value));
+}
+
+static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
+{
+	struct pcf21xx_pwrmng_config cfg;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_rtc_get_pwrmng(dev, &cfg);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
-		if (value < 0x3)
-			param->uvalue = RTC_BSM_LEVEL;
-		else if (value < 0x6)
-			param->uvalue = RTC_BSM_DIRECT;
-		else
-			param->uvalue = RTC_BSM_DISABLED;
+		param->uvalue = cfg.bsm;
 
 		break;
 
@@ -366,49 +477,23 @@ static int pcf2127_param_get(struct device *dev, struct rtc_param *param)
 static int pcf2127_param_set(struct device *dev, struct rtc_param *param)
 {
 	struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
-	u8 mode = 0;
-	u32 value;
+	struct pcf21xx_pwrmng_config cfg;
 	int ret;
 
 	switch (param->param) {
 	case RTC_PARAM_BACKUP_SWITCH_MODE:
-		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL3, &value);
+		ret = pcf2127_rtc_get_pwrmng(dev, &cfg);
 		if (ret < 0)
 			return ret;
 
-		value = FIELD_GET(PCF2127_CTRL3_PM, value);
-
-		if (value > 5)
-			value -= 5;
-		else if (value > 2)
-			value -= 3;
-
-		switch (param->uvalue) {
-		case RTC_BSM_LEVEL:
-			break;
-		case RTC_BSM_DIRECT:
-			mode = 3;
-			break;
-		case RTC_BSM_DISABLED:
-			if (value == 0)
-				value = 1;
-			mode = 5;
-			break;
-		default:
-			return -EINVAL;
-		}
-
-		return regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
-					  PCF2127_CTRL3_PM,
-					  FIELD_PREP(PCF2127_CTRL3_PM, mode + value));
-
-		break;
+		cfg.bsm = param->uvalue;
+		if (pcf2127->bld_set && cfg.bsm != RTC_BSM_DISABLED)
+			cfg.bld = true;
+		return pcf2127_rtc_set_pwrmng(dev, &cfg);
 
 	default:
 		return -EINVAL;
 	}
-
-	return 0;
 }
 
 static int pcf2127_rtc_ioctl(struct device *dev,
@@ -1181,6 +1266,8 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	struct pcf2127 *pcf2127;
 	int ret = 0;
 	unsigned int val;
+	struct pcf21xx_pwrmng_config pm_cfg;
+	bool pm_cfg_write = false;
 
 	dev_dbg(dev, "%s\n", __func__);
 
@@ -1323,6 +1410,39 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 		return ret;
 	}
 
+	ret = pcf2127_rtc_get_pwrmng(dev, &pm_cfg);
+	if (ret) {
+		dev_err(dev,
+			"%s: power management config (ctrl3) read failed\n",
+			__func__);
+		return ret;
+	}
+
+	if (!device_property_read_u32(dev, "backup-switchover-mode",
+				      &pm_cfg.bsm)) {
+		pm_cfg_write = true;
+	}
+
+	pcf2127->bld_set = device_property_read_bool(dev,
+					"battery-low-detection-set");
+	if (pcf2127->bld_set) {
+		if (pm_cfg.bsm != RTC_BSM_DISABLED)
+			pm_cfg.bld = true;
+		pm_cfg_write = true;
+	}
+
+	if (pm_cfg_write) {
+		ret = pcf2127_rtc_set_pwrmng(dev, &pm_cfg);
+		if (ret) {
+			dev_err(dev,
+				"%s: power management config (ctrl3) failed\n",
+				__func__);
+			return ret;
+		}
+	}
+
+	set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, pcf2127->rtc->features);
+
 	/*
 	 * Enable timestamp functions 1 to 4.
 	 */
-- 
2.39.2 (Apple Git-143)


