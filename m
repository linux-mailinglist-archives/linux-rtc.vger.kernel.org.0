Return-Path: <linux-rtc+bounces-5049-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90243BB9CF5
	for <lists+linux-rtc@lfdr.de>; Sun, 05 Oct 2025 22:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 21C1E346C2C
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Oct 2025 20:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A8F189F20;
	Sun,  5 Oct 2025 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KkFb4KGz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93B42AA3
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759696261; cv=none; b=gocOXVDFMcM/G/YBgSSf+qWFwxKrOjHWfS+kwuAuKs72ZzZqtS39eMS0/qtwbFsv8kEzPSHop7fGVqxZD9gqMYumjOL/82hy8yF/CGpgqbA+7SHPxrbhPaMSBqV5c+xpbBZHR3bLuMQa6bBPmaPRGRZUoohR4T48oZRAsEovPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759696261; c=relaxed/simple;
	bh=Jo4g2zIEpTVPmH5JNDrOaW/0t6tM5bFHAQJmeGDJdgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XxQU0NaaG8jMfBTEJexbvK1sIwMFW9iv/D8oi/zcsOlbUjPa/FoiEbR9vwr7PmLBRZ/Yq8vQwyRgszsrG1XcOVD70/7zjh6ORwgRiAONHeX23ZEjlX/GEu6f9a/4suHjyL1Q04oNrYXT1+jyobK1og38UEONMP/ns01aTQKtWsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KkFb4KGz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A88D14E40EEA
	for <linux-rtc@vger.kernel.org>; Sun,  5 Oct 2025 20:30:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5FE3B6065F;
	Sun,  5 Oct 2025 20:30:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C4E1102F1D0B;
	Sun,  5 Oct 2025 22:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759696256; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8XGt/+rBZj+oi9MeEAwXEo8lEVn7n+YsyTc32PWakXM=;
	b=KkFb4KGzhB8zXC7UsHlx/MmstSxOVNBEYHolDOd0kToCfkuu6LBoN35qUOCxEmrXs+e6cq
	jKXkwxhqZ57IxadacN2baJLElq6YhlDxhTUF8P0fa10QDSM8h9tqVg1j8XcNq5a4JNaHEf
	L2C03xk7WlUiSZDW/j0rGf+1vCE2gNa+7iQK6vT6Z4fofARV8RBlqhqQuQOAroFiTVlqIb
	BEycBo8svxYPUCIXOypYowxrxkzzKIxZH4SCnQr7MVWNaMA9INSDuBe6mWVuWi00bsKknk
	Vt6c28jni9lBUcsRfDS8Zkj+IqsM3fRKTlQCIR45AE2TulDvrTNRtUwqZP4QCA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: Kconfig: move symbols to proper section
Date: Sun,  5 Oct 2025 22:30:48 +0200
Message-ID: <20251005203048.3759240-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

There is only one HID RTC, the following symbols are for on-SoC RTCs

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 31d355b103d4..17531bfe3dea 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2044,20 +2044,6 @@ config RTC_DRV_RENESAS_RTCA3
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-rtca3".
 
-comment "HID Sensor RTC drivers"
-
-config RTC_DRV_HID_SENSOR_TIME
-	tristate "HID Sensor Time"
-	depends on USB_HID
-	depends on HID_SENSOR_HUB && IIO
-	select HID_SENSOR_IIO_COMMON
-	help
-	  Say yes here to build support for the HID Sensors of type Time.
-	  This drivers makes such sensors available as RTCs.
-
-	  If this driver is compiled as a module, it will be named
-	  rtc-hid-sensor-time.
-
 config RTC_DRV_GOLDFISH
 	tristate "Goldfish Real Time Clock"
 	depends on HAS_IOMEM
@@ -2132,4 +2118,18 @@ config RTC_DRV_S32G
 	  This RTC module can be used as a wakeup source.
 	  Please note that it is not battery-powered.
 
+comment "HID Sensor RTC drivers"
+
+config RTC_DRV_HID_SENSOR_TIME
+	tristate "HID Sensor Time"
+	depends on USB_HID
+	depends on HID_SENSOR_HUB && IIO
+	select HID_SENSOR_IIO_COMMON
+	help
+	  Say yes here to build support for the HID Sensors of type Time.
+	  This drivers makes such sensors available as RTCs.
+
+	  If this driver is compiled as a module, it will be named
+	  rtc-hid-sensor-time.
+
 endif # RTC_CLASS
-- 
2.51.0


