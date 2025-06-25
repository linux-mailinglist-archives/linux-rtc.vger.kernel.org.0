Return-Path: <linux-rtc+bounces-4360-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F2AE8A22
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 18:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 567B47AE046
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jun 2025 16:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2332D9EE2;
	Wed, 25 Jun 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WHR8OwaX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2D2D8DBD
	for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 16:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869693; cv=none; b=YWoU69qMeYINeMzHVubbWx9Wmu8cxINAoSk+s+UwjsP+KHGKRQdUE2EBqARN/ddIofdpKG7aE8l/T4EdHVTtsahwy3szwpIRwWOzxSLc3btivNguyyqUBgsUTYSLKvOyHGqEAWt74SWe5XrkugmIGLVALugEf2c5Mu3tQSWV57g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869693; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JacHDAGLbARLkzkLAPk8JFyENN8ECrgQgEv/9owmnumjsiXmsk2eWv+lklr0ArNhj341N6SH6lnlgZlnA7jqN6///jK0SJPZ/iMkI8Q+I36MZ+fPIJDAVj6vPUv99DhskKZgZhm5suxqSckgGvKnWDC+3bXUEJbPO67JO2qZZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WHR8OwaX; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so12998285a.1
        for <linux-rtc@vger.kernel.org>; Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869691; x=1751474491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=WHR8OwaXm4YVA6un6SIKhvgDDanBMuZpv4c9gAeA5bGJHExwrQew5lHj8huA7fAix+
         +XO2tXLUzBwnHIpFj3w3MJii7Jt60iK4pGnUFB2AQ2S9gj2H0NjIpr9y2ommPANt+unU
         IqYxldzezD0mkHT06wgwz5qbaQijEeghbEHkwP0r5gWhklnoA+JWWvY1rH+1EUA1rqtI
         uOXD7W0hAky3Q6/h3VLe7s0JynW16SJgI+z4foSEEvOXrh4fLK7XMA/L14M6ZoQun+bY
         2RX0yUmiEo7ByzJMJOpYFS7aYvUTA0zx40PvuDJcQCVIuCurt35dcnIG6hJJG4DJ4OeJ
         C65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869691; x=1751474491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=d4II1i00Q9wAZf2SXKIMhfMWp0Ay6hJW83sGalInCjNI9mJ00ny5NzmIqtO9rP4XCf
         SU4Iu/hA5EVcCj+D4qFPiCoWqNoOHfK0hYChF6lcOh6ncprzAvIg7ZA/1tVuXhg5fEdH
         Ca6vKKljHm90l2BYxyk/ncyLfvdHaWYUr5LvOK637WyMgai23VEiWFw++V88DHZhakAw
         7+/yiJRNLEJm8OOZCVLvqGCitsTV+B7iVl/x52GdEqcn/V9H65KhccbhFXVJp78B3xZz
         wfHyjnehMgrwxw4q/xY807ryJaeZqy+Wg2faBFsE0eG7c7MwCp1/WX0nMN2k/VherbRI
         i4kg==
X-Forwarded-Encrypted: i=1; AJvYcCXLXwwWN7Jhe6M7JqwhOrCky6Vq57NGHxrbqB8u3AGKagE7paLf92+saOkUGVJZSgLTPbss8CQ72zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLw31A44xFZ9f0oMGu5LIxMkAouxlTmUc8N/JS6sRfGS2gUHY
	Mfy2vOCurAlpHDXDX44hwlyklCSG+Guf4m/gTmY1htZp1AqRiBi7KceLF76MKbAJ5ks=
X-Gm-Gg: ASbGncsoSlkbQnOwwmXtJ6TPYvtcJrLe9LObB8o6xZgwJip/CO1bPApmUG6J4PG0kuu
	ozjhgdShgLBzOn/KpRMrgVpZ7JLSl0khOKUce/LClwm1j0rdJYDsqO9JtugORQxZJA8Jh1kHMV9
	otM1DDuGJ9b87lxZXmv843ezOioPgnclX62KacT7wsVM4R2O4HNDcRL5MTIC5fHGszlthLUR39D
	Ajqf60pHaqHNe8Dk0ABFj31dq09JMHw2xmEsAkJDonhdnWLHijxpoqyuckNWIZftqkxZ0r6X/rm
	knDdB3+WknipMTUfF21/Rj51xGeMz9WJqq6NGNR3ALr6lisAG2Fao4EEZbnUk7y0o9DkrFfUcO/
	WfVXtoIa8pAAid7EGBnuA6ykU/vOjXi2hpp9JZkxSKeO62g==
X-Google-Smtp-Source: AGHT+IH4WBO33AQEU4daDUfdQCrNAmkqlpvMPDGNy9OxOBKPBp4zs4BCFmH0xBJiPH3X1thxaYnaIA==
X-Received: by 2002:a05:620a:40c3:b0:7d0:9a99:1bb1 with SMTP id af79cd13be357-7d43bbdd560mr26509885a.25.1750869690791;
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:30 -0700 (PDT)
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
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Wed, 25 Jun 2025 11:41:16 -0500
Message-ID: <20250625164119.1068842-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
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


