Return-Path: <linux-rtc+bounces-2680-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAB9E7E10
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Dec 2024 04:05:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B857316C8D9
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Dec 2024 03:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A731BC2A;
	Sat,  7 Dec 2024 03:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="ks6iFPej"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F117591
	for <linux-rtc@vger.kernel.org>; Sat,  7 Dec 2024 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733540716; cv=none; b=A72V4MAzFM+HCubag+FvXbF8Ru/nJyBfsTNJcaxwr/HHZswWPg8OYpgmcAW3OiPDllc/r+RCtf9tmyCEn1P/vuXjhZdsO9tVPCAkgtF2xYFpIWIgbP2f0FMGzmODuJdFp/3KwEH/4f3+CY484qpS6WwiKZA2K3fLC7kD58aYqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733540716; c=relaxed/simple;
	bh=zry/xyyuKsLiEaV4kxSppIuCZf+tKByjHETgrAAv/BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AZiJwdGtk2EDde6QaRhnL8NIKM6NiUkn24VSorODxOJcp0rgFGRqJu4pcIGb9iuONSJCRqqVG/LDrSgJ/CL3Mb5m74sit6QufU5gkkkIek5O2DrOYXjjTGaunOf6goTRAsEHGJwfk13EncUxqZ7Q+DbcT3R3JP4cIJvczYBCG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=ks6iFPej; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so2380049a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 06 Dec 2024 19:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733540713; x=1734145513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9a7tozT1hqWu1U3Su6d82HW1h0orX4TLcEoiBFT8vd0=;
        b=ks6iFPejmc2pWWXCj+CYxURayEP8rO3l9Z+A95jd2H8JmPuWyrfnzzu8Tt8GXriYGh
         QYvRgcaPNfOAdwbwzRCwDKc/fweI5DHYkpuNJJ2ndvqS6lh3+ShFb0pAL+H55hQAYIz4
         9QQoxxwaiuuUHt8vAk2tlDMjb1IQn3Vqgs7qiHWS127qEzApOapE3XDjJOadljYPQiUr
         gwUJifN2XlAXcrJIwZxZwfOWlmLmpS3Iq2xAIytI8PjQzkftTftvW8yiTWfGv3noG4/5
         a7HamMb5gPkWY674wxZdKEICpTwbMO3+u7h8tFBHbjT2uZOpf9ag8eN8S7NjO05s45HN
         RSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733540713; x=1734145513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9a7tozT1hqWu1U3Su6d82HW1h0orX4TLcEoiBFT8vd0=;
        b=mX92MoB+XWP7H1thCjOzBNM/RKiBlruxyOD9MrnySP9YlIp7WyacvJGXVmGsrY+juA
         J2v5Adfa//liqnZGt0DcdRXJSTnflcVeKmeQQZD+RzLL1/tnpiRdroBZ1+eh3U4eLX9c
         L8xbQdG4WXiAMrZMftcll2lW+vLrYRtxWb9Pkt3WRlwqy0QpAwQ2HTVmqzBqA1rxf/Ii
         5S+rjbLnu0si8w5ai6vPkEan9t0Sgm27ibyYofm9c8GLxIN3XRjCN/dCWhEO9Ftly+o8
         kjzAyo5R7SHOPbGibOa6H0QHACts5B7YCl6chZCDJpUmEdiUBhOVR/KQlypzbAIF+eFI
         SEPw==
X-Gm-Message-State: AOJu0YwNIWUq9JvoUlotMvpElgGXJNzMU5yDLNJ3QM8L3L9W1ZETHl2J
	YkVNLJgZFIIaf7MeSL3IF3PliZURLKmUroDwjUdhzDl+XD5lbAB4nnwyZIwe0MI6vJb5zeEVx2h
	OvcqY+w==
X-Gm-Gg: ASbGncvxlGUAPXuO1Cmg5d5DtdM5kTkH4aNcDGwNL2FmvXu/+CpYC4WhUL58GVfnA9l
	IDo/kzyB/xsR5ZOAzkgmhwKbmU7NZoduBnf2jEP+PUDHMsPxBadrZJuMLcAYE0ftjdlFrMv0oz1
	BnCzE7gX0DQnjw1zmGFXcMQG1Gm7SatCMRUHJ1aW4uJfMvFsfTQozWpzdNeP6q49pI56khqmKM7
	3Xn3+szIaVDvpjKABds1r/i6Dfr/INT+s9us7tvEiFbdqPxgCZvtfQ/RkpclefIKiqu6lZF0bkm
	hfnh5cJRc50DDiZiIMos2JjCyWxtw2UCap4z
X-Google-Smtp-Source: AGHT+IGUKDXAzPt2TaUjv+RGEvFUupawMWIe2CMM6ej9VcPJEi9WxQr5Y1NzNL2nau943qXW9b6VLA==
X-Received: by 2002:a05:6a20:a104:b0:1e0:dc7b:4ef6 with SMTP id adf61e73a8af0-1e1870c8387mr8728282637.21.1733540712940;
        Fri, 06 Dec 2024 19:05:12 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd1568e94fsm3276928a12.4.2024.12.06.19.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 19:05:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: rtc-as3722: disable wakeup on error path of .probe()
Date: Sat,  7 Dec 2024 12:05:07 +0900
Message-Id: <20241207030507.1181048-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of as3722_rtc_probe() leaves wakeup enabled on
the error path of .probe(), which results in a memory leak. Fix it by
adding device_init_wakeup(&pdev->dev, false) calls.

Fixes: b45062619840 ("drivers/rtc/rtc-as3722: add RTC driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-as3722.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-as3722.c b/drivers/rtc/rtc-as3722.c
index 0f21af27f4cf..558829e17643 100644
--- a/drivers/rtc/rtc-as3722.c
+++ b/drivers/rtc/rtc-as3722.c
@@ -194,6 +194,7 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(as3722_rtc->rtc)) {
 		ret = PTR_ERR(as3722_rtc->rtc);
 		dev_err(&pdev->dev, "RTC register failed: %d\n", ret);
+		device_init_wakeup(&pdev->dev, false);
 		return ret;
 	}
 
@@ -206,6 +207,7 @@ static int as3722_rtc_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to request alarm IRQ %d: %d\n",
 				as3722_rtc->alarm_irq, ret);
+		device_init_wakeup(&pdev->dev, false);
 		return ret;
 	}
 	disable_irq(as3722_rtc->alarm_irq);
-- 
2.34.1


