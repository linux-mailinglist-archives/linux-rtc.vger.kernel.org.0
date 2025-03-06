Return-Path: <linux-rtc+bounces-3420-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF64A558FD
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 22:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 905533B2E99
	for <lists+linux-rtc@lfdr.de>; Thu,  6 Mar 2025 21:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98FE27703F;
	Thu,  6 Mar 2025 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ClCs71YC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CD27291C;
	Thu,  6 Mar 2025 21:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741297378; cv=none; b=kU/4q6YknCZuBMDDiCosx1jrvAZ5NFXI9PLEk9mYzPW5/18ARDsVQDRlDNaCx+MGqeh1s9Pn40MhXgYoXKlwf1KWEdrYZAO7qpJaei/HA7j5K9UWPGYske2N1rfnmuNIoFslflIuepVR0IaZ/x4aDAU7IOn/Z2Kdm38hVkfF6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741297378; c=relaxed/simple;
	bh=yigX/sMfyL5yLpMgrQaUcElEsPHHyb5R1vI0ALC+9ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJCmDgi6xI+9WEdxI4f/Y1FfDGOtmB9CQTrqRfI+LYqc2UqdmP+fPw51EM0L6MpHCF7JLjBoJ2Vpats2+qNbMGon9WaWmSZmRDOQIoxBs1/3TkFs3mBzxCfaYJa8qdxDyZu2YzdgF0Gii6bNFuIVA3agUQDUz7YsBtyOdmaghGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ClCs71YC; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098154446B;
	Thu,  6 Mar 2025 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741297368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WoPYGUd5LeFkpDDlw+G9zOFpPATeHMW2kIS+wR9b8E=;
	b=ClCs71YC9cI+Tz0IVnPD/Qo3OmJjxLCg64CS17KHkuhdjniNIblZ7OKJKOs4MghWO8gb0B
	s7Irv7w+JB4HN6HT5aTsTaDJO3SJuT8PsIQUjZ75dtDrXlw0MJyVp5w3OosYGX2UlXY/9f
	zFCZUddxT1UK6WuLMurWMafwx3Z/R8mbqcAjFXWiehcczsHfecGqh9GLHwCsYhASvynCyM
	s14K5CqKvX9dRLnaSgkC6OLCN4/Xq8qFLjeS7L2f3PwGFlVg4Zzdt5Wi3HzW2FCaTZhFUC
	88Almpk4f9CqYw0jFGNyFJEmooHd4EaOumr+arwgf6jGQGaV1xy2ApsXf55vdQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rtc: rv3032: drop WADA
Date: Thu,  6 Mar 2025 22:42:42 +0100
Message-ID: <20250306214243.1167692-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306214243.1167692-1-alexandre.belloni@bootlin.com>
References: <20250306214243.1167692-1-alexandre.belloni@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -85
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdekkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgeevhfefteejieehkeeigeegtdefffekfeejgeeujeeiudfgieejheegieeuieehnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

WADA doesn't actually exist in CTRL1 of the RV-3032, drop it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-rv3032.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rtc/rtc-rv3032.c b/drivers/rtc/rtc-rv3032.c
index cb01038a2e27..2c6a8918acba 100644
--- a/drivers/rtc/rtc-rv3032.c
+++ b/drivers/rtc/rtc-rv3032.c
@@ -70,7 +70,6 @@
 #define RV3032_CLKOUT2_OS		BIT(7)
 
 #define RV3032_CTRL1_EERD		BIT(2)
-#define RV3032_CTRL1_WADA		BIT(5)
 
 #define RV3032_CTRL2_STOP		BIT(0)
 #define RV3032_CTRL2_EIE		BIT(2)
@@ -947,11 +946,6 @@ static int rv3032_probe(struct i2c_client *client)
 	if (!client->irq)
 		clear_bit(RTC_FEATURE_ALARM, rv3032->rtc->features);
 
-	ret = regmap_update_bits(rv3032->regmap, RV3032_CTRL1,
-				 RV3032_CTRL1_WADA, RV3032_CTRL1_WADA);
-	if (ret)
-		return ret;
-
 	rv3032_trickle_charger_setup(&client->dev, rv3032);
 
 	set_bit(RTC_FEATURE_BACKUP_SWITCH_MODE, rv3032->rtc->features);
-- 
2.48.1


