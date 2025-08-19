Return-Path: <linux-rtc+bounces-4723-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34242B2C233
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 13:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA7665A55B7
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 11:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A5D33769C;
	Tue, 19 Aug 2025 11:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNWvq4Zv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D587334709;
	Tue, 19 Aug 2025 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604146; cv=none; b=qBv/DXwgR6Fpps6GmTRvSBk+ldMWi68Ws/LcmwoR9WmDnFDj/3BF9OYrkYs4SnNoE6+01QqPTS+nlMRAa+cK5EZv27PKHe2bCTQCWN1W9mJqSIDubeYcf6ATu5taNY7yRmafd2Te4HjEQMTQTg6bu8NQB6d5bNMKy63zqkfHch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604146; c=relaxed/simple;
	bh=DeO8Ii5S4xPqjwogDhDaxek/3Uge8D2U0NrM4GwGiu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p9yECeAhHqbz4NT5o6U9UOYsoMWacrrS0nUikHU29VSZ1uzHAsxXSfExBdEZnm+PHRNYnFYXeo7pGg/r4rLZebJqZLZWkPHNKHbxP020ZUjTkm5DdzQYsfq3esCl8pAmCsnJ6+NfjzDA0aQndtdR6qlfPItDAwmoDlkrYCtvWD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNWvq4Zv; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2e613e90so3746576b3a.0;
        Tue, 19 Aug 2025 04:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604144; x=1756208944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OhP9WyP/wpWu6Mb4fbUxFs+8834wmIS++iJ9iNw9HQ=;
        b=bNWvq4ZvPIFvucosDy0/hyuU9BnXVHUs1cf4Ob/HlHaBxPI8H/18rYlnHO2x0+qL7z
         ox1qltAJbClsVx3brf/CLIXtcnE6TgnGtdIefxWfyjUlKbc0v0GOCOYSx2An4ra06WB7
         EvRLW+Y+UWS/cqxrPoEoo9c0yispMk7D1jGbUzsbUNBlXXm//nuXHB174NjqrWAOuU+i
         RJIsauwPM4GNdSbfYah7Ih7qvFevGu6fqxnPPd7/hvmzIL2iJhxfmP2cFCo+4/Ymd4eP
         ahXDBJveYINu6GBoX22vpx+N9Yull9v5qoll3U1dp5Tgr/tZhPX001HnB4WMTar3t1pu
         XZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604144; x=1756208944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OhP9WyP/wpWu6Mb4fbUxFs+8834wmIS++iJ9iNw9HQ=;
        b=jG0soxbSG7r7f4VSHixIxYAFHSw0841GWUNuyXdZH30mxGlaOKgPyljo7EvtSM++O9
         GNtV+bGrNviEZTH+lGzI2KDddjcOCGlKmg7zMwvNRN0Ph8HQhqG0bFu21mYQBgxZq+Ed
         j0rbiKfSIX2hhyLtrSJeMaWasdnj/CZNRRUz2cQ8jWS2oRlFS0b0ihItKdadgZKd0W2H
         fMm3zQ8dyU4QR7AeB+G/MCAtU6YVS9dA3Y9iFtNgJLRQFpyv3TS4OFujrA+1d+pMfYuo
         uTg7Fjc8X37AIs5hxgm5qfxr2Gqp2dHHMB9BiHIpiGIOG3E6eny47yxw2Dsav1+eKqsr
         XhYA==
X-Forwarded-Encrypted: i=1; AJvYcCVLSBSGj/XueodndEqMayWlMbaYYmsOrveSkJ7Y3RhOvzzNdjQ4eRBM1W/ucI8tc/srWl6QiYIB/chCoeQ=@vger.kernel.org, AJvYcCVlNq0LXIKisQPAKtQoC4I4LAQ/i9+rwmkr6K5nmH4HxVDkoZfC6MOR5JuA8cYw8+i0FFIi2bHZjzOY@vger.kernel.org, AJvYcCW3RmVgOkRZHI/F9MwGpG87YIBNjH6hTK9rHn1seR99ZeO5nobDZMaCvFHlVn63I9Gos5sTKxPAoRecaphH@vger.kernel.org, AJvYcCX69kITUvkNQOrHUq0Aqi2WvidmCrLJUD9NWUGk0RTw+lj4kqtpzifes4nkF7YQb0BwaT3U7zAcVNBx/c4=@vger.kernel.org, AJvYcCXR82PkPzZYtovUDwNUt0L6u6Y9OJcspa37UdGK5qG44PcygSoZUwdyn54yaUtxaf5jl4DzPLpEPcKR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5POCPZ07vg1a/3jZN5Ik7/TMe++xiG3XiBBgDDBDxhyEoWJlP
	T96GKYJPn8EY+Oeo/iIhW8W+JcOGkPGOMeyq3lgwuKnOGNVhZV+h6mcK
