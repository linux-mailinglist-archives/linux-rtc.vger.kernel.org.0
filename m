Return-Path: <linux-rtc+bounces-4803-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D6B42392
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD8FB188B65E
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E593112C0;
	Wed,  3 Sep 2025 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="m1eVFLS+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934EA30AAB1
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909574; cv=none; b=mRosYc4PJ0uo2H8MbFxSwY2NMv/L3AdcDkFiETeYd5Cnvou7yDyXq3NjtHkhwxoYfF8ayqJrOZwVFXSDp7/tqntBt/L/7URIJCgflAi83D9DvOxonsgpBKOlvYm0J0MJSqyqIeAkUoHDI8zkRE6Pzo9mvbnhIr0rvawyvydasIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909574; c=relaxed/simple;
	bh=6Wnau2pwGtxpVXRdBkXsDWUXrJJ2EY1XKsnS4Zus4zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6fr2c6clZb3vuoL1TBorUgCzNzGQvizCavk6pTiMfKSIHNw3Fe4HjR+VuUUOrvujk5mNkZO3BCBszSs6Y8RLLmWTsb7ADK0x57W/2w/kgn9ZpI8VE/ys+uw2CKVH7vf2DQPZY5uimdtfH4JTyCn72ShvY93aj9F7ifhjYSdCVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=m1eVFLS+; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 32F481010F7B
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:56:09 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 32F481010F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909569; bh=6Wnau2pwGtxpVXRdBkXsDWUXrJJ2EY1XKsnS4Zus4zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1eVFLS+GZhvGtAN0wPQPJhqoRvTHPkcA72jiycXg0aCYcAKZCJ7yNCoPiBLdlZzo
	 sb0CZtOVJ2e5KQ/J7GwWiOYzJfdJmekrB/DdN5FEu3+rDIHOJ2xV1BDnb4LPz66sED
	 5S1owh3+4N/ZgPyrlHih/OtI3lfJ7GRBwhVQVlnU=
Received: (qmail 21233 invoked by uid 510); 3 Sep 2025 19:56:09 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.35376 secs; 03 Sep 2025 19:56:09 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 3 Sep 2025 19:56:05 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 40126360036;
	Wed,  3 Sep 2025 19:56:05 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 0EA8B1E8143E;
	Wed,  3 Sep 2025 19:56:05 +0530 (IST)
Date: Wed, 3 Sep 2025 19:55:59 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 2/7] dt-bindings: rtc: add bindings for m41t93
Message-ID: <40c91cbb07140ecdf4f91afc118c2518e85041c3.1756908788.git.akhilesh@ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>

add DT bindings for m41t93 rtc in YAML format.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 .../devicetree/bindings/rtc/st,m41t93.yaml    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml

diff --git a/Documentation/devicetree/bindings/rtc/st,m41t93.yaml b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
new file mode 100644
index 000000000000..03673adc79db
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/st,m41t93.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/st,m41t93.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST M41T93 RTC and compatible
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
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
+    const: 1
+
+allOf:
+  - $ref: rtc.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      rtc@0 {
+        spi-max-frequency = <2000000>;
+        compatible = "st,m41t93";
+        reg = <0>;
+      };
+    };
+
-- 
2.34.1


