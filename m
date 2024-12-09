Return-Path: <linux-rtc+bounces-2682-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C029E895C
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 03:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7F928099F
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Dec 2024 02:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7FF1EA80;
	Mon,  9 Dec 2024 02:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="1Fm8dNx9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1544C91
	for <linux-rtc@vger.kernel.org>; Mon,  9 Dec 2024 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733712645; cv=none; b=t1ctWLbQQnj68WMLguH4O45p+QLMHrgcr3ijcROuIwipw1nq1/OX/EKQx3vSPnUl7G9bE/z5jeuc6ODkKDMHe9CqeIdVQoqKIveA+ICxnNFuok/Td+rZ2TymaPaajjpN63D+nVGHAOVcY+tJSZ+U10j5ncLh/vMqihg41BNluj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733712645; c=relaxed/simple;
	bh=nIYR6r9goxILrdmhEWBPTeaj9p7xd8GdUlnMcR8ocro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g2czRYuWVYbUrS786SFKp/QVhKXaPOMjl2h6DE9xLyZed0vyEOUYz2i0CMmSoG1yeZFxAWGNK3l1+L7LQ9K6bId2Z5MoZISa97Ckhu6yp2NYHID1Y/8BFR0a9PASxoOb87D04OLXewEsG/GXsrPOWt/Q4vSED5wypUAQAY6cfC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=1Fm8dNx9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-725c86bbae7so1694389b3a.3
        for <linux-rtc@vger.kernel.org>; Sun, 08 Dec 2024 18:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733712641; x=1734317441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1eLMBOdJKZ8+8AEdoqdyollbFDSZsq7tccf8Mx1Yk0=;
        b=1Fm8dNx9aVCwvAqazxvATCf7lnEGO+8DjMNH41AQU9Wh4L2DmztdV1HJ0zl1MLRdRk
         oh/eV9qdD4zp40zm/K+8baLBl/a0mQi9ZAMpL8RaBCG527PjTO9P5K3tppT1MySEg3Th
         D5z3K3EqVVJ1N1kgrJqKVMRSZO7R1/GZKH3Js42ZVr1cC5ICAFNPTpWHW1j5+MztbJLq
         GYF1RowdwFPN000VfPdsD+4ZrRGmpcx7O8pwGXb+OwgAUO6PQHI2ZEDvIlxuAA2jtCyA
         MrUqsvCgIKEwdGqWf7Z/MFywa0OWv9rEo13PLIN/F+ParU61c95UoHgSayycJOUI5wy/
         aDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733712641; x=1734317441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1eLMBOdJKZ8+8AEdoqdyollbFDSZsq7tccf8Mx1Yk0=;
        b=q1C5WjGZPOUzb+sYQrWo8PyyxfoFZSA6Vm4NgNZq5dUYRg6dMdIqC8xptf35szX5Lh
         4DmrZ2XLp3KPYZKMwcZuQntqU9nr7csQ+PmLJIklpaOGhG5UqwcZNNatPkCpA0zypytV
         wLtvC9iQdQjWZ8LY1rMKJyULGN9UnJzAbImKUkWbfKzkW46YIuctGO4hzOME3pN0LUI9
         ipmdLfqdC6IZiZ46XSN7YRgIce+xbfMoWx1zGtsGZAGfJ1tmcs6YCVmYv5/lrdH8AmKZ
         iHGyeMEqKm7j2zUT640EYEbLp1xyi+B47ArIqcatj7qzSn5Xq9RUCPqijRqBa9L6GEfT
         qRkA==
X-Gm-Message-State: AOJu0YybCvSE2bJoxga/ojJsJxha0lY74+5CePy0fYrfyGQ20xUBb1lM
	j8eawYl0S4lv5T7Y+K1Lkqpjzf4bSKQivIjYXPYDO+eatfyBcrd9YLDVlYuNJbdQxNrjo4sFbAE
	lcPY=
