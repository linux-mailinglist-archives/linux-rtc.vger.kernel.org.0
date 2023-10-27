Return-Path: <linux-rtc+bounces-140-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B877D9E05
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Oct 2023 18:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941121C2100E
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Oct 2023 16:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC8B2D023;
	Fri, 27 Oct 2023 16:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=carlosaurelio.net header.i=@carlosaurelio.net header.b="GU8+mSd+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9EE39842
	for <linux-rtc@vger.kernel.org>; Fri, 27 Oct 2023 16:32:26 +0000 (UTC)
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6644110A
	for <linux-rtc@vger.kernel.org>; Fri, 27 Oct 2023 09:32:25 -0700 (PDT)
Received: from MTA-14-4.privateemail.com (mta-14-1.privateemail.com [198.54.122.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 6F8FA60017
	for <linux-rtc@vger.kernel.org>; Fri, 27 Oct 2023 16:21:20 +0000 (UTC)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
	by mta-14.privateemail.com (Postfix) with ESMTP id 8A69518000A1;
	Fri, 27 Oct 2023 12:21:18 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=carlosaurelio.net;
	s=default; t=1698423678;
	bh=AW/G6JMLGRxgorKzisd+5zSqQcRwYNQOCuDovebvS7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GU8+mSd+hNeEvwTycwnuKIFL/b3wLda5q6Msnfx4ul6psbCGGr3Mk1UbEXet2udEa
	 oyJ7P0PBJorTSupMDMQCyFTwJz+em9Mivektj1gGDs+iYmi+pCJDAZWU5Jcgo7UFVV
	 dv/FFxl7PIK8k0xPN6TdRE1OfYaurkyhr+EfCL5jPps1yhRdBQINQV/c8cUfoLi1xN
	 xzFD9nwS9XZaan/eVrG6meWgWlx1VITxMLeVUxSEuzNDs4Osq3Yjzzf8tE8vM/bGsq
	 3Ews77MqQcyuEoO99+NG2c9IzSnMp86Z226z1CevhmQ4DK3Ty29PetNkF06RaTVEzR
	 vGnsLTvr5wmEQ==
Received: from GB2-C0476.gertec.local (unknown [152.254.207.93])
	by mta-14.privateemail.com (Postfix) with ESMTPA;
	Fri, 27 Oct 2023 12:21:11 -0400 (EDT)
From: Carlos Menin <menin@carlosaurelio.net>
To: linux-rtc@vger.kernel.org
Cc: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	Carlos Menin <menin@carlosaurelio.net>,
	Sergio Prado <sergio.prado@e-labworks.com>
Subject: [PATCH 2/2] dt-bindings: rtc: add pcf85053a
Date: Fri, 27 Oct 2023 13:20:44 -0300
Message-Id: <20231027162044.1011951-2-menin@carlosaurelio.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027162044.1011951-1-menin@carlosaurelio.net>
References: <20231027162044.1011951-1-menin@carlosaurelio.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add YAML bindings for NXP's PCF85053A RTC chip.

Signed-off-by: Carlos Menin <menin@carlosaurelio.net>
Reviewed-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 .../bindings/rtc/nxp,pcf85053a.yaml           | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
new file mode 100644
index 000000000000..80980377e27f
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,pcf85053a.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,pcf85053a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCF85053A Real Time Clock
+
+maintainers:
+  - Carlos Menin <menin@carlosaurelio.net>
+
+properties:
+  compatible:
+    enum:
+      - nxp,pcf85053a
+
+  reg:
+    maxItems: 1
+
+  quartz-load-femtofarads:
+    description:
+      The quartz oscillator load capacitance.
+    enum: [6000, 7000, 12500]
+    default: 6000
+
+  quartz-drive-control:
+    description:
+      The quartz oscillator drive control.
+    enum: [low, normal, high]
+    default: normal
+
+  low-jitter:
+    description:
+      Low jitter mode.
+    type: boolean
+    default: false
+
+allOf:
+  - $ref: rtc.yaml#
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
-- 
2.34.1


