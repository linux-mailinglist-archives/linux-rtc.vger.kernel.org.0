Return-Path: <linux-rtc+bounces-2603-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3A49D5D0E
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFAC2B26F16
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EC81DE4FB;
	Fri, 22 Nov 2024 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YvPCOshk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04161DE4CE;
	Fri, 22 Nov 2024 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270238; cv=none; b=vEre2BpeHeu4AqXbQXVHzAQooclTO06VG2jFw+jt3a7ii5B7dQ655IYwZJSdDyf/1SkvlkC0XfquTRsPS6N1XRBpWBRnOIpN6ZQcjRa60/WxTznLnvyaf1tMSpWlPjmHCC/nlRgqc/ZreuJqfRPtTKMv2FuAAGMfywut0y6xht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270238; c=relaxed/simple;
	bh=BFy5SRGzFxcUg9C7k/DpxOdFgMegtRxmNa2Re/g2530=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxZS8UmmApP4E/k75JGA3Q+3xKzSDpf7xi4MygQa7o6ogCNtD+DaJcD3GkjDAzNbO4CXy1mo6aREdnQ7zfFJ/RSwo3fY/ng3b8b5pYJoIX9aFivs7/NqayQpGn/zSESDiNkidAEitZOGRYEAcmDVKbrEbNx9IAa8UMf7ryeCpQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YvPCOshk; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8B4BFF805;
	Fri, 22 Nov 2024 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732270235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Txhc81JR3Ln31TqfibV4BYhT9m2u2q+xnDTcm3jWFd0=;
	b=YvPCOshkM0KqR19Nq32N9Eksxfysw+o/DMfcY2jVfobV2AIYzpucbpxom8wzvF6ezIK6zl
	tJJ8xLeCrxRWJBmTyWsCMnsM7fj+pN2rUew2sr+X4QNq2KDM2jKa4QEPw+0zhT9StUozem
	YWDuSumJnXG6SESXAYFJ6D1p1DrPzC7CXBVy/OAF1YXWruCZjIxqkkCcnT2VRJW7u3S+In
	PzvHPM8hsUhv20eqFYiKMgsZHwLoo79AsshvB0hvKog2D6Cz4WSww9j5GbJdl61kdU5293
	THbz+87rpEcUsieDQ4smLPnSBbNe9i2SHtF/4yGaKrqWAPgT/spsJqlvgoO9mA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Artem Panfilov <panfilov.artyom@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 2/2] rtc: ab-eoz9: don't fail temperature reads on undervoltage notification
Date: Fri, 22 Nov 2024 11:10:30 +0100
Message-ID: <20241122101031.68916-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
References: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

The undervoltage flags reported by the RTC are useful to know if the
time and date are reliable after a reboot. Although the threshold VLOW1
indicates that the thermometer has been shutdown and time compensation
is off, it doesn't mean that the temperature readout is currently
impossible.

As the system is running, the RTC voltage is now fully established and
we can read the temperature.

Fixes: 67075b63cce2 ("rtc: add AB-RTCMC-32.768kHz-EOZ9 RTC support")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/rtc/rtc-ab-eoz9.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/rtc/rtc-ab-eoz9.c b/drivers/rtc/rtc-ab-eoz9.c
index 85853da258d2..52914bb3e5e1 100644
--- a/drivers/rtc/rtc-ab-eoz9.c
+++ b/drivers/rtc/rtc-ab-eoz9.c
@@ -396,13 +396,6 @@ static int abeoz9z3_temp_read(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	if ((val & ABEOZ9_REG_CTRL_STATUS_V1F) ||
-	    (val & ABEOZ9_REG_CTRL_STATUS_V2F)) {
-		dev_err(dev,
-			"thermometer might be disabled due to low voltage\n");
-		return -EINVAL;
-	}
-
 	switch (attr) {
 	case hwmon_temp_input:
 		ret = regmap_read(regmap, ABEOZ9_REG_REG_TEMP, &val);
-- 
2.47.0


