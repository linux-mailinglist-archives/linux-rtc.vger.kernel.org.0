Return-Path: <linux-rtc+bounces-3326-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA2A49B51
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5345F1748A1
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF7226FD84;
	Fri, 28 Feb 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHZl1Ad4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1E26E637
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751648; cv=none; b=rPcn3sRpQ5bzJLg6tUWM3gSgtVtVwjVy8DQDwX6/cbP2yfh3PFlOf7CpMz0b5lZICu0mGMjcAHzDQk0ueEPVpwW0OKIP7dfAtw3yfDqgHGUski0NtMSpmZciZMbWZybc+zimYizGH+AckYg/iFgpuLYZgGKueLkr53e+iV9sRQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751648; c=relaxed/simple;
	bh=bdvX1BNhSG2fpjHo2VIxHhZrYGN28llP3/MopMlEtfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn8bETLkjeLhXnBGnMGFhWv5Yw2HgtEPeScqL/MEnkU5OjEQuVLlgpBOnjhgsKaiWwSVWfBIZMdrN1NSbESFXRIBcfEUpYxeRUAtqMilnFmmKGnbt4JurYAJOSAYLwDCcY9DKqL/eoDQomIHES2DDmRYu/viqMr8XbGKGaBPubA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHZl1Ad4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so3586850a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=aHZl1Ad4ompIcur2hu0an/nxVD3UiTx08uuAx9RxwiUJSD8uNxXGbECXAZKfMIlMsl
         fuca+nN4dNQzmapwQI2U9IskXO9UIKHA+UDiOBXfn0chFNjjStaUEgCJ9r8rJxS3Dv+m
         ivtjvL1oK5v9Jg+h4GQFt0ZB/gBHt3UH7ZS25VsqpDPKwv8QkjMrszryqKZAAZZ5Soxj
         pBqCwMEODoNSRthPKRw1J1F2jTjiGy0V3Oss+LvVfYZnBRfLLLagqml4pnvoApOvIsyL
         gCz3YqCCdN3rIyQ6hoyMUAUMKlBoJdEGZPqWERrOfU0uMRuce5FnJ8U9hesUpA34Os1d
         RHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=IM1x3mVFbZlkM33HSkmtnS+is6911VbDNlO7lQ/b5/Uy44RUlMAWdBr3JarIKh+8Fa
         W/luSTLHrzSD6KvVafxWA3abJO23H/lsD266pPYjy3BTO/A51r0sCeAAh3f/cLXidJUk
         oFPfCJonXxrw9SfJ5vnlUDKJZ3eOBEwghx9kvvhDAows+DwdWLR00P8WCrsJJS3hRBpx
         1BiiBUjhWmwr247uhPDWPh9MxkK6niFP5w8SSlWOdbF3BWFnrOIv63EgVo8Qm6A3E/te
         Z2iyTYVbljc1LWt9gtVEFAEVNEkxlMZYFiXwbIKTRpSN2n08xZkIphHAk0A0qqMxGLjh
         xYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoMN5OTxZ1pzdl5Xau5UWmWd47IU3ExL6ZFlv//g9Wg5OSwkWI/BtUaoWAuNl89xv4WjPyvVKZJIM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo3VilE9jq58QdjMeRUWueM4lch0mYn+1Bz4EWiDCramNzR/kc
	ydNERiKEW4JzIaPMZcQuSs7JTtKSluxa18Pt1D9S2fXOBrpBcI99gRM5nbNrZdc=
X-Gm-Gg: ASbGncvAsybLJB0+24J0r+mGcDrv5TvicZRRZgyeds6feuGxy1BPzly1xdjldoT8fE+
	6+jonKZiYgtfHIkrXC3f/pAEJs9ShtPzvw+Q6DywEoLLsOf/SJ4YaLMknsPGuuAeDb03pPeSJhi
	7RAGkMnxkRqsxK4812off2GcpcAShZGmNfFYOUR9p+2OacN3yI0+QMzbI0QW3U9gPOhb0F6PYgZ
	gusoA8LCl0m9gINv7UE9dLM8Y63BZQI/FE+88LUJzbv9a8n7tvDT9RgpJnecvK6d4Tmpa+4/lIk
	YkohOT3Qy5j0iZhSvjBzIfAyjFwW34jLR6UCK1gWE88evXCmlpdHFvmH7H+MnJIK/DPMj9iwrqt
	0zHrBtL/NQQ==
X-Google-Smtp-Source: AGHT+IFjP5A5it0oOhAqjGMiq+zBlLn6/wyStXZ9TEpg3CsfQx18Ux73fzaAw5ZlIGleu7roV3QB1Q==
X-Received: by 2002:a05:6402:84d:b0:5df:5188:11cc with SMTP id 4fb4d7f45d1cf-5e4d6b702a7mr2552045a12.20.1740751645245;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:18 +0000
Subject: [PATCH 05/18] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-5-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-ep93xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 1fdd20d01560ef4fae2b996cf366b4f812329225..dcdcdd06f30d1ff6d0939f6bcad2c17c03c5a65e 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -28,7 +28,6 @@
 
 struct ep93xx_rtc {
 	void __iomem	*mmio_base;
-	struct rtc_device *rtc;
 };
 
 static int ep93xx_rtc_get_swcomp(struct device *dev, unsigned short *preload,
@@ -123,6 +122,7 @@ static const struct attribute_group ep93xx_rtc_sysfs_files = {
 static int ep93xx_rtc_probe(struct platform_device *pdev)
 {
 	struct ep93xx_rtc *ep93xx_rtc;
+	struct rtc_device *rtc;
 	int err;
 
 	ep93xx_rtc = devm_kzalloc(&pdev->dev, sizeof(*ep93xx_rtc), GFP_KERNEL);
@@ -135,18 +135,18 @@ static int ep93xx_rtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ep93xx_rtc);
 
-	ep93xx_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(ep93xx_rtc->rtc))
-		return PTR_ERR(ep93xx_rtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	ep93xx_rtc->rtc->ops = &ep93xx_rtc_ops;
-	ep93xx_rtc->rtc->range_max = U32_MAX;
+	rtc->ops = &ep93xx_rtc_ops;
+	rtc->range_max = U32_MAX;
 
-	err = rtc_add_group(ep93xx_rtc->rtc, &ep93xx_rtc_sysfs_files);
+	err = rtc_add_group(rtc, &ep93xx_rtc_sysfs_files);
 	if (err)
 		return err;
 
-	return devm_rtc_register_device(ep93xx_rtc->rtc);
+	return devm_rtc_register_device(rtc);
 }
 
 static const struct of_device_id ep93xx_rtc_of_ids[] = {

-- 
2.48.1.711.g2feabab25a-goog


