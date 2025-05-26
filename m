Return-Path: <linux-rtc+bounces-4162-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5ABAC42CD
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 18:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A307A49FC
	for <lists+linux-rtc@lfdr.de>; Mon, 26 May 2025 16:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FB5227B83;
	Mon, 26 May 2025 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b="log9DSDf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD6223706
	for <linux-rtc@vger.kernel.org>; Mon, 26 May 2025 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748275989; cv=none; b=bAt0IR8poSro6phhQ+mDf3inEnVe2fZ/ltrDzbOaINZGALA2ikV5JGQRHbHoqstwFQFAjGdr8+LDO1d44H+3XWs2uYa0rQ4tfzQV45YMGlKCj9ulFw9eAqcI4iINsLpBU2kEBcdTTslBLIwmRPKdgkJYdwQqek/sXhv2ju9cLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748275989; c=relaxed/simple;
	bh=NI/OMUec2usdoLBvlfF1jggeIGrfCEBPdwkE8290v6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tPHAmZfJhYx2oFIc9U3vuHaQ0kPBNIFZn6zxbJUtxsyatXHfRQqm4m5qnUr+7Sfu4DiQq9WsXJPVn8nTPCBtIHwyuSFilIcKYWUYlZU6dSw0ezOJm8x63ifSYmTTOBPDmAiEjq/Q7OZRKxy571fkg298OUYsxWUX/boU30ssR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc; spf=pass smtp.mailfrom=sferalabs.cc; dkim=pass (2048-bit key) header.d=sferalabs.cc header.i=@sferalabs.cc header.b=log9DSDf; arc=none smtp.client-ip=209.85.128.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sferalabs.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sferalabs.cc
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso14765625e9.1
        for <linux-rtc@vger.kernel.org>; Mon, 26 May 2025 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sferalabs.cc; s=google; t=1748275984; x=1748880784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsS+0LtRwDL05ZQn//FChAFOcAReeJDC/8+kYOO8seM=;
        b=log9DSDf7WzforFJgsOhL+VJF0M70vmOJtMY354+9btEzOaCmmH/YZiKNc+V2BalKx
         34oVIkponN5GD1SkYjsqUz6OSyiTOqP4V1WJEYRrNOgnzoOA8uVD0qfGxUh7qVT7ryu4
         E7m443SqSWT1IkKtSZsezzho6UVekiSDj378dN35xLInFjLE9AFwrB2Ef/TSV//Lm3pl
         bB090eoRM4M7hzT1SeArNTg5JP7rAmnrnjWu9QMJoCqSfaPm2CJy/TcrujjdU+/C9Nux
         SAFJyj8PiKzKIYeR0x60iJfI6ll2/lHCyeGIybh1QFHLbnIemp2KWHC+NiQ16WDDBf4s
         0+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275984; x=1748880784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsS+0LtRwDL05ZQn//FChAFOcAReeJDC/8+kYOO8seM=;
        b=IiM4VGCIOZSWC4Ax5uCJwhMEaUOrmCMGfAyCw2Oa6v4M4M0BTZDhOnhuoi/T3jSeds
         TXDc/4KjsOBsIymmzakrvOkqB7Zf1p/+zuU/ITE5T9dWIb9JBsjfX7YCIwnnL/aGoCOC
         l9sQpHiaCszTx+QiSnr79KWul6JfDwPlP3K1IbuuDB26/ieZ+maE9mCbXkNqUO8q3yy+
         uEYAXgA4gp8nn4210+1398DTbGHEA2cy+Hbh+ve7r+tyhFkXRPNpXPZBMIJIgsHdU4Pm
         2YC+1ycbhX+3Yzqt4N78398yWcwvMLPLhsidV/rEowPtGTOrnDyZyBMWlztyAC8sSIwk
         Q+mA==
X-Forwarded-Encrypted: i=1; AJvYcCWYLhHYaxXWTHudSh/qYqRSMHZzeQzYAl4w9GY7nqx4YzZ5jI/ohrrT1uNk8dummyK5UROrREpmpjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YynACoGpFeRvVD5KHPyGMCnj4BalUsma25JBgKPOtQ6NGNiKU4M
	jaJ0BPqJZDTsZg604MSCkIoGBLFzICsBoeZROKpXJZyHSqnUA6/HyN/0/2VUgZApdWL2ukYfdN5
	MfA+8i+SV1i2tX1vQi7dn06werY2AmGLkh1VV
X-Gm-Gg: ASbGnctBtPg9m60vlk2vg+trmh41a7q9yO2F8d2Tb4FJfvm0o7KqPNL3bXFIQQi7EOO
	CkzMHZJuMH9Uwor42CPUS1wEvhpMAeYgzUt5TJXUYpRNVRdOpbYZn5wVh/obNKRkaFs/x3Sl6/L
	9r7JGe2nHEn1bp/CCWL7yiQOQJrDlu3+s6aQTJjh1YdhMybRrz41JjveuXCFRrQ+cd9eMRMI90p
	o8eNokcP9muoKbXAwEe9w8/FOfhkmFeAbBB54PqcvwJgppGH4pZ+Hw9RvB8GRJtj1on6YSM5jhp
	Qw0mA3ohF7l7SV2RtqY/MVfoZLkUyCdtLVUZbQH/ETAia4dBo8Qseymu/MzR0Ejx1zzY
X-Google-Smtp-Source: AGHT+IH0g6FE2f7zN/oIK2mWRyULJDNx6nM32OtLWp8hn/k3j7zaBjmvWmX/XmHRj3KLDTbwO9NBV6wS4gic
X-Received: by 2002:a05:600c:8283:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-44c94c2a4c6mr87142115e9.30.1748275983808;
        Mon, 26 May 2025 09:13:03 -0700 (PDT)
Received: from localhost.localdomain (net-5-89-7-58.cust.vodafonedsl.it. [5.89.7.58])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-447f1fe4fbcsm14730775e9.12.2025.05.26.09.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 09:13:03 -0700 (PDT)
X-Relaying-Domain: sferalabs.cc
From: Giampiero Baggiani <giampiero@sferalabs.cc>
To: alexandre.belloni@bootlin.com
Cc: Giampiero Baggiani <giampiero@sferalabs.cc>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pcf2127: align power management configuration
Date: Mon, 26 May 2025 18:12:34 +0200
Message-Id: <20250526161234.13236-1-giampiero@sferalabs.cc>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PCF2131 comes with the following default settings:
- battery switch-over function is disabled;
- battery low detection function is disabled.
These defaults differ from those of other models supported by this driver.

This commit aligns the behavior across all supported models, configuring
them to the settings typically expected from an RTC.

Signed-off-by: Giampiero Baggiani <giampiero@sferalabs.cc>
---
 drivers/rtc/rtc-pcf2127.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 31c7dca8f469..cbdf7f23e6a6 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -1312,8 +1312,15 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
 	 * Clear battery interrupt flags which can block new trigger events.
 	 * Note: This is the default chip behaviour but added to ensure
 	 * correct tamper timestamp and interrupt function.
+	 *
+	 * Power management functions set to:
+	 * - battery switch-over function is enabled in standard mode;
+	 * - battery low detection function is enabled;
+	 * - extra power fail detection function is enabled.
+	 * Note: This is the default configuration except for pcf2131.
 	 */
 	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
+				 PCF2127_CTRL3_PM |
 				 PCF2127_BIT_CTRL3_BTSE |
 				 PCF2127_BIT_CTRL3_BIE |
 				 PCF2127_BIT_CTRL3_BLIE, 0);
-- 
2.39.2 (Apple Git-143)