X-Gm-Gg: ASbGncurpcS9jmtIpkXZy+ITMd76h9cI9Au9DINfoimgvGSCeKK3yPX3eS5IjYxSrl0
	nr36vtrqwIHQoH4jwK9u6SIFeF5nqk/3KV3JATD/kjRgIMg17OOrgqRtk4nYSxZz++Zw1ZvSUra
	1UZBpEwiDG7Q1x06prCaz1WfuJNh06hcyqZj7D9aNY88IGQYKDpcSMdjZ44iGYKhTbaTEMBRcgH
	VH2oGMUcN7ewAZWHMKlTG+xYxEXUQHp34+3nR551RH1s4piPNSPYwAlPQvXt2Dd7mPvHXnDYIPu
	v6salHaw7WstKFeTc3P7UvhLJRWm/pXtDBxt
X-Google-Smtp-Source: AGHT+IF5++/GtLpBlE5/Tm3AW1yHPVFcCp2fHMhCcOVHN1r1HeWmqOQSqe4yvLB5y7WB7m42/9Iuww==
X-Received: by 2002:a05:6a00:21ce:b0:71e:4930:162c with SMTP id d2e1a72fcca58-725b80ff458mr17532141b3a.6.1733712640793;
        Sun, 08 Dec 2024 18:50:40 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d7cdb38fsm2862415b3a.110.2024.12.08.18.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 18:50:39 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: rtc-at91sam9: disable wakeup in .remove() and the error path of .probe()
Date: Mon,  9 Dec 2024 11:50:32 +0900
Message-Id: <20241209025032.1600719-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation leaves wakeup enabled in the .remove() and the
error path of .probe(), which results in a memory leak. Fix it by adding
device_init_wakeup(&pdev->dev, 0) calls.

This bug has been found by an experimental static analysis tool that we
are developing.

Fixes: 9fedc9f1b18f ("rtc-at91sam9 fixes")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-at91sam9.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 15b21da2788f..539565c0c888 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -358,31 +358,36 @@ static int at91_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rtc);
 
 	rtc->rtt = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rtc->rtt))
-		return PTR_ERR(rtc->rtt);
+	if (IS_ERR(rtc->rtt)) {
+		ret = PTR_ERR(rtc->rtt);
+		goto err_disable_wakeup;
+	}
 
 	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
 					       "atmel,rtt-rtc-time-reg", 1, 0,
 					       &args);
 	if (ret)
-		return ret;
+		goto err_disable_wakeup;
 
 	rtc->gpbr = syscon_node_to_regmap(args.np);
 	of_node_put(args.np);
 	rtc->gpbr_offset = args.args[0];
 	if (IS_ERR(rtc->gpbr)) {
 		dev_err(&pdev->dev, "failed to retrieve gpbr regmap, aborting.\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_disable_wakeup;
 	}
 
 	rtc->sclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(rtc->sclk))
-		return PTR_ERR(rtc->sclk);
+	if (IS_ERR(rtc->sclk)) {
+		ret = PTR_ERR(rtc->sclk);
+		goto err_disable_wakeup;
+	}
 
 	ret = clk_prepare_enable(rtc->sclk);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not enable slow clock\n");
-		return ret;
+		goto err_disable_wakeup;
 	}
 
 	sclk_rate = clk_get_rate(rtc->sclk);
@@ -432,10 +437,15 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "%s: SET TIME!\n",
 			 dev_name(&rtc->rtcdev->dev));
 
-	return devm_rtc_register_device(rtc->rtcdev);
+	ret = devm_rtc_register_device(rtc->rtcdev);
+	if (ret)
+		goto err_clk;
+	return 0;
 
 err_clk:
 	clk_disable_unprepare(rtc->sclk);
+err_disable_wakeup:
+	device_init_wakeup(&pdev->dev, 0);
 
 	return ret;
 }
@@ -452,6 +462,7 @@ static void at91_rtc_remove(struct platform_device *pdev)
 	rtt_writel(rtc, MR, mr & ~(AT91_RTT_ALMIEN | AT91_RTT_RTTINCIEN));
 
 	clk_disable_unprepare(rtc->sclk);
+	device_init_wakeup(&pdev->dev, 0);
 }
 
 static void at91_rtc_shutdown(struct platform_device *pdev)
-- 
2.34.1


