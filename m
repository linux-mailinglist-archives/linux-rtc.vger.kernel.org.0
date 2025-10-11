Return-Path: <linux-rtc+bounces-5085-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45094BCF062
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 08:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B953A6348
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 06:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840271F463F;
	Sat, 11 Oct 2025 06:20:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EACC8F0;
	Sat, 11 Oct 2025 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760163635; cv=none; b=MGkhWcYX6kcbdzERb7T1QGrTUoLNkQvEmke9ocv+c8hQSD6ZLLT190CxddJD/p/f85i3H04E5WPPBYU3K++N8ZSXAzn1mgOiNjGbWkt+P3Sw9U1f/rp2c6ZNtDULpZt45HMfidbxccQJ86MlA9gpoADgYUGADmbZo6wbWvVEumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760163635; c=relaxed/simple;
	bh=b5mNr+QpS/ldW7yUf18x34s39JDTI8le8/CkGPCyGvw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B56nNfeFfNvRhDDOE53b3Us5GD34ieKbW+WNd5uRjeAVLgaICPhTAcoiUgksC9BXDkhaleZDR3SlmOF7ywMtv5cnmaLCl8ZhrqekayR5X7GOtsvEUtlD/ReicemrVEKpXHv0PJBRavnxXOv/iUvqexDvv9fsnWuQ4QnOccGLSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 59B6Q8uV013636;
	Sat, 11 Oct 2025 06:26:08 GMT
Received: (from akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) id 59B6Q8Hu013635;
	Sat, 11 Oct 2025 06:26:08 GMT
From: Alexander Kurz <akurz@blala.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexander Kurz <akurz@blala.de>
Subject: [PATCH] rtc: Kconfig: add MC34708 to mc13xxx help text
Date: Sat, 11 Oct 2025 06:26:05 +0000
Message-Id: <20251011062605.13591-1-akurz@blala.de>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MC34708 is one of the three mfd devices supported by DRV_MC13XXX.
Update Kconfig accordingly.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4a8dc8d0a4b7..28f2450d2518 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1739,7 +1739,7 @@ config RTC_DRV_MC13XXX
 	tristate "Freescale MC13xxx RTC"
 	help
 	  This enables support for the RTCs found on Freescale's PMICs
-	  MC13783 and MC13892.
+	  MC13783, MC13892 and MC34708.
 
 config RTC_DRV_MPC5121
 	tristate "Freescale MPC5121 built-in RTC"
-- 
2.39.5


