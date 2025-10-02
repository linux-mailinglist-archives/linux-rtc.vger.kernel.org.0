Return-Path: <linux-rtc+bounces-5040-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691D3BB3716
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Oct 2025 11:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA8516BF89
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Oct 2025 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0D630148B;
	Thu,  2 Oct 2025 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwkNKzPz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034E302163
	for <linux-rtc@vger.kernel.org>; Thu,  2 Oct 2025 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396851; cv=none; b=sflahSqFiqvBbKy7nYJoAFLCk3HJqczqWYwKzANb3L2pLDRChqsVR4JZVQmmZunJ+aIORfohiM4CtYXPkvuARSzq4LBC+wzNh0HpmXyTkFSxyMAnUpUEIQHsbrQpGeUlf+h/FdFXbfFosZBPGEJmU7NrDzKioP1vvm6lgNvqlbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396851; c=relaxed/simple;
	bh=NbqCWvQCaMNEPmod2yWs0FfaXN1CcGdfkaocxXgMer8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KOp+m+pdDe3Y/geBarH97I9Qaw1jQaSFCiZtL4k7uCtbcWdlITrzhwJ/d8SbiaL6QQcB17CWqxMZaCcviS+vpoekI9YaO4bBfNK1EFQA6STQVrYShHrXJ3+bXS8dK9DuLNU2H5hMUtCR6fxWIrF6e4G9yoQEAT5q27OCDiRTFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwkNKzPz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-579d7104c37so1067604e87.3
        for <linux-rtc@vger.kernel.org>; Thu, 02 Oct 2025 02:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759396848; x=1760001648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LqXqRp/Z7HtRs3F1hULbBJNB4X8XMTG1LZWCYLOZLtU=;
        b=IwkNKzPzUuEKVxIsarZZ6FzwhDBfcXPts3aCnr+vjfHzcRZ92SxBJZIvqr6+TBQYi0
         dntr1Mf1AV4QKXnAT0c5hiOz6QIJK/YfkkKiG/myVvvErpUKJBJ3AcuG1ZMDmYU1p/HR
         neg0Lk2NOHevy9UbarfG4nRNT6i1k6TPMMDbBgfXGra0naa4EAkuQ6Jh1+nZErkD4kI2
         j1uZ5YNi9Cjt+muys01EBOQDW74Pilz3B0vECgALwETacnioU3A3XlJLTCVrd8xPTrzY
         i0I5iFAR1ZoTd6TZbRLKaEHfxjlIwrAJ4Gk8oN8RSgbvinA6lSARX586+v2sevm7nGUY
         H+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396848; x=1760001648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqXqRp/Z7HtRs3F1hULbBJNB4X8XMTG1LZWCYLOZLtU=;
        b=gkzVQG/hYHt7gQ9t/9C8/rQzJFMGdEhx7sbW0msZz55YeLEQB1yVbfvOMaf7pMVqiu
         VzOp9ifh3KQykLNTEo611Rug7j6uCsVuK3sw6wYURL3NUu5g6fNJQOcrYAqWX6JJVHkX
         c620wW3lqQbIlnK8eaM//s21CUhR46KFx5GGUw+t32BF/2OsOQf1GZJevDyFT1d7aazz
         8wykIe/BZtoq3JzM3UK0Iv99av95XIjQ/MwIeP08dsyVUPOg8rLXHxhEJ9OJL16kuNSK
         80TlGtVOlg7Qik+MNlp7ueynPXt3agaOd6b40pmmoSjv6c4WYuACjnXI9W6uTi7TOHCm
         fiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXchbndKhA0feXeXYFXFYtXURo2qiDyfFbDolP1ihTGFfqDZ39vPXBvEJLP6f/T+4UJcHX83g/Vrx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5P1dIiK5kMtiDQ5+YftakR88CxcDMALqDVkdX6YagogCI79cC
	3Zx6v8G1bYgs+BCiAUdEywK7sKjhf8Hx8qvPmeu4HbqJ2QDPGzuOrQMq
X-Gm-Gg: ASbGnctZZBYaUmoZ4bMf4OB0qZKUqz9XHFT0NBUO36+bPZZSVEdM5lmOHCHxAeMydir
	Q8oCqb8KiqXcmRwNelZYgrS1Pxkolu/Awh8FZ3HZ6EJFWYhZvmtI1HE1v0emdDJKjkjbpkdnk9T
	8AP8dX52Q6G3pBq3QsvHeqlvRHDEu00Ee5KCLF1Xbir/7XLAjWxOgOwGLzoAW+TXvj/Hn8s7WVK
	XtuMJ4GhCp5TD3ziWFnTT+I3T7m0WHNsp2m+TKWi//8oKFvfzDHsh5qzdzR6VAe4McwC9sHt+8q
	kTlDf+XhwPn0IyEjO+USEMxpgbo86nGwx5yJakyXKcB/SRoS48td9KDsquxGoroC+iLH21YNB1+
	2PKuwbOPGrUhKn8PEOJQCaN74eDxbY3qiEt4woOFoXmBHi4geUibGbTGhXG44csVNF5iAYv5Yqf
	4hdVlDT0bCa5eIUMgAojkXAx6HvXiqeyDZ/DILIInW
X-Google-Smtp-Source: AGHT+IHKYAv005/la9IKuIOXtbTmebUj1K9IXAgrSaTVgoEJ2t1LESi6LPycN1US0v8bL1eB9MgZIg==
X-Received: by 2002:a05:6512:108a:b0:57b:8675:e2e5 with SMTP id 2adb3069b0e04-58af9f16ccamr2095615e87.15.1759396847894;
        Thu, 02 Oct 2025 02:20:47 -0700 (PDT)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm642361e87.103.2025.10.02.02.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:47 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] rtc: fix error return in pm80x_rtc_set_time()
Date: Thu,  2 Oct 2025 12:20:43 +0300
Message-ID: <20251002092045.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandr Sapozhnikov <alsp705@gmail.com>

The regmap_raw_read() function may return an error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/rtc/rtc-88pm80x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index f40cc06b0979..50266d2e078a 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -119,6 +119,7 @@ static int pm80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 static int pm80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
+	int ret;
 	struct pm80x_rtc_info *info = dev_get_drvdata(dev);
 	unsigned char buf[4];
 	unsigned long ticks, base, data;
@@ -126,7 +127,9 @@ static int pm80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	ticks = rtc_tm_to_time64(tm);
 
 	/* load 32-bit read-only counter */
-	regmap_raw_read(info->map, PM800_RTC_COUNTER1, buf, 4);
+	ret = regmap_raw_read(info->map, PM800_RTC_COUNTER1, buf, 4);
+	if (ret)
+		return ret;
 	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
 		(buf[1] << 8) | buf[0];
 	base = ticks - data;
-- 
2.43.0


