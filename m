Return-Path: <linux-rtc+bounces-4641-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CBBB1A6AD
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 17:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27D2625AE8
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 15:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E91274658;
	Mon,  4 Aug 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA3Gxa2P"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B623D295;
	Mon,  4 Aug 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322482; cv=none; b=XPDlumLyLd9cG4G22UlZTQ/mEil+L6EoV9n7CuGDBRpKulptPGxeszdEwXWkWg0fuodPXlq2P4vF0M13W9UMT5l0j6rUFrd4VAkVPFJ9iDj9ZI1n6GvREC9lkP2XYqwENQ1pONxj6g/DhVJRn6ZPcd3mAuNHq4LA32BhgnRYJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322482; c=relaxed/simple;
	bh=ByEvCI1dpplY3QRib7iPSW0QsvJZM0cIp4LVRQMQ+FM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qbKA/O39LRycKAGIyhboT1KSwRfu7ko6Rilk1cf8OTo06MVJplN6X0mlfCfifDouiy+7sKaOLC+cPqL+8oSWvqSE39s/y1UQ8Q0avWuIfC5FbmPY91+YrF+D2RsShRQmqZBuHwy5qf2niwDBmKjhkELlWw1iu1g7q/XtUTbpxZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA3Gxa2P; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af938dd1109so46570566b.0;
        Mon, 04 Aug 2025 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322479; x=1754927279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+UUPq9hnFfXRk8mndOboayVxGmH6TX7x4H9Zgx7Q04=;
        b=HA3Gxa2PBLrxpmflvk1oqqIPddn0u7ZpqXevy1C5DED3rtuagN+iaQzaEAeg0/WXnk
         VWQRucGDdQNESfAbvOLTiSrtyjIxlCm3FZMkFiiFY/RKJw+LAoFy1mPSGqxpyLqGCPWQ
         Ptq0qiWIDc6Cw8hRrG4sV58SMSqUqRa5yszu0xteKLclAcWkwbF0bl6j54MtFj3TJl5L
         Ag5rUVvFqPAc/qpN6GEaJ5ScMBKQKSSGJKLuJKGfp0lzIjUJNzGnLjEofweNZpgB3z2d
         TFpVdlrUMnGZSt6QcGpWMAnm5e22qq8yZxC9oDE+/TJSEbU2+j4lmYhBxlgVardLVEG3
         CZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322479; x=1754927279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+UUPq9hnFfXRk8mndOboayVxGmH6TX7x4H9Zgx7Q04=;
        b=gjAPJqjfG/699/XvEsrgJg44rNSOXiwHlVeG7rxqyv1yTBNtlUcINdJmj47Aren2p7
         sG8redb7HjKJva9Q9dT8UTOfdfFqC48XhY5BZNZbshywJU6GFUxw99sN+iqV+QT0tKol
         F0Hsz7ajqJWZjN0j0so5KTbR74Zb3Uug1wCG7AzGqMvebcblv2uhnuZDnrXIrXwndpom
         bkX09D+f6nqvzSeRFhg1baQIv6u/VzGmHLs9aha87kPQKeERIcy/IO8swzTQGHWfZmr0
         BxnhASdbxPowFr9PqQpwawrBLUsoiSSZKfIbNhy3Po6m9NNdzUTsMwdDYcCF2Sb6WZNR
         o4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+ROwd6qws3H1/RDoF4YYoB1NaTFDRDun/WQ5DDhZK74UxD/2rw+We1aj2ZTlyN2al49jIhoupN/az2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9RFjGAgy+atjovj/GkELFjSHPHIFkvQJXxeEcFX/Xz/jCsqX
	dip13HGQ2tTxmsK7hqrfOI6aKmjGAVszckJdLDlibebmy1VS1Pp7wjeO
X-Gm-Gg: ASbGncst6MDy9eonkwFDu/tT3nMTvFXUv0IWR+y1lKZpjxzB8Ja/RIg3V7lQcHaCkAE
	fMQy4x672WbF51YeNO4Xme/RBsff+mu5GhDAqm05eZFxkugoy94FejeWYw8vFWrr2D2RDedXAur
	wmWRFtvbdStZXXEwd3DRowb9ZmX3xUKoBgTZ80ORYTTu/Uaf4/pOo9cUO6mKUuqGRhVL5h/3z/J
	8iNGWwtk8967Cr96B4VLFmnnQ/zUu52/FGuuZMdEIZ8u8ssj3KHehQoXMJqTp35I68gpC3Zeetr
	J/s8j8R958MxMbPTAETepiu8TNeP3rQeQqgMf19Cw53SDJzplNB1kF/b8XfLW0lLskmhcPlrlIK
	Jhy/IQ95av4gUKpQGKhg+4ehhS9HH4IdUco9O0Ue1Z8JpZGFJI/hlju2zNI8I2Y0iVkR+Xdex8p
	j7Quw=
X-Google-Smtp-Source: AGHT+IGHFleDuYVTLlaouFoArNS2Kzppp4J9Fe/k66R1ZNoacaEZv77NGxcVeIFO77xVLXCz9sDJPA==
X-Received: by 2002:a17:907:6d14:b0:ae3:5118:96b3 with SMTP id a640c23a62f3a-af93ffc6aebmr384185566b.3.1754322478376;
        Mon, 04 Aug 2025 08:47:58 -0700 (PDT)
Received: from localhost.localdomain (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e8306sm757276466b.83.2025.08.04.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:47:58 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: alexandre.belloni@bootlin.com,
	michal.simek@amd.com,
	srinivas.neeli@xilinx.com
Cc: linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com,
	Ivan Vera <ivan.vera@enclustra.com>
Subject: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
Date: Mon,  4 Aug 2025 15:47:50 +0000
Message-Id: <20250804154750.28249-2-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804154750.28249-1-l.rubusch@gmail.com>
References: <20250804154750.28249-1-l.rubusch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivan Vera <ivan.vera@enclustra.com>

In the event of an uninitialized calibration register, ensure the register
is reset and properly programmed during the probe sequence.

At present, only the calibration register is evaluated. If it holds invalid
values after a power cycle, there's no longer a way to reset it, for
instance, via a devicetree entry to 0x7FFF. This issue is documented here:
https://adaptivesupport.amd.com/s/article/000036886?language=en_US 

The fix prioritizes an optional calibration value provided via the
devicetree over the value in the register.

Fixes: 07dcc6f9c76275d6679f28a69e042a2f9dc8f128 ("rtc: zynqmp: Add calibration set and get support")
Signed-off-by: Ivan Vera <ivan.vera@enclustra.com>
Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/rtc/rtc-zynqmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac..0c063c3fae52 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		if (ret)
 			xrtcdev->freq = RTC_CALIB_DEF;
 	}
-	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
-	if (!ret)
-		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));
+
+	/* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB entry. */
+	writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
 
 	xlnx_init_rtc(xrtcdev);
 
-- 
2.39.5


