Return-Path: <linux-rtc+bounces-2679-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF269E7B95
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 23:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66895283B72
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Dec 2024 22:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F1119ABC6;
	Fri,  6 Dec 2024 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3swPhqB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C0122C6C1;
	Fri,  6 Dec 2024 22:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733523694; cv=none; b=DoU2rCCllcMFoyWza2wcLLp4PPMPSiXWyxqH3GTZByZoVEjgFjJrUhgODFesD4ZGa1HgbVN7s9/jAAyJ+hlR+VlsHON6JpHAHYzNwEVrMUtI2+RBbW89/wBW+Rl8i8oXNA8ioVfuvQsefCiMc8p8mgWMy40zmt35fmp+Ezi4qqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733523694; c=relaxed/simple;
	bh=mhky964TRWNzFbAiRFdB5HACfgN5R0L+tLJI3tPPRw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aoIteihppe80tDKw73X6TRXqR8mzinX3nDZpP1Y+GCcW82JgazY53+knndssWYii+Kw1fuT1HwT/Q/uvmbNphEoRDonOj50Zhs78FxCKv55ghfvANm0YYYa65R3oWgzkvGO43zQg1MNfCSBw+PNBii+eBEh29YmnMm5keKglVNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3swPhqB; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46695478d03so37239911cf.1;
        Fri, 06 Dec 2024 14:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733523692; x=1734128492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SZhhTP8F6A8wEtYSRjTN5029eKdbjNe9HQjo/7xvSE4=;
        b=h3swPhqBvlj3cMaIAcRfx11GKHP+UbqsAZTnaT5iiEhTIZRrJmKu9dOZU80T0AGoX1
         /agIf7DKAducNipQ4+F4rcOU3oDje2mMQe8lp14My4yrHuFh86vjWpypysOfrbkAuiS6
         JboLRZlHikJvJkeqNsPXRQqFO8stNnS6vFJU5/gFXrpTf5/2aULKModoVlsvWM2FRH2I
         IY3GeH2l3f0ksCBOuT266JekZuKmcyYgQVjRX4mVCKiATc4cnnE6V7/lgb5Jb3IPqgnG
         BOVuJppbtPnxaS9swiwDOxcJbaH3tRz/KfcN+SM3H0L140uxGIPGXc4hJPmXpA19rRRt
         okIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733523692; x=1734128492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZhhTP8F6A8wEtYSRjTN5029eKdbjNe9HQjo/7xvSE4=;
        b=Sp+xBmFwaWaTeDcWAk0HqVIMoDZAi8iSJgxyBF1FCB8l4YBrIfMVCbaBprhttNRM3R
         RI7WkZX1i8jkAbV9UTtWsTzRckZqryyjqcThGCKxS4m/Oaam5p9XylHR3jfm0erpmXbW
         zgeEcOgXXaenelSQMEgDSxyZt5f/6rGkCFf5G8UBWNSLB6p1Eah/vtktgNtoq+2Cplym
         F00v63jPYWO3km8ZFR6u8u7XX+0M9aKti8J2i1TcZrYty+eE88SHl43efVSg0qoTnbIQ
         XcLn/z5rtOrKrO3n1yhPJ0499TXzQuHGrxM/eRrv1z/TYz2IFcGF2Z89+cR2OzMbzRTi
         E52w==
X-Forwarded-Encrypted: i=1; AJvYcCWoVtYdVOwyRLFUbRuavEoqR29fiN6aEMGDgiuJXuoImHHfSxxHrmzPUj87MKz8psZf0TE2bZB9aMbX9Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+M0o67jxy6dpRrMss38ymTkzGS229mJ7DyUJ1+Ir63PcuWqa
	xih1Y5/A3CDrfZI4p7q0GOqhgmFaamFNsveVrGD0NWvoOXiD95e/6FtfNBTX
X-Gm-Gg: ASbGnctsawzyI6QWBpMs/vfdyUueg6Gx3bT1nQCZPg6E+FOmo+gqOhTjZCkjpIwe5mD
	0k/gyw9O+Cscdti5jCEztGVrJtbQRWX+MU15PIs1TzA6L6O7gNeLnli9QnOHS3QRAAJeiLZHOFI
	xIVxlxUAzbf6jLISD/wGvvqM6tBPNInLz4dZWg23+s+jbzhRFMvXhMxMMl/oWAq9V3I2245PvRa
	LjkCX5zVvOEhYcMkZYdwPor7w1ib3Wsii/cQeLG3hYXam/feDfjXN9BQH28Xg==
X-Google-Smtp-Source: AGHT+IGAKWFMT+I1wbmUOwVQpQGCERs5Xc7gz6oYPba9oF39Og5PrK1c20U2AJEQWpqDryidztUmpA==
X-Received: by 2002:ac8:584e:0:b0:466:9018:c91f with SMTP id d75a77b69052e-46734c9e97amr78931621cf.1.1733523692059;
        Fri, 06 Dec 2024 14:21:32 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296d0e3esm25566171cf.33.2024.12.06.14.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 14:21:30 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: alexandre.belloni@bootlin.com,
	gxt@mprc.pku.edu.cn,
	linus.walleij@linaro.org,
	haojian.zhuang@gmail.com,
	broonie@opensource.wolfsonmicro.com,
	akpm@linux-foundation.org
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] rtc: Add check for clk_enable()
Date: Fri,  6 Dec 2024 17:24:52 -0500
Message-Id: <20241206222452.3479786-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: 0c4eae66591a ("rtc: convert drivers/rtc/* to use module_platform_driver()")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/rtc/rtc-spear.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-spear.c b/drivers/rtc/rtc-spear.c
index 26eed927f8b3..064d46b2f16e 100644
--- a/drivers/rtc/rtc-spear.c
+++ b/drivers/rtc/rtc-spear.c
@@ -437,7 +437,7 @@ static int spear_rtc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct spear_rtc_config *config = platform_get_drvdata(pdev);
-	int irq;
+	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
 
@@ -447,7 +447,9 @@ static int spear_rtc_resume(struct device *dev)
 			config->irq_wake = 0;
 		}
 	} else {
-		clk_enable(config->clk);
+		ret = clk_enable(config->clk);
+		if (ret)
+			return ret;
 		spear_rtc_enable_interrupt(config);
 	}
 
-- 
2.34.1


