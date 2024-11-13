Return-Path: <linux-rtc+bounces-2554-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 789A39C798E
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 18:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A85FB426A9
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 15:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0E814F114;
	Wed, 13 Nov 2024 15:41:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7841C92;
	Wed, 13 Nov 2024 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512491; cv=none; b=S9j+tsya5ywvzXxgJH90mpi9hld6Et+eBxtCJn/u13cW3ghqo+8fdscaPSBfL6pFt3cgbMdFG45wX/yNqivr/loXiZfAF3eqwcRtqmDmABDZ1Gmo2ezPei8fltI2sxRnBfJTsoDauQJCA1uGkCiREbcdD6s4RYT7B5xU6T+x648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512491; c=relaxed/simple;
	bh=SrZ4Sljd9url0qeaurkyD0bI6USgZYsbUiA4Kym2zlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruQ7b7HBaqatZdHk8sK7vrRdu4UjGrysZ+9mGLvX21V5eL+4tIc5eNHEuV6Na5boPXNc8k21hWm/iWrKcqRUq8og/nfm+kjkGaUexY9dmZkZkSbjIF8xqsnuhBp+T4MHrgZQRAoLBn7zX4yOZWzbvj0n0vVwPnuSXH5/yXcIhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 4ADF86dD090419;
	Wed, 13 Nov 2024 23:08:06 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4ADF7eo2090279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 13 Nov 2024 23:07:40 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 23:07:41 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH V4 2/3] dt-bindings: rtc: Add support for ATCRTC100 RTC
Date: Wed, 13 Nov 2024 23:06:52 +0800
Message-ID: <20241113150653.1793123-3-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113150653.1793123-1-cl634@andestech.com>
References: <20241113150653.1793123-1-cl634@andestech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 4ADF86dD090419

Document Device Tree bindings for the Andes ATCRTC100 Real-Time Clock.

Signed-off-by: CL Wang <cl634@andestech.com>
---
Changes for v2:
 - First version of devicetree bindings for the Andes ATCRTC100 Real-Time Clock.

Changes for v3:
 - Used compatible as the filename.
 - Placed allOf after maintainers.
 - Replaced additionalProperties: false with unevaluatedProperties: false.
 - Added descriptions for interrupts.

Changes for v4:
 - Removed wakeup-source attribute.
---
 .../bindings/rtc/andestech,atcrtc100.yaml     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml

diff --git a/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
new file mode 100644
index 000000000000..ec0a736793c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/andestech,atcrtc100.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes ATCRTC100 Real-Time Clock
+
+maintainers:
+  - CL Wang <cl634@andestech.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - andestech,atcrtc100
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Periodic timekeeping interrupt
+      - description: RTC alarm interrupt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@f0300000 {
+        compatible = "andestech,atcrtc100";
+        reg = <0xf0300000 0x100>;
+        interrupts = <1 IRQ_TYPE_LEVEL_HIGH>, <2 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1


