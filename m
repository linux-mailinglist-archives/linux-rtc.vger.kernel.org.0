Return-Path: <linux-rtc+bounces-4427-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4542AAF8EC3
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Jul 2025 11:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0A457BD7B2
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Jul 2025 09:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA592F5324;
	Fri,  4 Jul 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqYMgcu0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855562F50B9
	for <linux-rtc@vger.kernel.org>; Fri,  4 Jul 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620321; cv=none; b=rOpGqfoBA9Pa3WQLAoXuy6GvWWdt5aHWFrxFIrYyX+u1nmX7vgkFeGONJXAxpz3VCKJujnWVlSRPHDvTIFS5n1Q+BNhzXPVQ9MxUKJpCA0A0p+AqXMTruK86ccWpSVbkSmgz1SK085zXu66673Ke2UehulK/HoV/ZH3ZXojuTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620321; c=relaxed/simple;
	bh=IsMp9vdaB1JrjS7Yx/S+TvrjKqXoz1tGg7yCKBhRWzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DDcfJtvuE2GBCdnW9rl6vRA0f45FpWdmVYMO48Mw3Y0m1D/azpHtJK9xyjNyjo9M0l75VqBM/PQgViTVinJy2hWw8PYuqYmpQIJOvIa8TGhcFGwPIf/Ej0e93zNfa03etOTFjlIBV3kNrdPka7RpbtN2BTaamF9mBU/PpoeHak0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqYMgcu0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5551a770828so739725e87.1
        for <linux-rtc@vger.kernel.org>; Fri, 04 Jul 2025 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620317; x=1752225117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw/L3ftq45YjdpO/N+z7sa4ashFZz7ZzXdLUpM8fMKM=;
        b=KqYMgcu0nRiQTF1myYQ3HJc0Ne6PvXYjWOxmR3Kh+zQsGKjb9G3/PH9myQhwb80RW6
         7y+Z7Rr9qgavBr7VSou4lFjBidp474JwnvDEKHfxw0O3PSZAmkqPQq98LZMkknWX5pj+
         8l9OtBXptoLyvDvMzEqTG6gu+/PaKcRFGFPV58oIkxI3dQT2DTrisGl5h36X1BFZOaL2
         6xzedYY6L5eSiSnPpUB+MZFhS7oESchRH/tlhXNPKRD6gcU4q+e4NF2V4tfEOfQPVwWY
         3iKLsp4pNpP91z3Zufks02iX6diiyoxuyobk/XMX6BMo0NZQf0OrETyb+AgBM+Sthc5q
         GKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620317; x=1752225117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw/L3ftq45YjdpO/N+z7sa4ashFZz7ZzXdLUpM8fMKM=;
        b=vA5xb2PeLQ9vcL7PnxmWmIVZfzngScem8Vif3cBjTgkf4zjCyOsnl0MD80u0ADcINN
         HG+4AmTGpKnPugoTxO78wlm46RW5rstnebFhCpzkfD9kbtW1tX4BOQI/sOyznQUGWWVk
         CVpzLRxzf4JL9m88/ZxMI/BmGC1+hzdFoiSrBQY0V+vam6fXHUvT01RTwbRzSPCDmxDM
         JENbRIFisODzscx1Gg8jdKYf/bpCV6bVBgvoyNewJ8OSJcLUf+5JMXUN4C7aqt9zTc1p
         Ckox1fl/oRNE+LYHC9hy7uVVN1+UmDt0CvlfDP0YdbCFjLc2kzjx5JVn3aymtGT0IuF2
         CNWw==
X-Gm-Message-State: AOJu0YzGJk3MyNWgOyD0pCFBo4mDTQVdLswyyuYZoVWomtBE/J7c/3tz
	isUxFGliFfQLS/8yPfVXDCt5Xn2XZgnD1DAeUMILMU6+IqgPqQqYrlDgISsZJA==
X-Gm-Gg: ASbGncsZ9kOl/RKdV0Azw3gdG+F4b84Hed4MhRXpS9Hd7qxiKkxiNHrYgySSOCt2cP0
	J5ak4uc2feo1M/EaMF/bLWnOTKBfVApdVvtN0wAG/cAX+7n7H3T3p7ew4ePU6/F9xUP8qAI0L7c
	F3njscJyrS77VNQV+nWyNeB0CNIapsauZBJaq5VEnD/OAqz6AxFHJOPI2Nil9mY5HBv+fX/8qNJ
	MizfwgqNA+LHD+pUJr1i1J2aC85hu2IlwRPfhs5GACr/p5rGPN7Mh5HWXb5c7ngHP9EHohGFdOW
	7wDoYUcFwk6KU8QpOyb/8CJlD5QpaX0CP4zlVyZ+bmVCKw2I2E7UeQhuI2mTtA+vS1AQPu1ob79
	uSW/vhhSvt+y+8vl0fLc=
X-Google-Smtp-Source: AGHT+IGQrU44zWDQn4C8TSS8tcB+bFr6ETaAxTuZ0ZitAsbD0ruu5zQLDOGKUla3v2BlA4Yx1Px9Sw==
X-Received: by 2002:a05:6512:b8c:b0:553:cf7d:7283 with SMTP id 2adb3069b0e04-556f1f62c35mr510172e87.33.1751620316922;
        Fri, 04 Jul 2025 02:11:56 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bafdbsm198119e87.21.2025.07.04.02.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:11:54 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] rtc: m41t80: remove HT feature for m41t65
Date: Fri,  4 Jul 2025 12:11:44 +0300
Message-Id: <20250704091144.45389-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M41T65 device does not support the "Halt Update Bit" (HT) feature
as per its datasheet.
This aligns the driver with the actual hardware capabilities.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index c568639d2151..869358e9305b 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -72,7 +72,7 @@
 
 static const struct i2c_device_id m41t80_id[] = {
 	{ "m41t62", M41T80_FEATURE_SQ | M41T80_FEATURE_SQ_ALT },
-	{ "m41t65", M41T80_FEATURE_HT | M41T80_FEATURE_WD },
+	{ "m41t65", M41T80_FEATURE_WD },
 	{ "m41t80", M41T80_FEATURE_SQ },
 	{ "m41t81", M41T80_FEATURE_HT | M41T80_FEATURE_SQ},
 	{ "m41t81s", M41T80_FEATURE_HT | M41T80_FEATURE_BL | M41T80_FEATURE_SQ },
@@ -93,7 +93,7 @@ static const __maybe_unused struct of_device_id m41t80_of_match[] = {
 	},
 	{
 		.compatible = "st,m41t65",
-		.data = (void *)(M41T80_FEATURE_HT | M41T80_FEATURE_WD)
+		.data = (void *)(M41T80_FEATURE_WD)
 	},
 	{
 		.compatible = "st,m41t80",
-- 
2.39.1


