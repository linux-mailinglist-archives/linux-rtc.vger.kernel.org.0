Return-Path: <linux-rtc+bounces-4370-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECDDAEA054
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 16:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD911188F32D
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Jun 2025 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD512EA463;
	Thu, 26 Jun 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AI/QEUJc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073832E92CC
	for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947523; cv=none; b=UV2amSYc/bb0H7IzZvFxMQrOnMXMY7srsog9NLreEltYikPYRAa1j5m/vguy3kAnVBp5Cqa1VSqENt/Rjbcm1F20Bh3krDCPjM5lVQY6NfB0KHON9teFLkO/hztC5KXXZbM+CPcdSLB37Rg1nnO19QLPQwqjXi/2prgMg8g/hYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947523; c=relaxed/simple;
	bh=PfwZzjjqJBdpG245rW9fZ43Yt8RFpe6Kf9hR0M/wvXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neo5gpFT+tT/A1HpMDB/UQHQa1huRlPeMCchhtkI0+E2iLNOfFRvlf8h/rOsDC6bug0D88yINUAMCemg4P49f08neUVATEbhYCRidy8yNPRrGkPxSjcBIUSdN9NFXczVlsSnRgICapC5LmyDYapFZ0MOkMn6Fwanxru2InirHoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AI/QEUJc; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a43d2d5569so14118481cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 26 Jun 2025 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947520; x=1751552320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=AI/QEUJcK0DkAmq93csorudXKNtImvZ5rgYUkouKVssbGhpeKdVKLLBH40VG1adE59
         fe0H5D5v0ggM0KQqXON8nRscf3Vh0KyvOUj2ZUDm34iMVDgq3Fz0WWtd5hxcyqWBT+fQ
         cs7EqdVSEu/jZUeJV6mksA+If3k/Y3nE1n6n41bZlaLDP9P/1ljp85sdr6rEXJkBSwtY
         eh03yhTXXCgP7AnvzrjruE1KVJNLuJoCyqSYnQ6SmW8AFmWQvfuW3zGsqngYfJwzLNFr
         0J1zgH8zqdU2nq3r7YWtAV46glZpfSKhghyywWUtTl8+vqItzvNNINsbWnj23fQfsko6
         f0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947520; x=1751552320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=NzbwjcyCSR6jqsLntigDWddScD67242L0iCX46CNxw3tMERH4UGgJnExCoz1qDjzxp
         19NjqM0dewXDV9rc8CiSxBvf2FQtYGTEjFgClPyEnnY8s6py0yD9OJHTCgCVq5dc3LHc
         skluh8Xy96f2E4o68hvtQYGxMM90f+xQ+8V7Xk2i4LCa5V48UXdDuMippYtomDBQuC0v
         AR1IcDpv4Qh464gYBnbY1ErZ3FeCJtcB+iDVwgeSUCvwIm16OEa+K4zImrxL5houF9Dj
         pl0Tj6MqKvOtljqylxMpAdGZ9/biJDdRhKlIGxUMLs3fM1PAmGgYj2GGjEYUqg6HGgNf
         ihIA==
X-Forwarded-Encrypted: i=1; AJvYcCXcVO7bCf3OQL35zliNKueNINboRd9rpoGQYk5JyOXa4xKeQ3Y2tP3MDcPj443VJKEqFdtq4/IMftY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1glzklzlQrQoFcGDsHQZquC+/rHTkupSfzquDucij0Jarvc5K
	d/h99GujEVEJMJDCtOFCZqWYF08Bh72YXXO4JgD+UNxt/m5MV6hxthuz8GoV4XsRg3A=
X-Gm-Gg: ASbGncuKS0whF5qXKCwHXJX8nivi0RlQzdND7NdzgVqcVl2VlXjxEtwDZOdkbNbn/sk
	Rbk2yVjZzuxnnkxVlKfkmSD29/MjNGAJ0DJnZGDPETYerSdold5dDOsLZLeVjhvf9yV/XI4xJV4
	C7+XTMJmqEYYpw5KGIhqduazYN3T6q68c6YOoXg/4/GEY6huxG3CXjae4S4y5AsAqvGCRGwh19e
	8SXHjrXuDAwJxqHUp9wvNk/TEMWs8TkBzcMZz1uugUFoz5a0HtnMSK/o4PCpURFv0qiMwGE31W1
	Rlawesd5zjbZNy/2bN8CqPCFTREdXqkHoAEbidet7bO9nOkAbVtfYgUarvDEw90hTktFY1NqNmX
	twziM3Mm3o3ikKQj2zxSorooX8OvV/e++434=
X-Google-Smtp-Source: AGHT+IEI1vvxdVVtw24k3xjXm86y1FoYzkQAxQf+2Rv/Yd19jGEMG9C5oqEg531N9y5/GIYuWd0Wqg==
X-Received: by 2002:ac8:5ad4:0:b0:4a7:234b:222 with SMTP id d75a77b69052e-4a7f3e88976mr49122961cf.22.1750947519837;
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
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
Subject: [PATCH v5 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 26 Jun 2025 09:18:24 -0500
Message-ID: <20250626141827.1140403-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
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


