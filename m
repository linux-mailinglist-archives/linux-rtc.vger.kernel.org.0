Return-Path: <linux-rtc+bounces-4053-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41CAAD7E6
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 09:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48C7E4A2A5F
	for <lists+linux-rtc@lfdr.de>; Wed,  7 May 2025 07:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0582721CC62;
	Wed,  7 May 2025 07:26:26 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3571A21C9E3;
	Wed,  7 May 2025 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602785; cv=none; b=hODutOx7/lolZJ2MMRcyLiE0dRqePD7jkncem1QeaxKs0QWp+jz6WzaxUm/ikb3roBher+5UbViQE/wX7gcFxaibC7zzgzGJDwGTty8qKqZnWWHX6qlYOy0UYEj7oRmvSCjbqD+3qbGgNwydyMPMDdc74XNGzhXavn4vWwA2ZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602785; c=relaxed/simple;
	bh=VgSlTW+4FSKqfDj3Yxm1qBAKH+12yHYjkCjBw3TvX8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lJZtKDICuSbBkXSx0TiWMmp9ULjthIxDt8BSuBhZbc6vfmQR3ft+gfyBepC1dfLh8rIlLse9kHp8G3c62H6gCj9LMGnrsOPl35lZDPIr1F0K8tSI7kkbd+Ns0knou/vQYh17Zg8zGEdnE3GFyeu7NxV8HDy1u8uAK/7yfxnUEOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 675141A32C7;
	Wed,  7 May 2025 09:26:22 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 229541A32CF;
	Wed,  7 May 2025 09:26:22 +0200 (CEST)
Received: from lsv03305.swis.in-blr01.nxp.com (lsv03305.swis.in-blr01.nxp.com [92.120.147.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DCB63180008F;
	Wed,  7 May 2025 15:26:20 +0800 (+08)
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
Subject: [PATCH v3 1/2] dt-bindings: rtc: Add pcf85053a support
Date: Wed,  7 May 2025 12:56:17 +0530
Message-Id: <20250507072618.153960-1-pankit.garg@nxp.com>
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
V2 -> V3: Moved MAINTAINERS file changes to the driver patch
V1 -> V2: Handled dt-bindings by trivial-rtc.yaml

---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.25.1