X-Gm-Gg: ASbGnctV6jWXejgjDDmajbcTsdlsFxSebGvuW3yCBIamxZSBoITiMy5EiTw+lu3GGJK
	hcz35YvI9rpAbOA0blIZE0/2aJvJ6CC8xpXHwmgSbzYZVCzdTukOVdfxGaoIh8BBycPFt+kOUuc
	DEmr6YSXIQpUeQOfxqu6ApUmlg1qVKUAiUvfApEvl8uo9rzdfJ7ILs+uBjtT05D49zf88coCa+Y
	qwz5/FKILcLN7igroHjltIa2zXnxYqiB9rt3NcIiHQ5UblNkYUnkpxUuMM+HWQ8kwZdMMIOcbfj
	2aYKpnDr8Tvbm0ugNYwVEPq3cGQ0pvtHfKF8fvpK/NZc3n9+blVqigkjK78qPNRe7xmMdfB98cZ
	gmNznIt4N3V+3TOcunohQnOYhtrtRvf95M24vbPlWw3ernfAK35CkNeWXQWLG9+umeEkCQvjWPp
	T0WSgWyzlL+AEzrqNKRL03tEysEg==
X-Google-Smtp-Source: AGHT+IE0AX7GGv6lhJRvMXNEeWItmzt9jXuqrt/pCi46xXUUO89+xvPNiTEdfoooayxRjMHduL6Iig==
X-Received: by 2002:a05:6a20:a10f:b0:243:78a:82bc with SMTP id adf61e73a8af0-2430d4d563dmr3224506637.54.1755604143798;
        Tue, 19 Aug 2025 04:49:03 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:49:03 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:48:00 +1000
Subject: [PATCH 8/8] arm64: dts: apple: t8103, t600x, t8112: add common
 hwmon nodes to devices
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-8-57df6c3e5f19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6874;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DeO8Ii5S4xPqjwogDhDaxek/3Uge8D2U0NrM4GwGiu0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvIf35OWPVC7/Lswm+0246dyUbd1Zxr42pQtW/HvP
 ZfTf0+jjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbS9prhf1JPpHPfrn0y02IT
 93/43Xj18r2TSY5WVVNfBj4xU07m+MXIsN1CXZevaHnPd0sZgUNaERsKDvIsy0mLXdVtpNb5+tw
 uXgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the known, common hwmon-related SMC keys to the DTs for the devices
they pertain to.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6001-j375c.dts | 2 ++
 .../arm64/boot/dts/apple/t6002-j375d.dts | 2 ++
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 4 ++++
 .../arm64/boot/dts/apple/t600x-j375.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 ++
 .../arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 .../arm64/boot/dts/apple/t8112-jxxx.dtsi | 2 ++
 14 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 62ea437b58b25ca649e20b1072b4d835bbc17d3a..9e8c4107e65d8dc47ad2ad99af2f436613c11d8f 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -16,3 +16,5 @@ / {
 	compatible = "apple,j375c", "apple,t6001", "apple,arm-platform";
 	model = "Apple Mac Studio (M1 Max, 2022)";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index 3365429bdc8be90b63c8051822243d897854ab27..b62cf16d6b73e74c3d9116730b44596be2a89ea0 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -48,3 +48,5 @@ hpm5: usb-pd@3a {
 
 /delete-node/ &ps_disp0_cpu0_die1;
 /delete-node/ &ps_disp0_fe_die1;
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index 22ebc78e120bf8f0f71fd532e9dce4dcd117bbc6..2cb38861c3855e31c9b8ab66fe69b818c381c604 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -121,3 +121,7 @@ &fpwm0 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index d5b985ad567936111ee5cccc9ca9fc23d01d9edf..7e551e8660c9c2b51f021b1188680c5cce9d2951 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -128,3 +128,5 @@ &pcie0_dart_3 {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..f5b8cc087882d6bd2b0f4f2711844d2a0fa8b604 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -61,3 +61,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..abb88391635fa048c196d0631d90405519ddd178 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -119,3 +119,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..491ead016b2193f123f4ded9dadf85ebf37cdc7e 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -41,3 +41,5 @@ &wifi0 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..c2ec6fbb633cc6aeec2322f295c054998fbf08cc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -75,3 +75,5 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 152f95fd49a2118093396838fbd8b6bd1b518f81..20e85612ae70c116cab788f2c03f5a7d76cb19be 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -48,3 +48,5 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 0c8206156bfefda8a32c869787b2e0c8e67a9d17..f711af410a2edf7587ff091e195c5cf243dc8a34 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -92,3 +92,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf89ce73e3486bce504f1f5f8003f3..500dcdf2d4b5da698ee0798f37f624ff70e7b9f0 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -78,3 +78,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..11db6a92493f367cfa64be5e844c80e99bdd325b 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -52,3 +52,5 @@ &pcie1_dart {
 &pcie2_dart {
 	status = "okay";
 };
+
+#include "hwmon-mac-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a8fe7966f5541f24f03a379143cfb..a0da02c00f157a0e667b26aebef9157636b14ecf 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -133,3 +133,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
index 6da35496a4c88dbaba125ebbe8c5a4a428c647c3..6e54c1fb097e8f72cb4fb37e491893a7e3d7e6c2 100644
--- a/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112-jxxx.dtsi
@@ -81,3 +81,5 @@ &nco_clkref {
 };
 
 #include "spi1-nvram.dtsi"
+
+#include "hwmon-common.dtsi"

-- 
2.50.1


