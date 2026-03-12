Return-Path: <linux-rtc+bounces-6181-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJs/Oox/smkcNAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6181-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 09:55:40 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407926F41A
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 09:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE1E031632F0
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Mar 2026 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB0438CFE7;
	Thu, 12 Mar 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5x3kQ7m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA4638AC86
	for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305618; cv=none; b=uIV5MvJnQFXdLSXRYQ/A2Vg578WSR0JIIHs3mRwsgP2hbqwIconWquF+mW94TG1rA/ZKVMoGQABTbvykQ3AQNOTgIDo6zSgbXAsagKy2bApgJuG7IrJSEQ2+sSlfrofdjFJQJToh525krUP/QajIHdIEA0V8frRKjrjLl3orq3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305618; c=relaxed/simple;
	bh=OCqMqTV3Fk0GHlGjVJ0UFzNI1DHV1XFUgzJgSRR9AZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kX3gm9tYMDrwAMzCA4T7vdJdEPAZ72/H7BN1cRT/1YnUdyS8PWVwv0XJBQYZnQrTwQOt21iMnESceaQV8hK9Ew+XB90GjPp6FELiQfQsKQd7d8wLSJLWIGXAuYYJAurW0kDs1n0rE2ABmclrz0RBdZAR7DXbA3K33HkjP0C6OQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5x3kQ7m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852ff06541so7676105e9.2
        for <linux-rtc@vger.kernel.org>; Thu, 12 Mar 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305616; x=1773910416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=O5x3kQ7msFNDjWpbWi8Fq2jQgBplW7GX6/rbZs7RuX+srufoy0h4ikXCbbpKINbGs6
         04DUlWvgI4EFP5MXdujfh1Fu6u1x84tByc5cXoF7tll3+iuw+WzMh/bA3TP1rE7bFQ8F
         G5Toa7k32shC2Nxw8/rlMPEE+WlTsaWhC8hI2s0NZ4pHZkKo4H9kSud5b6Q8z2Q5CXGK
         rlq6Rh5PY3lhqavFk0mdle4fg/wFDWSErXeftNETUG81ERSj1CT6bPXF1GnOydOJW4ky
         tU49grRSNu76K94iVgjmZ9mEy3eZkJLGMec1r/EdA9/FiFXzy7HlaprbDHkElKzUC2It
         DO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305616; x=1773910416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=KJKWWAlPqiYouTI8OhKrBH38nP/H0CU5pkVZOIRdjr7NqKBMQvsQ33hQAyndTLZvrv
         hHfzL5JsoHo2/2IaEVzN0R+kTmvi2WyIKXceMyUNVpxP5O5IGlmMwq9H2Mw3NFL3n8au
         GZ9jiMUARkRD7QIs0JW7HsMrC+0ZcO+C9tYeT/5EByVeVvSPESDxCAslyX+kMXdAxIk5
         2uRseRn6dRm6fQjZvHjjpomPvHM3FIRfbfceh8TJlw6dTb41qHuGFxjF+VP/pTfiue9X
         f5ghaN5B+P4poeEPNGQRKtmCv7A5IvGsbe/qcl6BpvbyXbvSDMRKdMZNQa74+A/SznpG
         Xp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAFkP3hcWWySGpPAarQAFrRxwvK/puT6krJXUSMxTeVmmXSGY3if9gXWIrixA2DkG4HcRi8n01zg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBr3mJ2W57wZBA3sxMNzNk4UiY8SmcEzDmW5SSTZszXQGQKAFj
	PWgDmbV5ObKIaPWe2uwstJsn5vHAgkfmMIt14YG2E+xom4ccSJRXrgIg
X-Gm-Gg: ATEYQzwl3JQPbI3IgJdG32fiPoDeTkxfVbqJ5SMzYFeeswYITqVlo6ZFd83U78z+pRc
	ydH+1IdfIrr5GN1HmeUG2YXd6BIdyzhxRuGpuIQ/6i+YzfASVelp4AeQI1u3vojwt8nVMRXHfbw
	vmLZX6/ol5i9sfgN+bRGV79BF4P+s9389Fi/moQUuJdCvDyitRhRKYtk+S5YgXGNj2LpdBC2sPw
	3ZurxFq3lxs5/sCyDOlCe08EzEfT5P+rKYuRuyKPDEmEqJO1eMhakkuckZxLX3nOonOBae/RGoL
	b2Vc3G0UvuCUF8p8kpfhw3+z6r24rbrixOvhmQhjUqjN082M9B5fgF3w+YT9TkqLFv4tT/Ay2sN
	j718dbQldgw0lpqraC1Uu0ZXAHREHkPEzdCVxnb80v7B2Xu3JlRWk6S6S3sUOwo7Nd3sbkEpgyE
	dvooIhwgngPosy
X-Received: by 2002:a05:600c:4fd6:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4854b0a555dmr91969175e9.5.1773305615537;
        Thu, 12 Mar 2026 01:53:35 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v4 5/5] rtc: max77686: convert to i2c_new_ancillary_device
Date: Thu, 12 Mar 2026 10:52:58 +0200
Message-ID: <20260312085258.11431-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312085258.11431-1-clamor95@gmail.com>
References: <20260312085258.11431-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-6181-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9407926F41A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/rtc/rtc-max77686.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 69ea3ce75b5a..3cdfd78a07cc 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -686,6 +686,11 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
+static void max77686_rtc_release_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -713,12 +718,17 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					   info->drv_data->rtc_i2c_addr);
+	client = i2c_new_ancillary_device(parent_i2c, "rtc",
+					  info->drv_data->rtc_i2c_addr);
 	if (IS_ERR(client))
 		return dev_err_probe(info->dev, PTR_ERR(client),
 				     "Failed to allocate I2C device for RTC\n");
 
+	ret = devm_add_action_or_reset(info->dev, max77686_rtc_release_dev,
+				       client);
+	if (ret)
+		return ret;
+
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap))
-- 
2.51.0


