Return-Path: <linux-rtc+bounces-3694-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D6A74B59
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EBC13B4E67
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF70C23909F;
	Fri, 28 Mar 2025 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/Dz7krH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9A81F9F64
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168682; cv=none; b=ctiRZOBaPHlkq88yOr/6naSBFSIIca7rwZyeo+bwpF2tbBe/5urxAOx0bwUk6Ao3yiB+mTilp3QjyBGZlwElaCTQw3TFHFaMTUEtxo0fBZaeWAEwNdtl28oQSYDFD3mKNLnnANFTZoty1kMw6Gnn6eXbT7WymKvCnrQhbEchzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168682; c=relaxed/simple;
	bh=oM7nIChVy6AnX102peSIS6No2vZfRMNewLZjt/WfrE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgoPaL+dJJJLIJOnjcQMOCCrTgm8r063ioVsuL912HctME85yr5o8dBWXHLralbmVxHi2pPSezsWRhFki9uQ89aglCh1ZmmHqs5rVyyQ9pPfUaOmVTJognqc/81OzYvBOM5f7gL9X3q8YJZc6qLgRlBEKOUhy+YRclVpY/H9S94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/Dz7krH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so3986440a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168670; x=1743773470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=h/Dz7krHtN0w9o/IOClhkmZijx7OtzSMyotcInOQrxRodXDX+Qz2ndUVAlGCBevzKK
         3BZfFMMOvjVJff1X2bNSDFui2vy0AjqY7aa0D2/3GW10OT34B4Li+LcS9t8d29mzC6QL
         b5S0eRNeldL63/L+8Ui5WXARXi4KvIfr4Znlc5Uvp+JaP7t79hMWzsHvPKP2G4qn6O5/
         DREiKF4FWVArUSTzB+K0wxm719HutQZU59Np6EpzhPlJfV8pjVD7XkwYseI+BzgxXpAp
         +xnygv8a/P6u6yb5WauppZ2MQJn7UC5KyMi9ci6hlMJz2+MK+sNyCWKu8BVvinEDQezk
         0L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168670; x=1743773470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=D+XFg7WDyuN+xvN/2O6XpfFB3WDt1FdXs6X9Aisqw4ap0KSgsKgQZRut5B4/P485FE
         k0nC1uT8z8IUPUqbF94uqYOcyN+PDDgDKsiqnTEJiPPZskzjQRy+VXKPve+tr4C9r0p4
         a9qk+zmlbcIeFLOxY5vTtHIpggjv2ZrduUMF6Vhacgo9JMYXYNwcxGfjbBrEpX8IbFAY
         SMahWSNtmqTcU2k5/sIYkyU6nQOuntwYluAbjoP7KtAQZcmFKH2CZOJ/sg02TWOjjtgr
         bOyRUXvfEptXlWik64mSPGa74pb0vePBhBkR0ih4REG3zX51R5U8i7RCF+HVMaktlnF8
         UF2A==
X-Forwarded-Encrypted: i=1; AJvYcCVYk01armj9gBQ8v0RRUsOY4KpRag1/QsKLWJT4Z1fSP9N2MOvIxNnfV06/qGj4n+EAjkIKEtS+pWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyol5DqiYRpXWtZUlTMQz6CwdJ/SnImSLh7UTs6xgTnmiZSrkig
	ChE9TiHzvmye/kmRssugkvqHa81xkRshSQGQN2q66SK++Lnkb712VDz90KGxMz4=
X-Gm-Gg: ASbGncuEddi6znUQ9A8NKWul3+zLTPBNHZbj71e91UBJzBCP3XumJpB9SsIicSXpDCJ
	OSnJ7ACJdQCj3hM0Or7SftdNlFedpnarCqgDhVMoZwzasKrp+K4oueo8zHXiUiJ/yECpAtKmPcK
	EpsOFRWFLCuTxsFP2PrbUphZWcRPJvjpG7LAjH+CEO2/pgV0sqYTk5GRQb6vsNaI9pwuf7D91eT
	t4vj7rpt8wvyLgfejMJW45JCAJSt3jbK4ONoWxVfSd2mNe6iCC1YrSfu0sea3SJWKKBS9GdoMvv
	2I2JilhRp0W9FP2FZ5BILMzvA3Yr722mvcQVZkGnhoNh0s7KXiZpi49ptuuLl2WbDRKww26KoSG
	+gOGL5cPuI3KaWpsTCRFkBy4MmONr
X-Google-Smtp-Source: AGHT+IHYdNpE5Oaiy98m+ZWWJjpn0kB8pbikHk0ZcUltpSgeHSv0me+ylZHKLUVEOgvnZGzJh/notA==
X-Received: by 2002:a05:6402:518d:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5ed8f3fd122mr6775177a12.23.1743168670150;
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:16 +0000
Subject: [PATCH v2 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-30-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.472.ge94155a9ec-goog


