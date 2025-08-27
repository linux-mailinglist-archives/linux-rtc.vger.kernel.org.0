Return-Path: <linux-rtc+bounces-4777-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90043B380F9
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F6A3B4044
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FDD356914;
	Wed, 27 Aug 2025 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FN1lOhQ1"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4D6356918;
	Wed, 27 Aug 2025 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293842; cv=none; b=ieBMdO8nGbxj4JAbBq75K2mQ5qweM/yX+BvzpBzBI5z57T+tPksHDmKGJnLS15OvyKz+j9xo0836IBrs8lemwWOkn0m6cLz8EY55jTIdfuLzsNR+L8Vyj5wCTG2t2qvb9b8CAXklR62P1IY8TUf4AnHt2ZIywK6sfHa80x2FO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293842; c=relaxed/simple;
	bh=Z3EXP1oVeh319IixHdWS8udDApNWGWy/kj1Vo/lfXn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJc6lFLlR+B6DHcLh/OpkKfbleP+sTIAdkTxmVpcgn64WwdrEILfoU+SS2rZziziyYC6pghgm1bAt0dBaqvoFqA2avqZxnSjFjd4OPtPIJKumWRQHn4D1CJyXdb8Qd7xmT+3tFgpQtJzJnRTA0IwsusuAQ2cvNRLVZZva/tuOog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FN1lOhQ1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-771e4378263so2762602b3a.0;
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293839; x=1756898639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=FN1lOhQ1Hw5fG0qinMFN+ArlfGoqDh9BWpPG/+b0W3I+CJ4eQsOWlAKSlGwaaNUUM2
         W7sAkiOP+8isHajA1GUb5nxcj9Wjz0N8MVoxkQ4F3sA/hTxeNRO9+ST04+SgDhYfbV7t
         K6M/5n36PhVX6fUdnv6KyalL6owOdNhVbt/MtI9lRe7KU0q4GS4pWs3+3SalFPC2j59E
         vbR/bUw8CjnRzUAzj3j2nb/qQeFGQuIHwYh+w2OpJ39kLQFFV6u2rcmX4qA3RQKD4msQ
         F+xL56j+udXSeS1vqy6wJ5T8ejGUsr0UVFIp3+PyqAu0rdLaB8zxqkCQubZMkz3GSdoR
         9DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293839; x=1756898639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT7vuW0qUznHG/v/TvOsEbv5pheChsn5Mb8ce2CH7oc=;
        b=E+6/bvdCdyC1u+rImw7FxvUU9/svlw9G6hhmd4L6/EfqUnBHa5jSYVFJoTaPwdtblz
         GT3130rWZzG5iW3b6CfIBl+tLVPX6jXMlvHP/dKaSFNzCA/un2JbMTDgqM9pmgJZ0qz5
         FL62GovL6lYXSFC/2Dp+3wmcjQL7OzqNVwGUSsFt/UNoosaMOr/MSGAoJquSso4qttaA
         EEshztuTXG14dlXmcVUVY80OzWSPDNarOdm1tLGTKLffYT2lan1f6sLurbj8Bb3D0kRR
         eEYblGaM1Ds1X+VL5wJjjIXtuTE2JCZ38cVg464LxKH3oMu7FCl0Ag9BuM3FfyN7E6b/
         o6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUKIJNj0xGbdYieReXbaPiKkU4sSzbUpDlT96S5zMOT/BPydw9EE3PDc3pxzsxAffdKUBgc8Qv+7sMKWeM=@vger.kernel.org, AJvYcCVczvn6N9a9HLiLv6SBfD9QktbRJXAzPSHI+Qqksj1j/Ru1z7VWn2rceJ3HQDxJsKXt1/C/WglnqOj9@vger.kernel.org, AJvYcCVhHGHp40+LY2dgflTzu8L0sn/+xpZl3hC1EXKBCS3AjIZbjNWqnAf6HdTepGf0VAnLXDyo8svv22Dx@vger.kernel.org, AJvYcCWiaySCcVFTb/Jp7j8FQMzx6e/Y4JeB9K28xz8dvcxKqXfm/Qe/m0B84rcj+evz5DVVMsWm+O8iuGskGyqD@vger.kernel.org, AJvYcCWwZSlYvz/A5mBsV0glqGl1/7ph+woTzFRgQz5zQ4ufcl1zFMHuyqIpT3t5VxmMrUhOHByLzBdMSp+bRD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4j0Ji1ySevGUHQjGnFjYKYNvlWpqgNddcVpj/1MFTajAbKzx
	9WFraucfQjjdM9v/nsJ45bWS6SAhZ6uF7Yfi1iE67yJbdOlxBLy4MPhU
