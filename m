Return-Path: <linux-rtc+bounces-4905-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C29B56ECF
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 05:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58A1A3B210A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 03:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C7F23D7CE;
	Mon, 15 Sep 2025 03:16:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61482257825;
	Mon, 15 Sep 2025 03:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757906177; cv=none; b=lDZtblfnSFQWRduv6m66Srx7EI31W9iWnG1cfdWzIIleuNpKeiLFwqBzQTmh4qYUb0VClufaeoC1jDbpblM66CSvqkGUNqwl2V18wcQRvnvTWB7cpLQxuNyFFG3tz6lPzQzbSrfcLkvMLA3CVVcNJpqH5A8RE+hLNaf9h2dkOas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757906177; c=relaxed/simple;
	bh=/QKjX1VGRm9IAcXS89iNoy1S3aYV23gLcFQzO98Pgr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tG/wqWHrdN0ucNGAAXWtjRqxHFETeDaUxCuudW3FgVggmTLK1G1FHEOyzV4woOS1vgCHpoD4pgyqeSK4WBeXXaOQ7mJf8pgP8hynabbhCWqlFAVQoB6EHjGkc+6kcc3GEMMsMj9ZPiQ8aAieqyeKX+3mQDu4+b+RmcRWxAYopZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 58F3EsPl054336
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 15 Sep 2025 11:14:54 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Sep
 2025 11:14:54 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH V6 1/3] dt-bindings: rtc: Add support for ATCRTC100 RTC
Date: Mon, 15 Sep 2025 11:14:37 +0800
Message-ID: <20250915031439.2680364-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915031439.2680364-1-cl634@andestech.com>
References: <20250915031439.2680364-1-cl634@andestech.com>
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
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 58F3EsPl054336

Document Device Tree bindings for the Andes ATCRTC100 Real-Time Clock.

Signed-off-by: CL Wang <cl634@andestech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes for v6:
 - No changes

Changes for v5:
 - Rebased onto the latest commit in rtc-next. No changes to the content
   itself.
 - Add Conor's tag

Changes for v4:
 - Removed wakeup-source attribute.

Changes for v3:
 - Used compatible as the filename.
 - Placed allOf after maintainers.
 - Replaced additionalProperties: false with unevaluatedProperties: false.
 - Added descriptions for interrupts.

Changes for v2:
 - First version of devicetree bindings for the Andes ATCRTC100
   Real-Time Clock.

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


