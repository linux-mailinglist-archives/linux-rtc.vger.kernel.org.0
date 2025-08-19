Return-Path: <linux-rtc+bounces-4722-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2482B2C232
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CB85A0753
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF23375DA;
	Tue, 19 Aug 2025 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddCJhxgk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370933472A;
	Tue, 19 Aug 2025 11:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604139; cv=none; b=oAN3iqDZEync+xL2zvtqdfX5EowyGG41Tk6rsegtzsb+QG5ZEp2AKE0/x3agCbQR+1iAh0hIK01vOlQ+q/SLaq0Ra1L0NPG90gQhSG6LaVYq4J5pHuMnboYdJ1eze/IcPoiDK7KK136LIae56KcghHlXCxPI0wzyQXSTcpvwlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604139; c=relaxed/simple;
	bh=x2fSqlD1a+GhrYf08R4xKoVp1GNK3211Ryioe6NRPdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ra3BGWVOufe2D9XzEWTydTs3BEGbTRp+CbnCq0t7KKaADN4HvpX5p6s632hBUbQOLR0+WFUzH5KTWU17+MMIpZvHJDghws0aCM8giCc9lAFLoEm5OhTKQIwGQc1ct0GimBaKfPaE3Tv7F8LitsAAcIJR3yg/8o36wKRGZfJHW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddCJhxgk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2e8aff06so4044225b3a.1;
        Tue, 19 Aug 2025 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604137; x=1756208937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=ddCJhxgkaoIpSSmm7cKqS+GPsMZfvb2od/hXrcfYwDYpxFnCKT66zBHhtpMe8xJAR2
         lP3DkrtJ3pGVLft0TDbtN5pesSWc7LlUccrAF8nLPj/K6YDnupxuymdugVfwa7LClGhn
         z07JnQH+K8pb9Uh6Ou/tsIZ3XaLY5R/rB/fSSEyoi2czCYyX5NLvSSxsVilemzWQ0oE3
         /aezi6y6sv7h0+8mEqpVh/n9f8PEUzwNVSLbsYnnPJmgxYxl2nLVJ9z8WTIl6SdKzB3n
         9JCz1wCIvg3EYDS5itO/TWUDMc9FR9WV5QuzCGUg8kFXWj6w67AVvvRoyhJVrMC94Y4C
         FxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604137; x=1756208937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SqCsknXMXu1IeldEwXpjLyAV6gKojmOFXR8VvOqIes=;
        b=suW6sp5H45LmqU6M5TMnc5JNOoX+IYXhBz2ay8GwBK//MY2ZKOf+LPr71E555ea61x
         qsww0BNbwxJout3A0zhIAC19w59dOWk6YPnV2RViLdlrY/y7x/B9anTDHOcAXXeT14IF
         I21paejqzB1/B71Gh/r4GEDxxfiZGWXbsCnxgpm6gwx3JXj/gRDmRBWgjsvIAKWQFyd5
         mSmktgvw/ZDjeto+BcbyOCUdsGZ/75eM0jqfa2dedXROmB9g/jdKnp2IGUU1F0d8f8FM
         KIK/LlwYf2Wb2uAjmvkm8UB9clBWseAJ5v4mYjH2H3Kz3wV2F5hKzUDo+rkIagpKUc5p
         H+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUFKROo1kbLC16CQ43b/NDMIyFEDFNSjQIUQ/jF/OhnkoK0JB1zlOpdC3LuC+ImVdYzrt/JpWc6yYrs@vger.kernel.org, AJvYcCUXT/RBekb6Pykkzth0pAHqBJYR31WaU2ZEf9ZdnqE9Zf3CX6z8VIxjAj2Y2jkspFp3fWatBBeQqkC/B/c=@vger.kernel.org, AJvYcCUgJBI+wumC2V144vZ1C1ByQpfqPCZWIZNzs2r2fAnUiiSObcv8V1VmmAx1ted5k/k8YMBj1VFbpGF8xuY=@vger.kernel.org, AJvYcCVSSgtcbLwHWFYoa1GDyyHnn+xgY6o09UYHoqPAknGjmqXf0eMpXfUuUNReMNA7ReqR6Dl21bJTuPcYxJzJ@vger.kernel.org, AJvYcCWfYjD8QC4/jrClelOhD/l6SqZGCbY/3VtWmP5vYzk/aRvkyZikjJyLflGWW2K3kz9c0MY/ag2sf1Ul@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/mu/GP9iXQXd4FPNJfP4EkqjffqtyBdmrCaMe2Nds5lHbK7YU
	ljENQyC0HfETScu1RyAFucwh1BmFz/fqBxnwRgaKwF4TgHBCwA4bH42K