X-Gm-Gg: ASbGnctUIn6smwYBkgI6AgSWHXZpCJmIo068RN/t2y+2llLxtlX8m8wANF0mi5Miq4I
	2gZNq1fwDm/UUqp4Gts12D5xAtAVQxaRzA03cTqCpJqr5frUJbISgIExBX0kfq7gPu7Gd8ANCcZ
	q/Ha87VJTBm/VPuQPZkxe4p1jXl67Md/WgquRiMqkU7CXbsZyJi60vRxN0FaJoGycDy5LgnZyaW
	NSS0xXCEL6S24/ZUBpMYa6bjoHhT8R8OBsl/gZfanNI15zh95Na/GYjAzgq6A0zFFkKJp106uSv
	KQ+2zt0s8KXKJrRHpFAXKXKj97LFVp89cEfPHcIy3e16Hpj8Q+tF9S5vJ/V8yG85YtrU5EfGreK
	IxQxSgml6CPesdwuIDQzHtuB0ErcsNnF1SurA5AsJ6cRxvTnhcoCjANjKjW7fKlzLM/7webkxKV
	yNmwVrG2oq3+/CCXhK
X-Google-Smtp-Source: AGHT+IHcxdwpHkhgx4bx6bhCCrhmDPbhWf5p9x/BFk1Qsu0LkH89VOH4xmT8ZfSWgNKLsJylxiDZxw==
X-Received: by 2002:a17:903:1ac6:b0:248:614c:b8ca with SMTP id d9443c01a7336-248614cbc2emr74240555ad.48.1756293839333;
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:44 +1000
Subject: [PATCH v2 10/11] arm64: dts: apple: Add common hwmon sensors and
 fans
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5045;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Z3EXP1oVeh319IixHdWS8udDApNWGWy/kj1Vo/lfXn8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW772R/fPBE58YpzUVnanXkNGvM6h+v9QhJrJoX0
 erR9DWgo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIksl2D473I3yzi8O72BMZbd
 7MfEY2c85P5Gqk7UTp2zUVGptp9lDyPD/Tjt3Y/zf5r0HU2Q6bvscmfhNFe/7jNlfRk8nuu3npV
 hBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Each Apple Silicon device exposes a unique set of sensors and fans,
however some have been found to be reliably common across devices.

Add these as .dtsi files so that they can be combined with any
device-specific sensors without excessive repetition.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../boot/dts/apple/hwmon-common.dtsi     | 37 +++++++++++++++++++++++++
 .../boot/dts/apple/hwmon-fan-dual.dtsi   | 24 ++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 19 +++++++++++++
 .../boot/dts/apple/hwmon-laptop.dtsi     | 35 +++++++++++++++++++++++
 .../boot/dts/apple/hwmon-mac-mini.dtsi   | 17 ++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..bac4e44d3f9892fe8ad04125e47dcccb2bcf57a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardawre monitoring sensors expected to be found on all Apple Silicon devices
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		compatible = "apple,smc-hwmon";
+
+		current-ID0R {
+			apple,key-id = "ID0R";
+			label = "AC Input Current";
+		};
+		power-PSTR {
+			apple,key-id = "PSTR";
+			label = "Total System Power";
+		};
+		power-PDTR {
+			apple,key-id = "PDTR";
+			label = "AC Input Power";
+		};
+		power-PMVR {
+			apple,key-id = "PMVR";
+			label = "3.8 V Rail Power";
+		};
+		temperature-TH0x {
+			apple,key-id = "TH0x";
+			label = "NAND Flash Temperature";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "AC Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..f81047725de473b85d8f337af63fa10d3aa827a0
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,24 @@
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
+		fan-F0Ac {
+			label = "Fan 1";
+		};
+		fan-F1Ac {
+			apple,key-id = "F1Ac";
+			label = "Fan 2";
+			apple,fan-minimum = "F1Mn";
+			apple,fan-maximum = "F1Mx";
+			apple,fan-target = "F1Tg";
+			apple,fan-mode = "F1Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..ae5e1a54b6b780ff880ca0a39bc2712d8cbafbe4
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * hwmon fan keys for Apple Silicon desktops/laptops with a single fan.
+ *
+ *  Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		fan-F0Ac {
+			apple,key-id = "F0Ac";
+			label = "Fan";
+			apple,fan-minimum = "F0Mn";
+			apple,fan-maximum = "F0Mx";
+			apple,fan-target = "F0Tg";
+			apple,fan-mode = "F0Md";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..227dc5065bb2b74d9699019b71eed90501e1b4b1
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Hardware monitoring sensors expected on all Apple Silicon laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc {
+	hwmon {
+		power-PHPC {
+			apple,key-id = "PHPC";
+			label = "Heatpipe Power";
+		};
+		temperature-TB0T {
+			apple,key-id = "TB0T";
+			label = "Battery Hotspot Temperature";
+		};
+		temperature-TCHP {
+			apple,key-id = "TCHP";
+			label = "Charge Regulator Temperature";
+		};
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+		voltage-SBAV {
+			apple,key-id = "SBAV";
+			label = "Battery Voltage";
+		};
+		voltage-VD0R {
+			apple,key-id = "VD0R";
+			label = "Charger Input Voltage";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..6344deff06ebb9c1b0fbbf6b986db879eb5f19cc
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mac-mini.dtsi
@@ -0,0 +1,17 @@
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
+		temperature-TW0P {
+			apple,key-id = "TW0P";
+			label = "WiFi/BT Module Temperature";
+		};
+	};
+};

-- 
2.51.0


