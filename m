Return-Path: <linux-rtc+bounces-3442-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC375A58C20
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 07:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980203AA4F3
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Mar 2025 06:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C501CCB4B;
	Mon, 10 Mar 2025 06:39:00 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE11C5D7E;
	Mon, 10 Mar 2025 06:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741588740; cv=none; b=VPJlGHB/rvySPbUo0H5RqdgZzG8NRI0DnnBSLuFcl+QuuwzMve+rDGLWFYBZGyQmUsT9GTTWsBk39aWoaTuAP7/NILpcACvevj4joZgzfj4dvZHkNmzqYl4vG9zULCep8/xrYrHcd//GNpTOnLoB/ehzQk0YpKMQc9SRQwpVgFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741588740; c=relaxed/simple;
	bh=tZOgiknuCCubhajeAM4Mx79q2OJ2RkOqlALyn/E/1EA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RuDo8qnl460Qe0grNeJLZZyx8qA/JJOJufNWlaWlIe7vGDI+7Ffo6eOMuC7EZPNfeHDMiW1SP0Gp5E5Bc+Y0VmlZcNC2u9wB/XbNuwGkAVqc9i3Hy0CxVY4ipz6fOSmebWqtJ/VMs507cJ+pbJt2gUjA0I24MdP5ir0MM2QM6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 89F082020FC;
	Mon, 10 Mar 2025 07:38:51 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3DED12020EC;
	Mon, 10 Mar 2025 07:38:51 +0100 (CET)
Received: from lsv03305.swis.in-blr01.nxp.com (lsv03305.swis.in-blr01.nxp.com [92.120.147.118])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B9B241800081;
	Mon, 10 Mar 2025 14:38:49 +0800 (+08)
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
Subject: [PATCH 1/2] dt-bindings: rtc: Add pcf85053a support
Date: Mon, 10 Mar 2025 12:08:45 +0530
Message-Id: <20250310063846.1867615-1-pankit.garg@nxp.com>
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
 .../bindings/rtc/nxp,pcf85053a.yaml           | 44 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
new file mode 100644
index 000000000000..177afbe128d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2025 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF85053A Real Time Clock
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Pankit Garg <pankit.garg@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcf85053a
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        rtc@6f {
+          compatible = "nxp,pcf85053a";
+          reg = <0x6f>;
+        };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..21a05e169564 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17158,6 +17158,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
 F:	sound/soc/codecs/tfa989x.c
 
+NXP RTC PCF85053A DRIVER
+M:	Pankit Garg<pankit.garg@nxp.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
+
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
 M:	Jonas Malaco <jonas@protocubo.io>
 L:	linux-hwmon@vger.kernel.org
-- 
2.25.1


