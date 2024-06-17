Return-Path: <linux-rtc+bounces-1335-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5390A8A2
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 10:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA1D1C22B0D
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 08:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0849190473;
	Mon, 17 Jun 2024 08:38:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126C190497
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 08:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613528; cv=none; b=XSwJ7DAZdRuuVssFISWqzD+2M+pKESgRrSCLmFgiAiCTnYeDqP7tXtqFXS86sVqYsYOIqwOHsRtqd6aDbA7BEX06SR3UYIiykvTT+WbO9Mr5FaYg+jkla/LHH9i9pFUf6tn1FkVs1Bfbg25JbWmrLE0nNq9ZnYK1jXUnMB68a0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613528; c=relaxed/simple;
	bh=9iZmNW5Ylrns1GVS3Kh1kPqZFr0ZPpWvvtixJZGq9Mk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRxoH6Zobt6PLeD2+CoPe7XJ+xspjvRIp5/rr7Ulnvk43nnK44A0SBNI2+xReQ4qcfcZycsGIH+OL/oiwmFyo4qhYI+khDt3Oep1twpKPSppxvfxWF4F2wHCihNdbiNIQggAfCUEMGGTToZ848T8WoIjnACfNC5P97hQHHsOSDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 45H8Pgbk079767
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 16:25:42 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 45H8PFDM079702;
	Mon, 17 Jun 2024 16:25:15 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 16:25:16 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
        <linux-rtc@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V2 1/2] dt-bindings: rtc: atcrtc100: Add atcrtc100 bindings
Date: Mon, 17 Jun 2024 16:25:06 +0800
Message-ID: <20240617082507.3968910-2-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617082507.3968910-1-cl634@andestech.com>
References: <20240617082507.3968910-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 45H8Pgbk079767

Add YAML bindings for Andes atcrtc100 RTC.

Signed-off-by: CL Wang <cl634@andestech.com>
---
 .../bindings/rtc/andes,atcrtc100-rtc.yaml     | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andes,atcrtc100-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/andes,atcrtc100-rtc.yaml b/Documentation/devicetree/bindings/rtc/andes,atcrtc100-rtc.yaml
new file mode 100644
index 000000000000..86cecb30c889
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/andes,atcrtc100-rtc.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/andes,atcrtc100-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes, ATCRTC100 on-SoC RTC
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - CL Wang <cl634@andestech.com>
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
+    minItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc@f0300000 {
+        compatible = "andestech,atcrtc100";
+        reg = <0xf0300000 0x100>;
+        interrupts = <1>, <2>;
+    };
-- 
2.34.1


