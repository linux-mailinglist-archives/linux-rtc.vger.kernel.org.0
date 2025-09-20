Return-Path: <linux-rtc+bounces-4996-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A92CB8CAE8
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 17:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D18E4E0F75
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 15:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C622F7AAF;
	Sat, 20 Sep 2025 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="c5U7Iht6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D396B433B3
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758380498; cv=none; b=DIlFlpxL5onISH3E+ZsFLLMtHsCYwQPyTeh77RBZMdGVvBJFKzZGG+AAitmQVEuzylDoqJy5yr3ftiGCxRVJ5q6IP9qnMqI+vJ5KUAlGSBxwg5xm+UHSEAKShuCZF2KwAiEIBRsoO6Wy/noH95x2xtp+hTSyc9/yPYC0Dg3RT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758380498; c=relaxed/simple;
	bh=H36sHa475o3DMj3qEzqKS1HJCezA19sLq9EpMwJkNow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjkmSyWsg17FCd7U66VNl2pvVzzuGkNd+fOcyy0Bx2MOpgyIJ1gR8bMFefidkWCIg8HMP2+oMaFNIvhIyF7SBtzm+8TOq/WzofnN6O7xgR9cXnEphcaqdblHnkqllh9mLduWW1PzRt/3BKQXUtwi+06ACFeqnpAez5qc1QkUXto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=c5U7Iht6; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 4B1671080223
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 20:31:33 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 4B1671080223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1758380493; bh=H36sHa475o3DMj3qEzqKS1HJCezA19sLq9EpMwJkNow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c5U7Iht6Ptan7e2IgHChAKEvIGuJjTJkdK5qAWKuzLCgDRkzi1YWk1YK3M1qMOjx+
	 Wrx6u1/0jqLMPyEPbc8p54mHxd+Edm1qNlbWkWgeVeeQqdYebJ3mZRLV6scBdc5BOS
	 oNvJUpicxnCdfFcN1/kfj82xpogX+mYqYQiJxgaE=
Received: (qmail 10334 invoked by uid 510); 20 Sep 2025 20:31:33 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.357098 secs; 20 Sep 2025 20:31:33 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 20 Sep 2025 20:31:29 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 4DC83360036;
	Sat, 20 Sep 2025 20:31:29 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 2CF011E814BD;
	Sat, 20 Sep 2025 20:31:29 +0530 (IST)
Date: Sat, 20 Sep 2025 20:31:24 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v3 1/6] dt-bindings: rtc: Add ST m41t93
Message-ID: <b1b1f7abde8a4ee8b625361bca32934679bf1e1a.1758379856.git.akhilesh@ee.iitb.ac.in>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>

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
index 000000000000..bdd995c5c1f4
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
+  - Akhilesh Patil <akhilesh@ee.iitb.ac.in>
+
+description:
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


