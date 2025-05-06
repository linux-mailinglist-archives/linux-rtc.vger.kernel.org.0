Return-Path: <linux-rtc+bounces-4043-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4510AAC08F
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 11:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2F167B84B1
	for <lists+linux-rtc@lfdr.de>; Tue,  6 May 2025 09:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672C9269B08;
	Tue,  6 May 2025 09:57:41 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922101D6DBB;
	Tue,  6 May 2025 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525461; cv=none; b=WxyAxkg5aHLIpgIXX6J9mikxy9tYwr3qNm45W3kRUV4pVL1LyY6UHzWs+mlyrJKFU19Ogm2nn/T+S69wh91cTUDWYkHGXhF11e0+B2r4mEQPCraMPP0GSmsate2C5cFNeCnrVuiOL7QVwxQ264Raq6kDcsLMMHVUgCdLCETo5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525461; c=relaxed/simple;
	bh=pz/yfalZjtVY+iVqC6tnu3f2apPBW4ABVjxewrMwVAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H1au3cg6DoSvF9w0REeFoEBiNgEUAFnVc2DG+Eo7runXgubV0hZ5qE/65mWzvYIMSx3UoWpVH7+wpxokW80JGLRsM9jnwddg0zOIXiCHErvn6P4FfnF+H+mPQkY9/aMv7u7yMw82nX/JDtNWmVHRiDbqwv/K2zV+nd1LX3wME/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5DB7A1A0E11;
	Tue,  6 May 2025 11:48:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 258251A01B3;
	Tue,  6 May 2025 11:48:20 +0200 (CEST)
Received: from lsv03305.swis.in-blr01.nxp.com (lsv03305.swis.in-blr01.nxp.com [92.120.147.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id EAC4C180007B;
	Tue,  6 May 2025 17:48:18 +0800 (+08)
From: Pankit Garg <pankit.garg@nxp.com>
To: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	alexandre.belloni@bootlin.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	daniel.aguirre@nxp.com,
	shashank.rebbapragada@nxp.com,
	aman.kumarpandey@nxp.com,
	Pankit Garg <pankit.garg@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: rtc: Add pcf85053a support
Date: Tue,  6 May 2025 15:18:14 +0530
Message-Id: <20250506094815.3765598-1-pankit.garg@nxp.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add device tree bindings for NXP PCF85053a RTC chip.

Signed-off-by: Pankit Garg <pankit.garg@nxp.com>
---
V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 MAINTAINERS                                            | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 7330a7200831..47be7bbbfedd 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -65,6 +65,8 @@ properties:
       - microcrystal,rv8523
       # NXP LPC32xx SoC Real-time Clock
       - nxp,lpc3220-rtc
+      # NXP PCF85053A Real Time Clock Module with I2C-Bus
+      - nxp,pcf85053a
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,r2025sd
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
diff --git a/MAINTAINERS b/MAINTAINERS
index 0737dcb2e411..d39fc05c6454 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17782,6 +17782,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 F:	sound/soc/codecs/tfa989x.c
 
+NXP RTC PCF85053A DRIVER
+M:	Pankit Garg<pankit.garg@nxp.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.25.1


