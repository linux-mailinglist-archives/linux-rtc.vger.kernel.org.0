Return-Path: <linux-rtc+bounces-4778-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67DB380FB
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 13:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 320A53B9039
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 11:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9654A356919;
	Wed, 27 Aug 2025 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2mLUzas"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61B3570AC;
	Wed, 27 Aug 2025 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293848; cv=none; b=l2F3BmMX8ez+RTpcmve8SjLAc7kFdpR5Ww0qO3aZkHVBtj7WICKwInKXgDCMY2IcflyYB0pjpy8pMNPm9To2NTfaf+zxRkGaZC/A0WDOv9hQlhiniM+bp379ph+RSaqMZUYfnyEynUZGaRFqz8r+64D/iGmP/TV3qMukhRZzGXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293848; c=relaxed/simple;
	bh=5hVOIbFNhGdk2deyyP87QpYIGvupinnZhOGdw/+Fj2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQeHL/RK9IZQPP9863p0RR1VPTThxKitrPVCwg5sPKu6JNjwjqiRhONtQT2vA83xysj7Gp1ETiy8ffV3cdc+W2ZzI7VuDW+SIULAvJ7Y1OlfemBF7s93KPjV0C2867ewgOQjJUXQNKXsB3gzV0RTKl9tTSRpO6orzR5DCvwegbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2mLUzas; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-244582738b5so61677245ad.3;
        Wed, 27 Aug 2025 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293846; x=1756898646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAV1SA7tmKDs0DFNYAv2SnCbmS2lL2C7TchccWIUu1A=;
        b=W2mLUzasRXNp/dnUbM+cPn+ccSVA6+Y8O672eCn821uX6jxUDgf7oyMHSE1iPNGOKU
         +JBcSpAs1vjiMccrCYdLVv3byoyV8ty0oQZOBsAk2oebMBR6L7v6pSSF/CzIzvMNuA5w
         fSyGaV7tNfQCl/R6hDhdG1UViLfZNrAPndnxLTkeBXDSLIMq/2gORguJuqb/MHlxUY3F
         /jEqU0acCc41ZnFFuRNhDwBAbh6M21DM4aPSUbqU0gIxL6CwTjUmT7+jygb62wIV0/5T
         JBQbhIAWYcnduszBj2cLCeNrh+dd8y6c4SmKH3S8y0NGLEksfQvgeXI2JqC03zoFw/mS
         OWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293846; x=1756898646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAV1SA7tmKDs0DFNYAv2SnCbmS2lL2C7TchccWIUu1A=;
        b=KDG2b7JHh1m4aZYHjpLpqyUk9HJ2ioBD6PuAps+lUpmZOHGCm0ObHItoIcLEmTlvU3
         4oUNEBtfZk1JykQvhlkzxOil85FbaSz+xHaJ47HrCLprFXeDs9U0flltzB57MKkt7C9k
         zKTP9TQzpqJMbF4Dp+Hyfzkjjbaa8JtsEsh5lMJtmTi65bZgTj4XCI3POM5eik5ja2nv
         XvpIeKC4iips1VPvVStJapKmcp098J6F4giySr94U0X/JT0WqTv2HlEZbOvb4YkP24PI
         CVKp/+Z5/C02xeMdVGgLl2P17mijShQHxt/MfawqR73/ctRE1woccmpfVBibD7gq5I3B
         LnxA==
X-Forwarded-Encrypted: i=1; AJvYcCUH3C/F26Kf7SeCSnCY3b5Pn3W97Jo5galSEhZUGAGytqiCRclET+I24601hOD21LKT44UIaL/CXR7olQ0z@vger.kernel.org, AJvYcCURMsaaPnQw3nuKEEbrmb+CgsEhJWON+9rAI8g60GMK0Tlc5y6XSuflJ6UUOl1lz0KJIXMNAVHVZ4YelUU=@vger.kernel.org, AJvYcCVPKI4OE7PU0VpoCnasnii4XbN8UXYT8rBkC2MoeqpKWeI3ZPmUQn9Sv0XWbt+UN9u9SIlmmPl3aCV7@vger.kernel.org, AJvYcCVqpK0TfBwiCb2vaFDNAZmxXiHGRnMf7BINVwIchdgm2Zv+t88mpCa06FxxFvwCcD5nUULUb4Vyuxjj@vger.kernel.org, AJvYcCWadScwqwWzM+q9qgTG2I+fT37C93//eOUlPejuguyLzcT0AHl4MqrL/w1yJQaK6IPFN8Bx/cQrNhwt/VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUXF0P3i416P9aj5g2Jew9a+ifu+Fx29DE5U2ixsrj+tsdDWk3
	OKJD4YstBcnQtp3qC1TuM/SAuQVERNah8eI05U+WAWYCLmn8Nos9GAiM
X-Gm-Gg: ASbGncsKx5X4afMfAAsmC8Hi725JJBqD1MQoTj8hrDLa6x5USGa9O6ECrpb/+a/gdGJ
	DkiB7iTpqJAqlupNrafJbWgx5N6blobm1NzO8GgWiX11nvamsRrH2sMRaadWAOLzexOizjThVhi
	XNUONDvR4ufSToYrUg0gDGQ5VoTokUJUw36r/q24Zdj7Kt2xMXGC9j5MdAHu+eDLWdQVteOCPP1
	XrOgq1w8VeSPL/BfGugTSpY+viomDWDkuC53jRof11x1O5HLwDMZYoEvMp1QAX21IVCWmU8v7AY
	wqc6nUTn+SoYN/F7Wv2eUIeXtlpYxkkCqbRUyhHEg/uSyrQ1M7EfJhQUXJDH3Icl9xKzOULy8IL
	h8kgX4HadS+QU2HuuYBXRlvwg6xMAAz+yalU44mc6uf4Z0uVlzyFjTLmbWEhmXoq3mgQR6e2UL/
	WvNeM+Y7PCa8xrj7FB
X-Google-Smtp-Source: AGHT+IEgqB5UiBHU0abrKFQK8xQrwcte6KMuII6oePpzWrjYXeDJ609b+w/zvWBMeHhWli3+DXh1nw==
X-Received: by 2002:a17:902:e888:b0:23f:df56:c74c with SMTP id d9443c01a7336-2462ee38734mr223696675ad.14.1756293846078;
        Wed, 27 Aug 2025 04:24:06 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:24:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:45 +1000
Subject: [PATCH v2 11/11] arm64: dts: apple: t8103, t600x, t8112: Add
 common hwmon nodes to devices
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-11-ce5e99d54c28@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6874;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hVOIbFNhGdk2deyyP87QpYIGvupinnZhOGdw/+Fj2E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW3saep7c58/zbWu7Anl9fX5H7Ae7033Zo9z+Wyv
 B+EZ3zrKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCLFexkZvn5dzJQv01djKj5F
 oXLZZeFJz6ZHLdwnWLn8a2OnfmVoNCPD58bYlucFCRJGX8Vcz+gzazKd3FyyQXlN8YVji943Hgj
 gBAA=
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
2.51.0


