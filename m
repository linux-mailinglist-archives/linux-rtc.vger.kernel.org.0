Return-Path: <linux-rtc+bounces-4853-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C458B51858
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E9A3B89B9
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C946B27587E;
	Wed, 10 Sep 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="FE0OBX8p"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1497721B195
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512369; cv=none; b=iYDHit0KlQf6ff6gqevzBAZVNX1SX+LZdXDJ9YEa9HqYyfwuWFxLkld1qmY1UzbL6e50tOkFn6Wev28XAsOLxcXvvI3fkL3MHx2y4soQ2rSrHoF8YQVQgMvEIW0+LC6/NXAA1BQTnxPkgOcZFwg92nheNHNg1/MMyPIIgj7qKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512369; c=relaxed/simple;
	bh=d57C21XYFc8gAypgPRhZ314Ib9xcXEDWIWM5LHoC1Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS1ixwlJ72DahQg6+j+akWLe2u5THbOpcPTSur9/cegEPK6hUEdQ4toPFPLA129DF35pE3mdWs5SDV4r0Y4PVfq67fU8+Ta5APG9kPK6SjOeiUey44ILUvU/JawAGF833m+oNMuyfYQPCZUd5A7WVEaQHaNT+3aG2zmaCCnKGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=FE0OBX8p; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 62A84101403F
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:22:44 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 62A84101403F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512364; bh=d57C21XYFc8gAypgPRhZ314Ib9xcXEDWIWM5LHoC1Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FE0OBX8pGN/Mkd3rLRUBhT9iIBQAGKOiwrQMfgF2xKxqHfc8ZUHF8dvib4+ma6P26
	 /GitBKPXfVZ/s7h63ATZxbfB+RVfN5K+0QD41PuvJrsjV2jyFnuZDHOCqmgK44TBiw
	 U2NeW/fPrGKyGhbW5HF1vjSRwj4MJs09CBPb7t2M=
Received: (qmail 6477 invoked by uid 510); 10 Sep 2025 19:22:44 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.850564 secs; 10 Sep 2025 19:22:44 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 10 Sep 2025 19:22:39 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id ED35F3414DE;
	Wed, 10 Sep 2025 19:22:38 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id CDF571E813E1;
	Wed, 10 Sep 2025 19:22:38 +0530 (IST)
Date: Wed, 10 Sep 2025 19:22:33 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <3aed714163abc86a18a62f039b285643d9504e64.1757510157.git.akhilesh@ee.iitb.ac.in>
References: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>

Document DT bindings for m41t93 rtc which supports time, date,
alarm, watchdog, square wave clock output provider, user sram
and 8 bit timer.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 .../devicetree/bindings/rtc/st,m41t93.yaml    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml

diff --git a/Documentation/devicetree/bindings/rtc/st,m41t93.yaml b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
new file mode 100644
index 000000000000..bd593669cfa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST M41T93 RTC and compatible
+
+maintainers:
+  - linux-rtc@vger.kernel.org
+
+description: |
+  ST M41T93 is spi based Real Time Clock (RTC) with time, date,
+  alarm, watchdog, square wave clock output, 8 bit timer and
+  7 bytes of user SRAM.
+
+properties:
+  compatible:
+    enum:
+      - st,m41t93
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: rtc.yaml
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      rtc@0 {
+        compatible = "st,m41t93";
+        reg = <0>;
+        #clock-cells = <0>;
+        spi-max-frequency = <2000000>;
+      };
+    };
+
-- 
2.34.1