X-Gm-Gg: ASbGnctms54LYTjIw14jc10m5rc4Egrwod3v9UoVJtR57A2fD/bDyvpnoBKoh/lbFzJ
	ycB0rPGBGKbDxZrS0wc1aZiwGkGFC4hDVc9WLJtFK+i1vL2NEIwqEysZ5oP9sJbK1ORvRZrSoE7
	5NhVVtIxS/3Xic+UREHJGhWMEcD6mGqeXn06ZExjEHK0I6HxeNqZzPBiMvWPWcT/0tl7psJ1BeI
	0J1NC/iqT9UJS+bogIc7U+X+6WCOKkV2mL3yoQAL1w2s8eByfFFtn5ZTmWdG7ILpas5AZrYd59D
	axZQYhfK3ytENQzsmfGL8LfPUitWmvGFmZHu4/GovQfbu4p8qVPITjSQL8d2HSGxRiV0n/iDwpf
	fcwvY8mzRsps5/EfNXUFhhOAzIy5cnEYM/ZDfAl5Dh3a0hhDGnL3/BojUsazM7ssuXGLe/WIRxQ
	aOT1c8lfyrz1t9WW4=
X-Google-Smtp-Source: AGHT+IGv8XYNQhdMisvhcNFC2QCyy2wLByb+FNRg29NG9SM7abSIzlHCw3nXf5ewYBYJpL+eRz80rw==
X-Received: by 2002:a05:6a20:72a5:b0:232:4a42:dfd1 with SMTP id adf61e73a8af0-2430d420584mr3645255637.36.1755604136875;
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:59 +1000
Subject: [PATCH 7/8] arm64: dts: apple: add common hwmon sensors and fans
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-7-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5299;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x2fSqlD1a+GhrYf08R4xKoVp1GNK3211Ryioe6NRPdw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvKP7rrxVWf2KXfjsxf5rPefiTo9+UGJ3P+zueWND
 5xe21pd6ChlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAi9+cwMvyZuprz3e4pLMd3
 Ri1pin3ukTOlW/HfRu4/652XOF294tDF8M/oqWp7nJV4iv79g03erLOW/3z1xS5R+oHa9ZB/rZ3
 idYwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 46 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 27 +++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 21 +++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 43 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 19 ++++++++++
 5 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..b8da8951194d1bce6e55f3558a2f4af8b3bbb45c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		current {
+			current-ID0R {
+				apple,key-id = "ID0R";
+				label = "AC Input Current";
+			};
+		};
+
+		power {
+			power-PSTR {
+				apple,key-id = "PSTR";
+				label = "Total System Power";
+			};
+			power-PDTR {
+				apple,key-id = "PDTR";
+				label = "AC Input Power";
+			};
+			power-PMVR {
+				apple,key-id = "PMVR";
+				label = "3.8 V Rail Power";
+			};
+		};
+
+		temperature {
+			temperature-TH0x {
+				apple,key-id = "TH0x";
+				label = "NAND Flash Temperature";
+			};
+		};
+		voltage {
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "AC Input Voltage";
+			};
+		};
+
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..2897f3b7a6a32ad3d31566816a1b237f27dc281d
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		fan{
+			fan-F0Ac {
+				label = "Fan 1";
+			};
+
+			fan-F1Ac {
+				apple,key-id = "F1Ac";
+				label = "Fan 2";
+				apple,fan-minimum = "F1Mn";
+				apple,fan-maximum = "F1Mx";
+				apple,fan-target = "F1Tg";
+				apple,fan-mode = "F1Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6d307abd64adef9dda1a64351070968167cc9f3a
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan {
+			fan-F0Ac {
+				apple,key-id = "F0Ac";
+				label = "Fan";
+				apple,fan-minimum = "F0Mn";
+				apple,fan-maximum = "F0Mx";
+				apple,fan-target = "F0Tg";
+				apple,fan-mode = "F0Md";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f2d473c26526cff89d497b4702323996764973de
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power {
+			power-PHPC {
+				apple,key-id = "PHPC";
+				label = "Heatpipe Power";
+			};
+		};
+
+		temperature {
+			temperature-TB0T {
+				apple,key-id = "TB0T";
+				label = "Battery Hotspot Temperature";
+			};
+			temperature-TCHP {
+				apple,key-id = "TCHP";
+				label = "Charge Regulator Temperature";
+			};
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+
+		voltage {
+			voltage-SBAV {
+				apple,key-id = "SBAV";
+				label = "Battery Voltage";
+			};
+			voltage-VD0R {
+				apple,key-id = "VD0R";
+				label = "Charger Input Voltage";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f65a3011372bd2bc37f84fad3abcd6ca59e88549
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc {
+	hwmon {
+		temperature {
+			temperature-TW0P {
+				apple,key-id = "TW0P";
+				label = "WiFi/BT Module Temperature";
+			};
+		};
+	};
+};

-- 
2.50.1


