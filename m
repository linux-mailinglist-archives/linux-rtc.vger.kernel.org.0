Return-Path: <linux-rtc+bounces-3356-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33ACA4B489
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 20:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4FF016B0E2
	for <lists+linux-rtc@lfdr.de>; Sun,  2 Mar 2025 19:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166291EDA2E;
	Sun,  2 Mar 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hxa/mGb+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C111EB186;
	Sun,  2 Mar 2025 19:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740945145; cv=none; b=L/how0f7M4FLTGG8rfer6R+85S9tTWGC6L0UQzxQec2Ht/NtcnUSSJb5LS4C0rN7m22YyqZilJCcgZBV275SdG0I5Yfp6LFUAAvAUEeR2LPD5haqrRRnlMd2zxG3Rir/0/YG8WihytDB9B6tOEOCdlYoxabswrBlEorSTEVsJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740945145; c=relaxed/simple;
	bh=Vf8pU4k/6I94NEvTRNngJqsiSOFMb1PByV25ql5hlew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndERn/gIQBdSZ4Qd8gOJ7VIoFDLzfk6XVOq6vptpUzqJkIXBq8NIS9Likp8a+2+Erv9C/iSsPWm5iUBMoUtcCN05qNIyg2HGt0GxGxsWNr2tnz65/t4tR3fPVoJMHFV4fM40Fj5bi8wj30LMTVootTN1svNVxAjtVVrQ982EJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hxa/mGb+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e0373c7f55so5695931a12.0;
        Sun, 02 Mar 2025 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740945141; x=1741549941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=Hxa/mGb+Ueah7O8dLhmj5bm4pBYq0ufAqEJ6NxND1fPzaHYH/PIp7TuYuf6jChWXB7
         Pixm76iL1xwbwACzl7JG3MkZMwHuvHPILmPbWph1enCsMTKAmlpJ1SSFXzqTBXXptdjb
         FffT6kyJrApF2JB4c4vn5OBT2rn0yC2EWmI1n3afTq0zRyW7DKtaVzTZ+ullH4ARHKzA
         7KK8zBhlppt3Ah0eMqhMrtnE9uszk6Q79gj9ZwUn37J8cRp1Vws9if07EyKVOsBNstj6
         OgkvKcBtZBaH5MncW8OneB14BaOgnbezXaHVyxL8WNWFe2D+fkQ9QaFr6FYBC5Ho0DrC
         Jqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740945141; x=1741549941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c4NPufpKoLHDbbT+GlLj3VGqCkTEQTVZclMQAkqv7A=;
        b=qs/bN4LZQVMLpl2yGqso+o72EwX5uOjA+QGmj03XEAXCo4048E1zRr2vKuR4nms+db
         GYuK+y0wz5sbScQ3pH+95F5QG2zUAW9kqtjdjggTE8iQBueSG8/zq+tne/tGfcaSx1Fd
         5pu/3/89O1f+RWjQZBH4fz5+iMZOrXCmuGC2ec9+MPOylq7RRlNbGa+TbZiMIbg3G7mi
         VQvZlgcajNvNO0duuGe0mDjylW3Yq+UMMb5Gruf7zvpOeDvsfq4OQvwFX6Y577JD4naN
         5Q870fU1/ueOzkUIrzral8Un4FVP2fLgu6rt+6kQ5QozDYhJRC1l3iDUF45cFBPJKt+G
         tbUw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6PtjxHqMg/a1qAgiaG4tsKb/CK99zt5AUAdcwsV2z0+GIc7cu/ckPM0hyt95qnshLFRMfIW7wYbRTZQ=@vger.kernel.org, AJvYcCWv+CeZqGbMFDOPgOv67yU/Xav2+4A1He0K9Be+Mnug0z232kj45S6gz8L3J9R5zyhuMHANCi8lNcTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwCsriiuvL97CqHlH/HZ7UkVc4a2HYGSuNjlmJDqpFO2DBe5p0w
	lSq++19xljcN9G0r3Emqf2tTl0EQrcnubQnLHRVdBTaqLf9EsAVb/4hOJi4W
X-Gm-Gg: ASbGncujQ/iqCHcRZId3MO5sPckuisodyzsaM77Nquiz5l+LPZLYNUYWgiviNBfg4kO
	VoyMeZdLYElR1EfHVRdtHWc52EbUYS+iomxd7J4/LJ4bjsF5Ktru0cJDte9R7gTArlODywivz9z
	BkNw2fhPlMUCM8QFo7qnvgJod4Yg7nABQ6Ww2/O2N2bAWSxr5bjfv08Hj9h4x+oSG6m2uZUiKua
	0ak+lR7sLJGw7GuazH3Dp3x/9cxlHn8KeVWgQbZJM2qGOfBHeTZZGruK3fA12pnlz6O2kI+vyFN
	UzTcpjYNzEMesQB13EPc9rtpHXKVMOpXyMyv5H7vF31XGTWHq8mswvXuug==
X-Google-Smtp-Source: AGHT+IHMRWSeokwzGm9sYVxt6NEktsQseTTVLAH9cmQzwWOcNzWx1ZDznjFLVkWHDK9J21xpb4xkkQ==
X-Received: by 2002:a05:6402:528a:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5e5437c22a7mr3296240a12.16.1740945140979;
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm5809705a12.77.2025.03.02.11.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 11:52:20 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	sophgo@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v12 1/3] dt-bindings: mfd: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Sun,  2 Mar 2025 20:51:54 +0100
Message-ID: <20250302195205.3183174-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
References: <20250302195205.3183174-1-alexander.sverdlin@gmail.com>
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
(MCU core), accompanying SRAM, hence putting it in MFD subsystem.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v12:
- maintainer Jingbao Qiu <qiujingbao.dlmu@gmail.com> -> sophgo@lists.linux.dev
- dropped Reviewed-by: Krzysztof Kozlowski
- link to TRM
- mentioned 8051 core in the description
- binding is now MFD, not RTC
- added "syscon" compatible
- added "interrupt-names", "clock-names" (because of added PM/remoteproc)
- main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"

 .../bindings/mfd/sophgo,cv1800b-rtc.yaml      | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
new file mode 100644
index 000000000000..b80d68502c48
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sophgo,cv1800b-rtc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/sophgo,cv1800b-rtc.yaml#
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


