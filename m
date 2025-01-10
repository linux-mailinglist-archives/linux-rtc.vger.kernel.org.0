Return-Path: <linux-rtc+bounces-2871-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC1A08C7D
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 10:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 319CB166DC0
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 09:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A4F20D51E;
	Fri, 10 Jan 2025 09:40:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E555D20C480;
	Fri, 10 Jan 2025 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502050; cv=none; b=MU0vDlDyFhzSuaCoLytkKb4wbwogOiMQzUl0bFZQz9oguR+ss3y9Ork+4RTYL4hTNhwE4JDW4OolnIHYf9Nd1EOJ+Lhi+ErYEZNURp4l890OSMtoYXKaTIA31Egsck/3kfO1Sl6WeOYMhzB2PC5Gw/1ueQ8uXP0nMmSNVbzixto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502050; c=relaxed/simple;
	bh=uZdP8/epjKEhFK1erl8MtdJSQ3EKwzhoe6MyZclcjGw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MBY87pW+8svg1SDMGgNDbWaNA8ilDLkMKNDj++wT/nQz2z+GUP9zC65jIax8pWxEWJh0LpbUF1M9kT+LA6JYJgKrZ1u2H+bDam7/mP3r/2zJOgXiJn6Y/uQATlA+WEgQx+p+0wTptD2VJ+EoOukj33GNN6GL2HiPSYM7o0BGb0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 50A9RkSV046123;
	Fri, 10 Jan 2025 17:27:46 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 50A9RLBo045873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Jan 2025 17:27:21 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 17:27:21 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        <ycliang@andestech.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V5 2/3] dt-bindings: rtc: Add support for ATCRTC100 RTC
Date: Fri, 10 Jan 2025 17:27:01 +0800
Message-ID: <20250110092702.1146356-3-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110092702.1146356-1-cl634@andestech.com>
References: <20250110092702.1146356-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 50A9RkSV046123

Document Device Tree bindings for the Andes ATCRTC100 Real-Time Clock.

Signed-off-by: CL Wang <cl634@andestech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes for v2:
 - First version of devicetree bindings for the Andes ATCRTC100
   Real-Time Clock.

Changes for v3:
 - Used compatible as the filename.
 - Placed allOf after maintainers.
 - Replaced additionalProperties: false with unevaluatedProperties: false.
 - Added descriptions for interrupts.

Changes for v4:
 - Removed wakeup-source attribute.

Changes for v5:
 - Rebased onto the latest commit in rtc-next. No changes to the content
   itself.
 - Add Conor's tag
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


