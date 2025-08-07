Return-Path: <linux-rtc+bounces-4647-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B75AAB1DF01
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Aug 2025 23:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65429189129E
	for <lists+linux-rtc@lfdr.de>; Thu,  7 Aug 2025 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A082512D7;
	Thu,  7 Aug 2025 21:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBSQD8Dr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7C11DDA18;
	Thu,  7 Aug 2025 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754603068; cv=none; b=ILPD4MAgsd4vA+7RiJ+quJEtV6oKsyhaODchbV+tDYE4MbwQCw8dyFKnQPzRwtnDDJtnj6HOQIE7Z+86Q+3MfDDJaFPVVme4dJvRHVGeW1i0NVaC4c321nrR2O9le7blNd2l0RUb49aumJljjOnywFXruimaEjNt4l96crtNQnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754603068; c=relaxed/simple;
	bh=17jm/vsWRzponfhYRReQJs6c8DYkYLDPFXFuUO7YZac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1q95m6csfsl2NeF5lEuBSx7bu2JVw4zKHLRdufUPTPAeGOhUl8tbAt6tz4IPUAVljKMAVi+BHQaGiJAbqsEqS/V3pfU1JAA4RND/ek/vm9mO2LUi51JIDFQ3QHZY7G3Gnehjm+7SO+Qyp6at6VtIBclU8VmVVfywHYsnfd7I9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBSQD8Dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6396AC4CEEB;
	Thu,  7 Aug 2025 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754603067;
	bh=17jm/vsWRzponfhYRReQJs6c8DYkYLDPFXFuUO7YZac=;
	h=From:To:Cc:Subject:Date:From;
	b=KBSQD8DrfN0KXMPZSj+no/jlwnb2zuIEmrr7ta8qwE6H4bkv+gDisK4/9cVRp0e5Z
	 ESrcLw6pBnsGcPkW6aJXOgrwALU1ymWD2tfmd2B7B3YDEztovMdEyCDpFmp9reC/4r
	 fWC8R/MKWBt+J+wswR7bcK2uB30pcAW5Z8zgYcEsFGso0bgYCAF4xwc2KIalOCcIU7
	 j5moJ1olrNEHb6gSlKTz7tTPSfJnMgbSW9IWe/4mqD9FZAdBylwxva9fXubqEN2jti
	 9G/1gYE34EbNhs+gFB7FS3xjZ2BSDLavmFG+Tu8WtJAPcEbusxT+3qn223PHXsd0GG
	 gkJaZoacNYtog==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rtc: Drop isil,isl12057.txt
Date: Thu,  7 Aug 2025 16:44:13 -0500
Message-ID: <20250807214414.4172910-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "isil,isl12057" compatible is already supported by rtc-ds1307.yaml,
so remove the old text binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/isil,isl12057.txt | 74 -------------------
 1 file changed, 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12057.txt

diff --git a/Documentation/devicetree/bindings/rtc/isil,isl12057.txt b/Documentation/devicetree/bindings/rtc/isil,isl12057.txt
deleted file mode 100644
index ff7c43555199..000000000000
--- a/Documentation/devicetree/bindings/rtc/isil,isl12057.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-Intersil ISL12057 I2C RTC/Alarm chip
-
-ISL12057 is a trivial I2C device (it has simple device tree bindings,
-consisting of a compatible field, an address and possibly an interrupt
-line).
-
-Nonetheless, it also supports an option boolean property
-("wakeup-source") to handle the specific use-case found
-on at least three in-tree users of the chip (NETGEAR ReadyNAS 102, 104
-and 2120 ARM-based NAS); On those devices, the IRQ#2 pin of the chip
-(associated with the alarm supported by the driver) is not connected
-to the SoC but to a PMIC. It allows the device to be powered up when
-RTC alarm rings. In order to mark the device has a wakeup source and
-get access to the 'wakealarm' sysfs entry, this specific property can
-be set when the IRQ#2 pin of the chip is not connected to the SoC but
-can wake up the device.
-
-Required properties supported by the device:
-
- - "compatible": must be "isil,isl12057"
- - "reg": I2C bus address of the device
-
-Optional properties:
-
- - "wakeup-source": mark the chip as a wakeup source, independently of
-    the availability of an IRQ line connected to the SoC.
-
-
-Example isl12057 node without IRQ#2 pin connected (no alarm support):
-
-	isl12057: isl12057@68 {
-		compatible = "isil,isl12057";
-		reg = <0x68>;
-	};
-
-
-Example isl12057 node with IRQ#2 pin connected to main SoC via MPP6 (note
-that the pinctrl-related properties below are given for completeness and
-may not be required or may be different depending on your system or
-SoC, and the main function of the MPP used as IRQ line, i.e.
-"interrupt-parent" and "interrupts" are usually sufficient):
-
-		    pinctrl {
-				...
-
-				rtc_alarm_pin: rtc_alarm_pin {
-					marvell,pins = "mpp6";
-					marvell,function = "gpio";
-				};
-
-				...
-
-		    };
-
-	...
-
-	isl12057: isl12057@68 {
-		compatible = "isil,isl12057";
-		reg = <0x68>;
-		pinctrl-0 = <&rtc_alarm_pin>;
-		pinctrl-names = "default";
-		interrupt-parent = <&gpio0>;
-		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
-	};
-
-
-Example isl12057 node without IRQ#2 pin connected to the SoC but to a
-PMIC, allowing the device to be started based on configured alarm:
-
-	isl12057: isl12057@68 {
-		compatible = "isil,isl12057";
-		reg = <0x68>;
-		wakeup-source;
-	};
-- 
2.47.2


