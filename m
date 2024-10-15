Return-Path: <linux-rtc+bounces-2191-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D562E99DC5D
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 04:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7962DB21BE4
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 02:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8883216DEAA;
	Tue, 15 Oct 2024 02:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Yae3PdeC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81A816A92D;
	Tue, 15 Oct 2024 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728960220; cv=none; b=ploLB5EVO/Q+fygHQd4KhVlagYl6/QWz9cnn5vyfDGr1SFNlmypaLSCvVITBmIr+0XJG7TKZIO8G1uPRp+7SwrTt4IDEaINEVR0ukvThBQRiJDgRdVHVjScjYqbRfOQs+wXocNkx0az5A5ib9QE3e3wHC+WZzxnf/jFMwEQU9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728960220; c=relaxed/simple;
	bh=fu4tV/Ybuw5z2VSKw3uQ2W+FpVaaobIFmxfAkGSDrv4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=H03CWuf8znAbWVBlT85pH7XAvVAjZ/x+vZAs+wPpuKhP4NJ93hX7B3lcRgrrBSrpLghMXbqL+xO6pq8w5/2x/9PLnmv1CLlGekKJS2KJj2+i3NSfRVeMYWymB1LgkAhdlzYC8kj/H740mr+E7Dg7HSlKA6+t4g5MvdXaorjrAXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Yae3PdeC; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=YHoulzNfEf/3cchh2O
	p7Oha0dOhZ4RRfuu2b6gpk1XQ=; b=Yae3PdeCU6cpDz4x/SeXTr60D65nDQRV6P
	M8KAdX6reL3MDZ+JKdTXkHrLwIO4R/JKlCCiSB0eoCSPEbbukUtIq8juRRpBbGfd
	YIfX7u7LoHj7D8xjhOe9vcDQa5Fr+S+LKqQYU4PZ2O2nE2M/CeTP1BCuoKNpg8U2
	SGBz8roNc=
Received: from localhost.localdomain (unknown [111.48.58.10])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3vwnM1g1nGs7RBA--.775S2;
	Tue, 15 Oct 2024 10:43:25 +0800 (CST)
From: huanglei814 <huanglei814@163.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huanglei <huanglei@kylinos.cn>
Subject: [PATCH] rtc: add prefix modalias for rtc modules
Date: Tue, 15 Oct 2024 10:43:22 +0800
Message-Id: <20241015024322.15272-1-huanglei814@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3vwnM1g1nGs7RBA--.775S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF4xuF13CF48KFyUAFyxKrg_yoW5CrW5pa
	15Ar15ur17Krs3GaykGrZ8uFW5K3W7KrWjkF1UJa9I9a4fAFn7ZwnxJFyrXF1DXrn5Ww42
	qw1jkr15GFykJFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UE9aPUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbixwx59mcNzu-iFAAAs5
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

From: huanglei <huanglei@kylinos.cn>

When these rtc drivers is built as a module, To wire it up to udev,
and let the module be loaded automatically, we need to export these
alias from the modules.

Signed-off-by: huanglei <huanglei@kylinos.cn>
---
 drivers/rtc/rtc-ds1302.c | 1 +
 drivers/rtc/rtc-ds1307.c | 1 +
 drivers/rtc/rtc-ds1343.c | 1 +
 drivers/rtc/rtc-ds1347.c | 1 +
 drivers/rtc/rtc-ds1374.c | 1 +
 drivers/rtc/rtc-ds1672.c | 1 +
 6 files changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index ecc7d0307932..cc82f8e6326b 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -211,3 +211,4 @@ module_spi_driver(ds1302_driver);
 MODULE_DESCRIPTION("Dallas DS1302 RTC driver");
 MODULE_AUTHOR("Paul Mundt, David McCullough");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:rtc-ds1302");
diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 872e0b679be4..c402ab5cf383 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -2024,3 +2024,4 @@ module_i2c_driver(ds1307_driver);
 
 MODULE_DESCRIPTION("RTC driver for DS1307 and similar chips");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("i2c:rtc-ds1307");
diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index ed5a6ba89a3e..e9183f745922 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -481,3 +481,4 @@ MODULE_DESCRIPTION("DS1343 RTC SPI Driver");
 MODULE_AUTHOR("Raghavendra Chandra Ganiga <ravi23ganiga@gmail.com>,"
 		"Ankur Srivastava <sankurece@gmail.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:ds1343");
diff --git a/drivers/rtc/rtc-ds1347.c b/drivers/rtc/rtc-ds1347.c
index a40c1a52df65..babdd35cd82d 100644
--- a/drivers/rtc/rtc-ds1347.c
+++ b/drivers/rtc/rtc-ds1347.c
@@ -181,3 +181,4 @@ module_spi_driver(ds1347_driver);
 MODULE_DESCRIPTION("DS1347 SPI RTC DRIVER");
 MODULE_AUTHOR("Raghavendra C Ganiga <ravi23ganiga@gmail.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:ds1347");
diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index c2359eb86bc9..3d61ab23c41c 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -582,3 +582,4 @@ module_i2c_driver(ds1374_driver);
 MODULE_AUTHOR("Scott Wood <scottwood@freescale.com>");
 MODULE_DESCRIPTION("Maxim/Dallas DS1374 RTC Driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("i2c:rtc-ds1374");
diff --git a/drivers/rtc/rtc-ds1672.c b/drivers/rtc/rtc-ds1672.c
index 6e5314215d00..a2240cd92774 100644
--- a/drivers/rtc/rtc-ds1672.c
+++ b/drivers/rtc/rtc-ds1672.c
@@ -158,3 +158,4 @@ module_i2c_driver(ds1672_driver);
 MODULE_AUTHOR("Alessandro Zummo <a.zummo@towertech.it>");
 MODULE_DESCRIPTION("Dallas/Maxim DS1672 timekeeper driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("i2c:rtc-ds1672");
-- 
2.17.1


