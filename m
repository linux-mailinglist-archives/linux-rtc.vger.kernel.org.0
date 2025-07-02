Return-Path: <linux-rtc+bounces-4419-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF36AF6435
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 23:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2EC64E3169
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jul 2025 21:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6712BE630;
	Wed,  2 Jul 2025 21:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v9+Ypaw9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427B2278E7E
	for <linux-rtc@vger.kernel.org>; Wed,  2 Jul 2025 21:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492237; cv=none; b=Wey6oFf8t3r6DOF5gbeUH0e8AI1WgHW5xuxF2fsk5X+lTn5oQ5tugY8u9mQ4KUgGwvXQUiplFlKSBdU3Ljm3Ed/NpsyJk1wxMVpOucqkSklHPo55AnIDUK/fEEVLJydhFZHn7uVHy2XxOoxqQnq1XY1HYEFfTje0dVA0MK1lOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492237; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7cOCCFvDuOc3aRcmPRh31Q5TJFrMaMMYwXj7QBLGSzjklB/RR3ZmWkCX9bzO2tXUU2srcIYUrWP3lsSZkBNCQM6C1U4JMNI9K/g2ijJvSwOolxkXeBdOVrasLj89rrt91x7z2FX+OX8bhjXguaW4cbhmHo91zoKfSNvmyEQBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=v9+Ypaw9; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fad4e6d949so34627766d6.0
        for <linux-rtc@vger.kernel.org>; Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492233; x=1752097033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=v9+Ypaw9mMGk4nIM6Nv3+BpHuaH2qsLJK+R47iw5xF0QNkvlchrBpMqyGBVanxu0YA
         kXFktlQj6IwwP95VB096KOraeWA1qXQrq3z18Dwae90wcnp09ib83B5i8j9kTLnY1cQS
         mW/gVMvLKHTaX/7YAJ+oqwUfOsA0RbHvAvOkbWanXpJDg7yQRsfYyxLKH3CYaxnVJWNK
         lBOmCvR3vEBJG3SR3fpQzvdplu/gPaB4byk8zxOnFHKTkzvLu7vfjFw4mjJ7nAdZSjYm
         Zk8kEWZMRFKCC+9bc7qbrsaNCMHo8Gs+pXkbTgO0uFRGNzy5TNp6alTEmiZt1p0iLXzi
         Nauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492233; x=1752097033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=qYzp+kW01mrxe0HAnR72EFkNq1WBCE6lJLY/JWvHECsWFTpuWNH1EO8hVEp9YJVukW
         b3vIXiFww/AOS9aIx4W/9yyG0u9HXmnbMfOKyDHrJFEkU0f8f7W9EUKmwsTqqVs39Oyu
         XvyJdeoq37fr41/yz0b07B6Ftt6vErrFJRyBhOjp7Q0dHsfPKMEpPzu2jNkeQETi90Gz
         yk6oZt3RfSyTIHSKusAhiYnul5M5Ox337j7ZMYAZnuK0ajvgDZCDJjtm+6RAs2q8fg4q
         uEKyq0l1uqDMtfMdN0ewOsqyQaMHTRCnIlcgNI+u+PHsyIZ3OllnE6lXDq8uB5dATIxD
         hANg==
X-Forwarded-Encrypted: i=1; AJvYcCVOwwwCuD+8HRaksZq2bcTVlb/ibhlB60CMvlR9LEUnWfNZSaiKKMvTlFLm0NoS1HKz4xl/doKqgIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrtWAebPIgKj7tDwXPOTCnJ53nUyUxGU+DL24hSyKyZ7kNO+vJ
	KflAhheLtvaUeQj+n14xmdEj+ejRqrBoP0aX7yZR8yOKhUA5Y0VlVd+jUYVII/rDHjI=
X-Gm-Gg: ASbGnctLdaZZYWrAjt5uvLUazeaactw4qrh2IL2mMnFxnXx0VO/sfY+uNKHn1CURNJI
	RLLsH1m0v2HDjnwKgiSNPAiWkoLQ85ESFPNrQEcZfIJevNpHet+3HFqKuDt/edRdR/xHJLJQgOw
	sbBISPfpmf/G3RzyxT/XnyNGunS9tzX9J3OgPKWFDBBJM2sJ+C4D1YgCNqkjxMeIS7U9IJ8ZAQm
	hPASjsXBm4L+zUBoi51EQSWQb1kSwivq84oYqX3CqS3D0xX81B1hAvr185Jr02Eg28UKuhRmhWp
	H33W/kNp4nar5pBiCehZzo8lVC0KG8A5CNezbPBYMJ/g3DGDuMyWYzDnukiD+FXhavh9tVmzJ/o
	CC6FDHexfBd1ooFn1O3l6eqZkFpM5E6rPG1Y=
X-Google-Smtp-Source: AGHT+IEga/TTtKtehHBWPm0Nxknr/ZXL6aD2Mo+XTk+ksBSlzPaf8YwrBU7H07nYGA5bKsy1lKh2ew==
X-Received: by 2002:ad4:596d:0:b0:6fb:6732:a2c6 with SMTP id 6a1803df08f44-702b17d9115mr52706366d6.12.1751492233254;
        Wed, 02 Jul 2025 14:37:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Wed,  2 Jul 2025 16:36:55 -0500
Message-ID: <20250702213658.545163-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 14097f1f6f447..a85239e8e430b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2


