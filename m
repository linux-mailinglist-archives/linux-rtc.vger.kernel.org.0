Return-Path: <linux-rtc+bounces-5067-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3EBC12C4
	for <lists+linux-rtc@lfdr.de>; Tue, 07 Oct 2025 13:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F271D19A0840
	for <lists+linux-rtc@lfdr.de>; Tue,  7 Oct 2025 11:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85EF2DF3D9;
	Tue,  7 Oct 2025 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXse/G7O"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220062DF3EC
	for <linux-rtc@vger.kernel.org>; Tue,  7 Oct 2025 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835931; cv=none; b=pz4sy/91Rex5m6hc014jBqNG75Kwj/Qbv9lqmWM8ly7QMUKIwxAqtsyycH9/tA6kjLtd31p2daNJcF6oO/yhzgZtKcnFOCZx8IbhtTu/3YZjThC55HPnzNF3okD+own6p83NHwJjGE2kxAsKNiMBr60AaUvrw/K0NwE7HEDc474=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835931; c=relaxed/simple;
	bh=d7bQy0SdounSmC8jpi+/HU+WJQIYNBZC5J2m4z/NNDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UJM/r+6axAzehv7dvZckHy9fXzB8wxOejyutJdYHSEv9/NcLGwVXiSEg4kdu5inFZqcRZVw0CykutMw7x+YfriSbPkJ0mus4SA7ipTwp3uaU+3ReOgsSoEqI8oCnQwaEcUVnK+M/AsME5w+QTSZuTrSCYpC3Ibkc3wysH4nxcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXse/G7O; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-271d1305ad7so95015925ad.2
        for <linux-rtc@vger.kernel.org>; Tue, 07 Oct 2025 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835929; x=1760440729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCAPdNKXJAJcEkJcDhcjdf1sPz5hSUw5MgyKkZ0p1Mc=;
        b=IXse/G7OjAjjoaKZnkQvJeLMVfl7FkTN0yhp5SRUDwysOjobeeg4eDmPe6SZnpkMJL
         yrJlxpRf2QwZ4kyoUWMYxtdS2fxTejJnbkIQGvZLgWxaanSBXpNIO2RAQcPYMY0ESena
         RPp6tin8rZ6XdGxuXWM185bLicckcw/Wc5662lfTTirznz5epS6iDgIeKAcT7QsdnWb/
         +QvFkiq6xrJVGsQtlvCdFiLZXNOAsRN8w3+bmOKFbAlZScowyUArWsGB++7quwa+wvYW
         OIS3vp6YaYVRcZNzCd784LKW9hkz6YqjBSWTHZntkAcNcYhF1wygW9cj6yxR1NIlF8zT
         /nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835929; x=1760440729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCAPdNKXJAJcEkJcDhcjdf1sPz5hSUw5MgyKkZ0p1Mc=;
        b=qZX8uq4uNc5P6BePOfoKN7yHzscFWjt940RQpdxZ8FaYW89D09u9aUh62xpoCwuZ+F
         6CJQtcMT4oYnv+Y14tlcFvbYPWPyTRchKukFaeuucBCNPFbUeW+fffItu7ZeUfj2nX3Y
         rV1IFV7/oXGoyvEJsTeOjGS+4LZ2+Uv1BLEmAbJjsbtdTGWa/vuiDG7ExyYDAPFh9KhC
         kfN3TNhcYpRcmbDqjwzBSZQT1d0M6i7f4hCYRetLcV5X5plkX6CNgekdfRivWEeW0hR0
         z558I2Zyz7lpAWT/crHYD1+TO/aU7Ec7/6vV4/M21Ds+d36bdCrjz8Z5pDd7iHUIzN1S
         RRNg==
X-Forwarded-Encrypted: i=1; AJvYcCWeDwYOcnwGSk7zW9GJg4mWuyRIY47g3pxGrbLHjJ2T+XIiR34tlu1VALdh5n7mYlGjey3vn98fbaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGoejOP/iIHG3P38kkhjhDB6M+ko5F8PpU+4pXu25tvHU7Pzy
	rmVNPfcJJ9bEAa9Bc4r0pjeMOzek8PgGjKImg3jwVn/go9j1WFFXR7HN
X-Gm-Gg: ASbGncvJv+KD9w9aScxFnVHKm+FReKhJzriurdU/xA2XcfzIvU6nkfWc6MDw/H2nMpc
	9qRDRWH2SKEWROS1AXAiptL5kNX7lJ85nuljpwjOD5b6/lknSXJ0dSTmO0FsdZs8lhzLgPnLJ+S
	lMaz0V/Qk9P0p3CEM2zFIui8pg5slo6bsNY1SZ3wEPNpelkKFGnPmfzRf3w+mvpPvButsZFW+5C
	WhTCDBCrrVL74vz9QPnmJKsxDolxDo9FJe8RJfBJhShGpTAk6E1DczY+j8IgoVY91Py316v6Eti
	FmV4nxEP2IumLF7SvJbFxJ9hx4kJv9bRKCl4JGGvGTiCtPoEu7ANnLozXDbfa6K7a+V2vlxtA0j
	lPFhlN+0A4h8AtscMdJpEQgIWwG9bzL9b3HUPoNbk3kvP5k0Q4He7/8tMRDc82yV71qtIsJDI+m
	WxqHS1TSE8+lsQaUoCWizGXCWOYd4yumSH7cxndOV9RA==
X-Google-Smtp-Source: AGHT+IHfFdoMlBoIXqzrWMT9RmZo5vW+Dn8SIHU12lJcuw3hvHw9CkNL5y/ftl9SyGp75w6luvCUCw==
X-Received: by 2002:a17:903:38cf:b0:271:45c0:9ec8 with SMTP id d9443c01a7336-28e9a65686dmr167161655ad.37.1759835929326;
        Tue, 07 Oct 2025 04:18:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:53 +1000
Subject: [PATCH v3 12/13] arm64: dts: apple: Add common hwmon sensors and
 fans
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-12-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4644;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=d7bQy0SdounSmC8jpi+/HU+WJQIYNBZC5J2m4z/NNDs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3LiQyNvGA56f7Tw3ofdhvf38exui6Qd2ZZ0GsJM
 cfHe4qEOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZgI3zmGX0ybfr9c12HOyzdR
 lD19cV5cu0XH3u1lk2e3K6S8nfH9ejUjw9GXqVc38Hw9UmHNLjNJbnL7Qf/VE1flNosUSi5c8Pr
 5byYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 22 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 17 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 33 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 15 +++++++++++
 5 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..b87021855fdf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..3eef0721bcca
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * SMC hwmon fan keys for Apple Silicon desktops/laptops with two fans
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..fba9faf38f4b
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..0c4666282a5c
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot Temperature";
+	};
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temperature";
+	};
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 000000000000..f32627336ae7
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon sensors expected on all Mac mini models
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temperature";
+	};
+};

-- 
2.51.0


