Return-Path: <linux-rtc+bounces-2449-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2FC9BB824
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1811C24F12
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2061B6D1C;
	Mon,  4 Nov 2024 14:41:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153721BD4E4;
	Mon,  4 Nov 2024 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731291; cv=none; b=nR1vy8J+rOt1Qtp3ZJDeUG3aipwNATx/8Jxl0ob0Vny39fkfjmzzn3aq1vnnTcQvWx36xRli0y/rAXD4Y3b9ua19ogAGTurWkCBpyKoVy5SLRWwUA8A7Bk3UQiz8+YPfV935grppOPmf2CSImavvMbQGDzm2fP3eG6HbJw5ThVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731291; c=relaxed/simple;
	bh=lNpGmzLd+GCWWCdmZz3c1IKeP/MN8Qj/Rg03I3d6iNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOjbc1OynGokxXaH3IYcQ7nzd2ICcFsvfLCusBZaB/g5UPYzsz7SEANEyQdIU3dkNY9XZ2pJfxV4k7P8JyoH2W+0L7ruWpdSH3PhZqttf3ZY5IKfmx9NXVhryoIpeft4IF6w1s1UfqWqp4M/xtWUatJWLfnkHwC1mGq3BfjwAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4A4Ef79l068328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 4 Nov 2024 22:41:07 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 22:41:07 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V3 1/1] dt-bindings: rtc: add atcrtc100 Real Time Clock
Date: Mon, 4 Nov 2024 22:40:53 +0800
Message-ID: <20241104144053.1136083-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104144053.1136083-1-cl634@andestech.com>
References: <20241104144053.1136083-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 4A4Ef79l068328

Document devicetree bindings for the Andes atcrtc100 Real Time Clock.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 .../bindings/rtc/andestech,atcrtc100.yaml     | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml

diff --git a/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
new file mode 100644
index 000000000000..cf99cff76734
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
@@ -0,0 +1,44 @@
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
+  wakeup-source: true
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
+    rtc@f0300000 {
+        compatible = "andestech,atcrtc100";
+        reg = <0xf0300000 0x100>;
+        interrupts = <1>, <2>;
+        wakeup-source;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 10342c0fa599..372d7ea53c98 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3357,6 +3357,7 @@ F:	include/linux/mfd/atc260x/*
 ATCRTC100 RTC DRIVER
 M:	CL Wang <cl634@andestech.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 F:	drivers/rtc/rtc-atcrtc100.c
 
 ATHEROS 71XX/9XXX GPIO DRIVER
-- 
2.34.1


