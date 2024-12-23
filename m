Return-Path: <linux-rtc+bounces-2755-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0E9FAA40
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 07:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36AC416426E
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Dec 2024 06:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBB418A6D7;
	Mon, 23 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/sdoyim"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F57D3F4;
	Mon, 23 Dec 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734934881; cv=none; b=Pdvi5kPuPcvwXZ5fUQAUkR9W74upPueu/18xD2jzm+OVFUkD1Qpt3rvpUadt8ou4BlsIHcpkr1NLdy3u120IIUa+SAgnEGW+OP/8UKObuOGFvXkUWcCeTbQyx5oTCc55ntv6cXi5mClDz/HwEFDPXcwp78WZAZU0Tf0RDQ8RQQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734934881; c=relaxed/simple;
	bh=GXZMKg+Bnyc3XJwEPZ52DoGXwOG66RqzMtbFUcoudp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLaTbQttivdQjWqtEOuNaA9qdaE7UkzMCOsG1W/5yShgLdkYleTg1Lv8Jc7/PrnWZdyg+9hHGmuqqGE1wWk4l62rfHUETNmQ2IMx4FCoLNOUIftG1FoSN9/otOX043XBCKi/Ee26tvgwnRwisHakeQ7CdBE6h0xDfmaWHlSDIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/sdoyim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E12D5C4CEDC;
	Mon, 23 Dec 2024 06:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734934881;
	bh=GXZMKg+Bnyc3XJwEPZ52DoGXwOG66RqzMtbFUcoudp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n/sdoyimqCTYZn7XdPTxi0+LvM40vITxDnOlHPGdDtV4XMxnsnPluZK5wIyscjmI/
	 Y8ZzT4fm8qvESlqFQun0ObTkdC+3u6WjN2qN34C9GyXR6iEMQqPasTUxD9/yEI1QE+
	 nZd0Y25wvuXxSSV/ktNnuL2SEVemOzdW6Ppg76G+MfICl5kQgS9sWKClT733nGluXd
	 CQpPnnUKcSqwIWvvvkFki+VwilmMfza0BivYLAyPaex4gqicAQZg2qdjENSeK2EOI8
	 HDokpefINl8hk04DYjZdjhUMl5r5D+2vlZmegU2aTKtnRY606sHIS2gPHG2GdzWGkx
	 7SeNCXhBHEp3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56FEE7718D;
	Mon, 23 Dec 2024 06:21:20 +0000 (UTC)
From: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>
Date: Mon, 23 Dec 2024 11:57:44 +0530
Subject: [PATCH 1/2] dtbindings:rtc:max31335:Add max31331 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241223-max31331-driver-support-v1-1-f9499bd598f5@analog.com>
References: <20241223-max31331-driver-support-v1-0-f9499bd598f5@analog.com>
In-Reply-To: <20241223-max31331-driver-support-v1-0-f9499bd598f5@analog.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 PavithraUdayakumar-adi <pavithra.u@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734935277; l=1825;
 i=pavithra.u@analog.com; s=20241220; h=from:subject:message-id;
 bh=mTwNwMEdUX2ezuu+9NDkzYCZ9EeOKu6++/AuTgXj4JE=;
 b=LLD4gNlg5/48BU0ZB3+vRs7+dccaSP4Nnfm/huC+YiIchIKvti/7UGnAqfoIKC1X/eVzYfb7T
 dHYS7JD63s8CyWlt44IvYSnHvnm1OwGi7JcaypGJBRobXGyiV05+gTf
X-Developer-Key: i=pavithra.u@analog.com; a=ed25519;
 pk=RIhZrdpg71GEnmwm1eNn95TYUMDJOKVsFd37Fv8xf1U=
X-Endpoint-Received: by B4 Relay for pavithra.u@analog.com/20241220 with
 auth_id=303
X-Original-From: PavithraUdayakumar-adi <pavithra.u@analog.com>
Reply-To: pavithra.u@analog.com

From: PavithraUdayakumar-adi <pavithra.u@analog.com>

Add support to max31331 RTC chip in adi,max31335.yaml

Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
---
 .../devicetree/bindings/rtc/adi,max31335.yaml      | 32 ++++++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
index 0125cf6727cc3d9eb3e0253299904ee363ec40ca..2379600911304e995086de6393fae1fd24f5c653 100644
--- a/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
+++ b/Documentation/devicetree/bindings/rtc/adi,max31335.yaml
@@ -13,15 +13,15 @@ description:
   Analog Devices MAX31335 I2C RTC ±2ppm Automotive Real-Time Clock with
   Integrated MEMS Resonator.
 
-allOf:
-  - $ref: rtc.yaml#
-
 properties:
   compatible:
-    const: adi,max31335
+    enum:
+      - adi,max31331
+      - adi,max31335
 
   reg:
-    maxItems: 1
+    items:
+      - enum: [0x68, 0x69]
 
   interrupts:
     maxItems: 1
@@ -50,6 +50,26 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: rtc.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,max31335
+    then:
+      properties:
+        reg:
+          items:
+            - const: 0x69
+    else:
+      properties:
+        reg:
+          items:
+            - const: 0x68
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -59,7 +79,7 @@ examples:
 
         rtc@68 {
             compatible = "adi,max31335";
-            reg = <0x68>;
+            reg = <0x69>;
             pinctrl-0 = <&rtc_nint_pins>;
             interrupts-extended = <&gpio1 16 IRQ_TYPE_LEVEL_HIGH>;
             aux-voltage-chargeable = <1>;

-- 
2.25.1



