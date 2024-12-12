Return-Path: <linux-rtc+bounces-2722-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6E89EE3A0
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D763D188B8A5
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C789120E705;
	Thu, 12 Dec 2024 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="FEmniH62"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D920ADFF
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997854; cv=none; b=sHhKeLkLTZi4RjhcIscVKa+QkokWiKWULEmqSLQ5UTqDvs1tt9VL3x1K2X9N1zUxem4W/4anM+0UZ2/h57AVoO+QstWFLs8gsPWeBkwsz6nUBrfkdPgNCOM1900MHKssgI4sRsyA/6rnWbhJpVuDi9JcOfnq9uwSjz99BJxKkKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997854; c=relaxed/simple;
	bh=TMt9uqxOB/26Vg/CVDk6PfU4wqC9bNfqK9tUr4WD1Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rBCCuF8YYhTcbMUrsuXQ5Tbnk1/ZLUEJieeA2QYGp5nWzerzmUW4jiQ0CnYz46UkJVxTawK9wgCGqlr+uOs1nCl1HaR4BVqlEhkj1KpOPJcRBKgVvirbzTeMiqYc2Nt4xQB3he4PF7bKvt8559BHnTigI16iCgxPDdET9fO123Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=FEmniH62; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166f1e589cso4194835ad.3
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733997852; x=1734602652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENA4g0oc5vdUShXVp1O8QewP5uN8MItm44Jl3vOUK94=;
        b=FEmniH62R+CUjbVGknL/HC8IugABO5VcCOZ4FKA6Et4l2b/NkYxKh6Y0IujcKDtz/y
         zyzFLwTLVwaIXVjzMI6bWKMZpv9NGkvuC/pmhJ22xDabc3pxUu6W0smKJO/PEgndFYXp
         s9O5dLD99cCnEskhgItLxMIpD03umiYLtkcFYTgzqI0yV8Grypdg53A0ZJ43Jry9yhzJ
         P3ZlBI2nqdUfYYO4dyFySBLtnF5CY7gXaYQ1eluxCQd3hxMzk6QcC+L38zMNw0q2+5Xz
         +vmGZT+NMUPSHrL/CvByaS+xbTk6FxRIdZY3K6v+PgeRILfqMKBTVzHlf2Q5m6cog/Sl
         R3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997852; x=1734602652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENA4g0oc5vdUShXVp1O8QewP5uN8MItm44Jl3vOUK94=;
        b=BmBqTRKVY7bFyUsb4uBxE0BlLZ4asRY58sjZrnjkeKn6hZtxBwiMccHMPY+HJPKm2J
         Y0SctHELIsj8b82PYwRnqkUStrHmNy+iH5B6I0ytzTQfetmY0mkeuHvGqz61vZ571kXB
         21kVIHFqcW6eSMm0pP3Y09K4sa14LG8po0YCULBVtqfaway2lqbvjsgkIFod8x4yoX17
         ZQfNpn5Gny9PezCDPJMBQCHqcCXPQyQDDr4/+2lmZKJACLZcUfyDoL5w+FzBR4NPj+8R
         icSv9QAlyFMc3R3lvs5viZXr9aGXhFdNHtK0hnrGVpnuSpoRGrt0fELAwR5RZ0NTP6un
         vwyg==
X-Gm-Message-State: AOJu0Yy/XD7iCFvY+wziOTKWmZMGGl1zlPRZ3Q9mf70nKpIJ08xSYCgw
	e/jHe5nnDMbETGKYJR3S/h1u2XrE6vc42nPii6iNFBPS9rT3Yyqh5mpw1rvSd9c=
X-Gm-Gg: ASbGnctTqS8qUCvaWz++VAoZsRLgSIa4aDork9wklHAXbsvnPtxzbQi8dPBCVX5tw/Q
	xbfAitYxp16Rb5d7iZNAA6OIbKqFHNgdRSMwd79lOJL5cCDsA0b0K43ZMSNwsW2drgFP6FGH5Ix
	QG+AGUmpl+wDdlieoCFB85Ax5XOaA7J81KFtbuYE6kqlIIAfR6j48MA2kqRP/z99yBTZycZA5lJ
	2IcEZW7f+Ob09576xej0Eq53jE8i6peRRzExdtXX/EXe/MAq25hIKQzN85733Grlo5o6DimAgPY
	VsKK
X-Google-Smtp-Source: AGHT+IG+nhwc/fMSaGm9yZ1piEU5b3sQ+5mFjAYg+6kqu06M/tzODB2EJ6cI7pXlK+TH96rKhN+RwA==
X-Received: by 2002:a17:903:18e:b0:216:32c4:f807 with SMTP id d9443c01a7336-217786a9b24mr77818715ad.45.1733997852540;
        Thu, 12 Dec 2024 02:04:12 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216719590adsm44077485ad.26.2024.12.12.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:04:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mazziesaccount@gmail.com,
	alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v3] rtc: bd70528: enable the device's wakeup in the last step of .probe()
Date: Thu, 12 Dec 2024 19:04:03 +0900
Message-Id: <20241212100403.3799667-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe(), which results in a memory leak. Call device_init_wakeup() as
the last step in the .probe() to avoid this leak.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in V2:
- Move the device_init_wakeup() to the last step of the .probe() to make
  the cleanup simpler.
---
 drivers/rtc/rtc-bd70528.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index 954ac4ef53e8..d5cc4993f918 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
 		}
 	}
 
-	device_set_wakeup_capable(&pdev->dev, true);
-	device_wakeup_enable(&pdev->dev);
-
 	rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(rtc)) {
 		dev_err(&pdev->dev, "RTC device creation failed\n");
@@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_rtc_register_device(rtc);
+	ret = devm_rtc_register_device(rtc);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+	return 0;
 }
 
 static const struct platform_device_id bd718x7_rtc_id[] = {
-- 
2.34.1


