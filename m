Return-Path: <linux-rtc+bounces-3438-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEE2A58823
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 21:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A1A188D90D
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 20:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5632621B9CB;
	Sun,  9 Mar 2025 20:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heK5XRdP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB6321ADC1;
	Sun,  9 Mar 2025 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552010; cv=none; b=TE0rAv6+XecGR9mjj/LACtRtjQJOmWnSDlEeP1ZeK9rfnLHCBzQ4yyoXI21fj7BPwrPI5QUDji2YXd6ExjlfDiOXn6lpGSW2GsDyBGd3Sq7R167wC/pQlUabRoPm46tvNB9BnhJcsZV3aa3eGDrtpbAmtx2fkMYaQG2xlTIyoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552010; c=relaxed/simple;
	bh=F3cdf2Pun+QwUrQMwjJHLneORLZHKHKObVzmIuTIgpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyeM7e1/scJOBMxdkagO0HP66STkdRS8QktRUV6ZFOqV6WkNJiGlOrgY9FVgVTew4tsqvRqmPISBd7tm0jtkpzh0aBuV/TU+qvuqk+ZkO6tcYZi766D9JmOg4e1oxRDsrivJmwFWYc4ptNiIevzmIAYmrjKPBeQv+xMYrKEyMUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heK5XRdP; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so3303035a12.1;
        Sun, 09 Mar 2025 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552007; x=1742156807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdqKnoVx0etfX45OW+fypKpA3XDIhcKZ1eSXDwOmnjI=;
        b=heK5XRdPAwHEXzJFuqGxFzkFay0NGay4pzQkPGNVO8Nn3cl2grPsV6ipwLlR2RBgGP
         Sb2cuIf+qjm9441mL2/7QWtkWBp4IdOmbafUdUb7rky6bLmsqRYFiHVW6IVxaMqIoIKh
         WNMbHzw3zBBHSlLGJg2g6RkLzRUaC1992pNTXEQIjYDm2CGwoNgUZVbj+dIlFSBfoeFD
         GQoAVbyOEu4a9aLiPq+NsTCIhvQ3lHnDqWtjboj8ylCG78qF4z4XLzpmBTi0J7M2MhIw
         8dM2EIENPLfOi/nGukJ0c3aNR3MCQO2YqPCWZc1whu6vRGw72kZKms2HQgNyQWPz1o7d
         l7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552007; x=1742156807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdqKnoVx0etfX45OW+fypKpA3XDIhcKZ1eSXDwOmnjI=;
        b=qulym4WYd5KcWFZ4bjHPCXk127BpoT3IT6poZKL7Txhojnr5bogc8tj8x2+YMeGICo
         hGeVIPnE93qNfTKBp/cOWcaagBDrlydqj4bAJhWdZzYXkRqIkowbXOCmpFbqpYJYcmz7
         FH1lltb7s9V5PzNBLolPztJ18OV+1WpHMgBER0/jGJuz3tvZAJlHLV2wJYnLg0oYpKdt
         VuaFYPbGTZCjNABGyzavE0wDGPHW8DA05Mb0IaYhLygD5TyYa7XkE3i+SRpcemnwfMta
         0Ihs43Wk5trKPR5NCj/5Fv4alZyYfTJ56AJif8vYfAQQxZpIhk9WZQ88orYc86K4BVDK
         nEIg==
X-Forwarded-Encrypted: i=1; AJvYcCWuNXK7+hUGUTXhaX1zBug3Sy0l4mNql/PjQl1GOC/H44NaY6z8BFjUf7lsmOUAS34KAG7uXjTaZPyz@vger.kernel.org, AJvYcCXcLaDZgO9MOVFmKy3YMiga1pHAynpwFgfw0FzCFMaPkoyZbGN555KbsnQNTge8LbR0WXu+dgslsrGq@vger.kernel.org, AJvYcCXszNIcdUKGNq9g/giXM4T1yRuCkC29x+TmiqQAf7pciWKzoXCaq0LS9yhRzxE/7rLOZiq5kzCwWhgwG02e@vger.kernel.org
X-Gm-Message-State: AOJu0YxBw8XtDVZynRhlPKt73s9pc08jMb62QmH9G3s0qbhqe0O0TUA7
	/YU4iMo4so29zv3VcMyTKUr6NKnAEpfxe3ypa+miGUydiHlwQVmk
