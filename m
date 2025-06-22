Return-Path: <linux-rtc+bounces-4331-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B65AE2E32
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 05:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90E261749B9
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Jun 2025 03:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767391684AC;
	Sun, 22 Jun 2025 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NJnFV0by"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101D154425
	for <linux-rtc@vger.kernel.org>; Sun, 22 Jun 2025 03:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562995; cv=none; b=Bk0sCFOf2xm9Y5DCwGkseckt/NW/Vvfu5CsHQOk5esnFCrpkvxDTcPRg14wZsp9p/kDI2tynn2I4LiuKABKQgq4rWMLwmFmK6X0MmGIsuNJz54zI2Kja3J5/8DGaHn/HyyEk51Dl5VmIYBuSOjYD+pdz4fu8I87pxiojuZn/3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562995; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auF/1JfAEBCo1rMhVWJn4cmIozOvuLXKsg4CjbS5huIT3l9i+gMLXe4/WKYghPurAJ+ACOMM/7+NxMpXGdqF7XffAceu+8ppdyqOJnyWlcizP6jnh9qscSohhwVg/U3RzM8T2iyH4BlHWg9VeHh4qG4YWysYxJXfIXKkX33d/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NJnFV0by; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0ad74483fso31608176d6.1
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562993; x=1751167793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=NJnFV0byZG+1ffKp537cPX/zh1Wf6nnjoCXa0t3T/mxjgUcbwDhtXTieWZWo4F4SDI
         7XiRhqpOXXDyFYcDtaZn8gvzJakj8Rqe0QxL4zQZdFCDzWYasRhhKxpyNvxaT+tMR0U5
         H868+X+UmRMJIJITPL3RjQDSwTHEIDhG4AEbJxUglDFhE6JX/jVCq/FWSIQDgtskPHQk
         vyHWMFQSviKXmHc3vfboLveeTJ6y5RVK9ffAgRicw+iY7DFvwLXZ+09PMFKf5IQXW7xs
         VpbCctkrhZeKgQbA5zDSElFk7ezZa5qYpo0Xufa5RoxpNJx241wWWftqa4ccsv6xUDTp
         mwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562993; x=1751167793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=r3vBPtfFXo8WzJ1nKnlGvgF9feLQ/TBWxCYPBfPClVNhUPS3AJ3VbWJenHraxGnPta
         k4SpluRvZcAQKTeUKwEozgWNHSszw9YZfG4PS8BL0dOf8uz9hCgwB08MphMuOsSMZGPn
         bACDwIt1qaNDfgkuqn9mwf6u2V0iqNvZfPcJo6FCohAcQ9nPT6ffOTiSoIQhiKH5R0ME
         FcM/OSWJg4Xyw3oN9HCToju0KgVuhmeUuQe6+nHR95FI/oee/wUM+Yv0XZnV5x3jubSj
         D9ybrzzzEkYARXXz2cve9SkdmiKzy2uYPo0pkO0er24evX2hMPpKfOWRZVA9zF91iRsM
         yXjA==
X-Forwarded-Encrypted: i=1; AJvYcCU+WdfxX3PTcjfNwIXIG8YhdSpB8xl2zmwSCdKDiQy0QR0hIIUendeFNIpiJoQpmwqcUsxy2SpqXmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbfTSjnBZWBhf7e3OcU2sfHloDYAdSb6cS8qn53LNb96U29Qtr
	ck/mYsDR+rf4t6hHpzLCUOfuZlfbEi5wb9wrRMhscwuQotetkSq7uM63q8BkncXancc=
X-Gm-Gg: ASbGncseMODDDUAgQycn//23c4jbE8S4dZsAtFjusCb8DE1lpJTSy0kzWlED0WDC5ru
	La0UuoAiatj6BVC4hQ0xdS6RbF1RyE7naoDnQorZiLt9axlZWufNvLui9ObBRkr+CwN8HW8SAma
	pCAy13xwuCYhs56axM+jVdtVFldMPBj5TAZnrNIS+n+j8hfmqjG0Z0aNZGi+uIJIhwP6CHSjTBE
	ZDxMZRVTy+PCWTLO/lAauDcupmY0SB9d8ByOZbdVH11nBipInuX+nZ8m5KNZRT82pR803rlK9QY
	G52MrecPPCyBrl6wo99y3jZAVjP/LMpRye+DvE0UzpFbH4Diirk9/8BIb1Mo9hZHe1vYwU8FmEi
	GIizCNaD5saQm72XjHXhnUjpIbpW4X8oCUriVJv/49lCPUw==
X-Google-Smtp-Source: AGHT+IEZ9RQ3qooYvQegxhYJwv4FcXekxCuxqEkQ4IfzYRI0IXuLRFYbafB1Ip22u1/MKqba1/A0aQ==
X-Received: by 2002:a05:6214:5413:b0:6fb:4c6d:d4d9 with SMTP id 6a1803df08f44-6fd0a46841emr132548106d6.13.1750562992722;
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 21 Jun 2025 22:29:37 -0500
Message-ID: <20250622032941.3768912-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
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


