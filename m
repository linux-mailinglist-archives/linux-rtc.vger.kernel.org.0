Return-Path: <linux-rtc+bounces-3509-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA4A632C0
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 23:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621FC172C82
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 22:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D81C84D3;
	Sat, 15 Mar 2025 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDbEVIbh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AA319D06A;
	Sat, 15 Mar 2025 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078971; cv=none; b=KeW8tNLump1NVOY31ekWsR9ifeLm5r1+Fbe2iUw/aQvvrGfd8JYEYLe1oST1NhUO3LlndmqXHlr4ebx6h6VdACIMhsDwG9LE/yQM3iGQuUM7GVIrAtXWYZBXpW8xngGPLEHCYDTd701HzHT+H1nEALWnvDwpA+E9o9A6qsZVfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078971; c=relaxed/simple;
	bh=u3rqUwCU4XDWiEqSaLjp3Ri55hicxwzBah2VGWN3MoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7lQIZGPK/QmPvXgcsuvdbnBNCM6illeZIWAM0xWkVplAJNxu9I7+XR2MTzZ+4lGJ49nVJ/+J+7808iOvx+17qnphauBy1MWze5JeQR4Gkw/OkXyYoskksWDmahb7diOIyqAkNOFZGXxCS0oonoUEVR409Ril94GyZ3qPOe4/rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDbEVIbh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so5650079a12.0;
        Sat, 15 Mar 2025 15:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078967; x=1742683767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dymk5NDXOnGvVfyO9fnI/EnalYvslfe/wlkmevGLGhc=;
        b=MDbEVIbhQA3pS47TcVE2B5M6prhC/WV3GVQcncv0DinuBatfOH+7fc2ZfDf+DaA6ki
         fbZwdIplqx8px9zjIP5WruBqTBGaBo1QYuttG6igqZitdukLXr4DshRQTyYt7rIUoxlT
         jeTc8hDEPb13wOpbA4izQW4SfsBNqQJGjKIzwNgF6OChQK7Mxn3wz/8eeHsMbc75UWBs
         EyZkSlbQy3c1+NPDqI3T3J/Drj8ciIlHfeGA0dqjj0GmRVaCQSmXUNC6XnUsccOaqbIr
         +ijw+1gKazpW3Gqxqp1pNqvey+56xLcSDwy3i1A0ejZJxDgb92DfbGEu9lgq7CfUdRmL
         +Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078967; x=1742683767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dymk5NDXOnGvVfyO9fnI/EnalYvslfe/wlkmevGLGhc=;
        b=iY/uFaQpsd1gKUr6gpjAKCtSf9lpa00PrwjG4twlQZZb1Qdvsq5PMxUiBmfd8mCi1v
         Df8dzX0rcX7w/mAfnx3g7yI2Ynp0H/zI6Ojyl5hkj1GjAdpJIk6rVqgJXWwMVVH8kG+D
         0dFxe0lOLmMV7ksrGwr9mO2WPrIdgpla0bgFEaWt21E+kZWp1jfEDcZlVdk7jkywDoMo
         N9YNfllQBjCkRKB5+iEEPSw8ZysJ4/SGGJssEKEA3ST2w9rYzW/3SEkoW2LjuBfzbvBh
         kOQdTczwm/nIcn6MMdmaBLof3BuPjtnt4p/O+MJtD/19QwF3kzom59sfjQ2gnWPatyCx
         Mzwg==
X-Forwarded-Encrypted: i=1; AJvYcCVGLFs/lAnWONkoeSSp2fy71sUCEdXoV/8xEpwpPb7EIw+dKge6yDhJZJ7m9yFqh5y5jMClUfgfG0Xd1gki@vger.kernel.org, AJvYcCVTJEw3X2a1eFyU99Ge8A0wfqCyiH2s436UKMf+LOmsaGDjsl8K5QVaIkV+PvHMgvH6ut6mH8E09en2@vger.kernel.org, AJvYcCX2YP7y86ukUf0OED8TGcAxE4go38T6aPI5xYfswZMiMfTen2+WiA1GVxvBFeWKNFA9xXi8SX0m3q+c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt7z2eGL8+sPTwyONJddTsIOf4XPWIXni9YjrL2KzDCPPVb7m6
	IaQZBcw4v4lwaC8lsEF3mOCVjnaZfGX8XfAebRagP85S1OKnpcR0Hdsy5New
X-Gm-Gg: ASbGnct0Mk9RcEXU/nke6seSD66h6ro51jQJ7Y4nDUHj9gdvkWyHytFyX2tWojDqwuA
	F/07O5LTpJKPfOvttvEWvFj5aiZco1v/vdvQtcYph9xxY6irhFPeKOphDLQppy5U6kFpY3DTJsS
	fm++RMBMDshyREHIqJLkyZBRMw86H+FQfugYprVf5lrUOUpfTpmVQocRlCljqaYdNHzOg9GqwZi
	ZqTec+Wi4X9E/W6NnZCeXLcQ3/zr4jTqcV89xdK5CY9jS8nne4nWyCL5ghG2JiecptY9YkLv11+
	qz8bHFueiMK9iTGB9D7ZvtLpWGd7m7jv1CJLUs4K09G5tnl2Aps6MayXaQ==
X-Google-Smtp-Source: AGHT+IEufEPFKmezzyyBW1gs6pWk9iMehkx2yVP4twAuvTceJ1xSya1DnKsBPx/LLL+anXc1DsJ6nQ==
X-Received: by 2002:a05:6402:50c9:b0:5e7:c50d:9dd8 with SMTP id 4fb4d7f45d1cf-5e8a0bf3c89mr8361479a12.32.1742078966534;
        Sat, 15 Mar 2025 15:49:26 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e8169b160dsm3775586a12.41.2025.03.15.15.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:49:26 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 1/3] dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
Date: Sat, 15 Mar 2025 23:49:12 +0100
Message-ID: <20250315224921.3627852-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
References: <20250315224921.3627852-1-alexander.sverdlin@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changelog:
v14:
- no changes
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