X-Gm-Gg: ASbGncuJdtkzJt+Vo2cHpoQ1EBzMLEaMfPEbDle/qcWjqh9zYP5nhffKSEKnjh65Ny6
	sbarDcETC7qOLQYSYyajayJ9/m+xDWx4auZQyA6XsQb8Doxaqg6v6qS3tju//LnXUBcAQmJDa49
	3dvC33SatdOLeMd0ihe4FMvc7t8WRoG2n6MumG4bl/R8pt8kWQRIVGL4KcBO1pbeVSwfPR1PKci
	0h3EmtQPkoIVkpyAYHYe/nB8GOzAZjagS7+/IVP1afiSkfUv4/eRqi0AiQZsS4kY/51H4tqAFXf
	UhN76/UOlOCO2PZ7xZboOYwFfhrPFu3AybLoTqRCNe4kYMfzCQ7+OOR0og==
X-Google-Smtp-Source: AGHT+IEfsqIh7jXsVRSTB3hJ7A+XE0NL1Lyzez6UJvECg4L8wiO8q2zzms77Kr1kJYB9s1cac8H5Yg==
X-Received: by 2002:a05:6402:42c2:b0:5dc:7374:261d with SMTP id 4fb4d7f45d1cf-5e5e22a3716mr25364446a12.7.1741552006303;
        Sun, 09 Mar 2025 13:26:46 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:42 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
Date: Sun,  9 Mar 2025 21:26:23 +0100
Message-ID: <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
called RTC, but contains control registers of other HW blocks in its
address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
(MCU core), accompanying SRAM, hence putting it in SoC subsystem.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v13:
- Moved bindings from MFD into SOC subsystem

v12:
- maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
- dropped Reviewed-by: Krzysztof Kozlowski
- link to TRM
- mentioned 8051 core in the description
- binding is now MFD, not RTC
- added "syscon" compatible
- added "interrupt-names", "clock-names" (because of added PM/remoteproc)
- main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"

 .../soc/sophgo/sophgo,cv1800b-rtc.yaml        | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
new file mode 100644
index 000000000000..5cf186c396c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sophgo/sophgo,cv1800b-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
+
+description:
+  The RTC (Real Time Clock) is an independently powered module in the chip. It
+  contains a 32KHz oscillator and a Power-On-Reset (POR) sub-module, which can
+  be used for time display and scheduled alarm produce. In addition, the
+  hardware state machine provides triggering and timing control for chip
+  power-on, power-off and reset.
+
+  Furthermore, the 8051 subsystem is located within RTCSYS and is independently
+  powered. System software can use the 8051 to manage wake conditions and wake
+  the system while the system is asleep, and communicate with external devices
+  through peripheral controllers.
+
+  Technical Reference Manual available at
+    https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
+
+maintainers:
+  - sophgo@lists.linux.dev
+
+allOf:
+  - $ref: /schemas/rtc/rtc.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,cv1800b-rtc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: RTC Alarm
+      - description: RTC Longpress
+      - description: VBAT DET
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: longpress
+      - const: vbat
+
+  clocks:
+    items:
+      - description: RTC clock source
+      - description: DW8051 MCU clock source
+
+  clock-names:
+    items:
+      - const: rtc
+      - const: mcu
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800b-rtc", "syscon";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>,
+                     <18 IRQ_TYPE_LEVEL_HIGH>,
+                     <19 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "alarm", "longpress", "vbat";
+        clocks = <&clk CLK_RTC_25M>,
+                 <&clk CLK_SRC_RTC_SYS_0>;
+        clock-names = "rtc", "mcu";
+    };
-- 
2.48.1


