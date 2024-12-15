Return-Path: <linux-rtc+bounces-2733-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D2F9F268F
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Dec 2024 23:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0187164675
	for <lists+linux-rtc@lfdr.de>; Sun, 15 Dec 2024 22:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA5318C34B;
	Sun, 15 Dec 2024 22:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjFk1o4m"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E30A41;
	Sun, 15 Dec 2024 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734301521; cv=none; b=Jtp42Jds5J00U2rIAqZvRXMXD7NVPZhMeRcUmq/VC9V/L1jy1uQVqUyK0DwXPQ18tKTwddAM6fxJJvLZc/rxOruVAfV40sXXX/9x5tg9IiivRJfE4WGxzxNYjj8Bl8Jn30FgkwxBUEWoLCL6CmUHMh1Dw766qTPFn+TBP+R7nx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734301521; c=relaxed/simple;
	bh=hQVscmHm0N+Efd2pRbsJNdKtoMY77h/knNeFJU7GEdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bt84h0KJ60JEVdL4oDn7kN2x6MlYaEjORKsmmGEEGSTNUv5N1RJq+3lj1HiWvhzI1QfEV4UUt1RmpYKXx7HUn1PBq7L7L4bUZxZRHbS32ZZAd/4wSH6d1b66lFFDM5KEZT2gFUAybhVwMic0B1m+qXzNRNUn/AOK+yaqVFsDYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjFk1o4m; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83eb38883b5so108266839f.1;
        Sun, 15 Dec 2024 14:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734301519; x=1734906319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXTstuCQcImy0LBVGgtOS1MFBsqfl5Zi8vdE6RMLtzg=;
        b=BjFk1o4mDLfrEj6z1eTqprvJOSR+Vg+CG2MANBMSbd/Kbir3ZD1doW6jeLK5HO5Z4S
         c7BNdwfyHDP+2DaM1XCfE/N9ar1MWWf/NYKFUfcRfGYNplnURT6YkstSh1N0hWDeAf2X
         QGweNO9nUnwfDEU5sGK8evpGhLUCyN1max9VcZY+9VMkCB4LOUrm14rgVP0eRz42FxLi
         JxOZbmcI0hNUJVYGmxw6A9s/KkxDCBqC1TN48jE3N6lp/9f1uO2fyCDhvZl8fAQGi3RG
         64JwS4QfZhktNbh87yg7eHXy3B2+gN/mJx2FSu0gKNQPClK2mby+L+RS7stob/aKnmoi
         /wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734301519; x=1734906319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXTstuCQcImy0LBVGgtOS1MFBsqfl5Zi8vdE6RMLtzg=;
        b=Omn+bOKzPZ926aCJcycwkL3MfFvUOaNhmSOfSL182uF0YKJjzYy5ZjbUwE7dKSgAvV
         c+9L2sx9L4hv3rQ9p3YbZLn01PSyUTS4IJfIqSN7h5vzvciT+C/RVYjivyATIKQdEFap
         qWMM8XI2Gib3B2RHpTot65Aqt8HnOYOQYrg1OP1+gQDm5CrQPEjb03MiyW83NWGafgFM
         c5Pypww87JBGWRXqPcFUbAIH6hEaClvTOl8ArSbzGWGpIV7uNNnDgv3CKBDWQ4pd8rap
         bsSiUiWwldAahHU5nMbcUolelnlPHLjUJJKfcVOhdbPwlRotws4JYrTJoMx4SGDXAUNm
         3y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5/z3Hsld0HWTKiuVOMdT+bbgYspsgJPUsS40yvVqEtGEu4xS5Og/bYDwJdmHZxweuxMya+ouEyavrwr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ+fRZ5eoRTP4OPXjtWOaRP3xrZDF7GLaMVaY0WIpJAvqwRGNm
	6Hy7pG0UXyjiCL7nNCX3FhgwS7BY9SemMz5Xw9XbB3sBUUoJb1Pd
X-Gm-Gg: ASbGncu5imgMydoQaOz7eo1w744U9CIXKs3jRq6G4LQx0U/OUB4bhBlCH+A+MFjD48q
	qpybtcQJoXDGeAfaSa1aQJXXodI0/g1H8r65OubFp6dfp7g+9kvdypxYgtH10p3HwSwwv6pGvkA
	YyAzbUzDsLgmcj2SLIITdTjABevzLtVXmsDWtfU1epcw24C+ojOmohDDgXbFXDfON7T2M5Wt6Ch
	kaiF06Sa+69cwAUgSqda1n3934My2GB2BvFDJ9DXvU7B4WKGl36w0fQ+NuoLVxEC9CR
X-Google-Smtp-Source: AGHT+IEZPhbD67vVGqtkYKg2eMC6FPSX4prryySqCuQVaiY4P/SIAioOg6hTCHbMB8hQH+Z59wl7/A==
X-Received: by 2002:a05:6602:1546:b0:841:a652:b0c8 with SMTP id ca18e2360f4ac-844e87b0665mr1331142939f.3.1734301518682;
        Sun, 15 Dec 2024 14:25:18 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-844f626ae79sm98995739f.20.2024.12.15.14.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 14:25:17 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: alexandre.belloni@bootlin.com,
	anson.huang@nxp.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] rtc: snvs: Add check for clk_enable()
Date: Sun, 15 Dec 2024 17:28:24 -0500
Message-Id: <20241215222824.147575-1-zmw12306@gmail.com>
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

Fixes: edb190cb1734 ("rtc: snvs: make sure clock is enabled for interrupt handle")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/rtc/rtc-snvs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index d82acf1af1fa..62af750e5751 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -281,8 +281,11 @@ static irqreturn_t snvs_rtc_irq_handler(int irq, void *dev_id)
 	struct snvs_rtc_data *data = dev_get_drvdata(dev);
 	u32 lpsr;
 	u32 events = 0;
+	int ret;
 
-	clk_enable(data->clk);
+	ret = clk_enable(data->clk);
+	if (ret)
+		return IRQ_NONE;
 
 	regmap_read(data->regmap, data->offset + SNVS_LPSR, &lpsr);
 
-- 
2.34.1


