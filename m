Return-Path: <linux-rtc+bounces-4760-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A6B3488B
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 19:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FDD1A8652B
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 17:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928DF3074BD;
	Mon, 25 Aug 2025 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o/CPxvI8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B058B305E29
	for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142475; cv=none; b=IbL+XYUPuoQaPbL7W3b+bWtZqwe3NNP/qUTLcMa26W/9QId0EKAAmkyYWSpbsK12V1QusDHNf5GvO7f/vFgG/U5lSqVL0ptDtFLFfcg/McWmUL66nzCIOAxty7d089IERd5WzeSyUKrLXMXOnu4faO19M7mRXB4IDk0IV0pLHbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142475; c=relaxed/simple;
	bh=tqj+GYK1EDpUdWJT2hsmEmFYHp02iQVqmo4nfSM4fUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=krTnML8r1vKcQ21Hq912j+wW+2xzOV4wIFyBNYs2BJAnYHuHQ6PAKcLuQJEM7pEY7MAKIaVtS2GFAnkKymg9RHnMvP33E7y3o2dNmYMbTrzqEUb8/nPkQeps2T5t4rIunZXQieQg7cXsj5D3zitff28fw1Gz0qV1MGEdNvxBxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o/CPxvI8; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-886ec1ac877so4521839f.0
        for <linux-rtc@vger.kernel.org>; Mon, 25 Aug 2025 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142472; x=1756747272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaImj7HPDviB5XgBqpwJeOy4vyIIfyH+4F3V+wrd8Lk=;
        b=o/CPxvI8uZV1TryKV6Zx3kIuTVYeVy8w2/TybQXcWZXu6lBDOvp8E0OCIr3pZa4dRC
         Q+HYU21parYD92RQoTsYRivMDGuF2x2H8vJ4t3LFZuMgZT9/6hdCm9ROjcAyO0XzlD/S
         b5c8RD0jxr3nHqXB/eK4Gih/e68TXFDj4wHEiXZ4MMNt7VHlLd0M1ysffUixR0q83ZZ/
         ADP9TbCPcTUNLY795D+hM0w/uVJD/zpJ8TLmr2WDNYr0YM0hOOGKiOKbkiMtADrOEHpZ
         Bc5L4AYPlSto8rlhhdI5R3Uc8H/Jm2rnyacOwsVj5gqxdn1zdP+u67VSBhrq2Vtp6w42
         zHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142472; x=1756747272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaImj7HPDviB5XgBqpwJeOy4vyIIfyH+4F3V+wrd8Lk=;
        b=Mx7/F6goCDiWncR2vspeVy199P28Ip+tUqp26SgSs0nZak45XiuIVT9PDxvMaGZAQu
         0Zsp8ZP6F2ktpCKHaRf572mmD4RJJiNfXeSvqypaewmOo/BFjPWEuGb2q9DwUJNMw+Uz
         Q9/DRnOPOT+Gp/BPJGgnW6VeW59EKSK065i4VP3BQVWfVbGZtv6dK974aSTg2CthpEZ1
         zPfw/bD06yMwvwaHCIKi1MZsHd/wfJGfxLoZzcubMF7e54AjRFG4KeYGCukybY4z42CL
         HzcH/DlVAOBM4G/4RZP1NmCSjYdFKmh1DozEUUS5Fac1Lbk/MZV/VjI0iNQLW/2zEEcv
         xShg==
X-Forwarded-Encrypted: i=1; AJvYcCVwEbVH/cuY3LvUhR/hXzBcjihCWgh9UJuHW3GldiwOvtmUUDL/LmX5NqSCMnAOn071kQtUixyNaWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdVYMcLVEc9S/NIy4zondgiu8gOWRGX5QiAtgNZDcZxvgzpmVe
	Jn17EYIHdUzN4NBRtKNOuPFuMcSQKh5w3QVSdS/bDK8AxFLZctjE4lg1+KyFD12LBg0=
X-Gm-Gg: ASbGnctMTlJjih0iR40YHiP81lfEMqa24juwDLb2pwD24rtfnsFTUZBLn14LATH65bk
	g/NxVDWKHJQXdtxIvgBCWwop5hlju6aqBJE/ASaiOBiV5YlK5Ha8OgATEKihmn7RoR3HDgJOIF3
	ww/AF6sTRgEY4VqvDsSzLClKp5FZX3awBDrk8n1a/8ElEbQ3saUUO5LOAzrbO2dx9KtfTGfcTyE
	aUbxHR86caL++Wd6SG7NEGuSvDnwMl6zriq+Nh7LlnABWcJsiHf2LaiASgHUfcDbnTKEYbO4NLj
	jGIl4euV04q4R9rn5GnZp94x0jko9xHNV2V/VzjO7uprLGOkI/3m/YgHg+ruyTyinAjKdAsydyP
	5r+6LworDr/tq61lSUUPEpp96Zz+17Wsmq82xSrOPjc9PbRzIIN8CPRANL3REp0pO7g==
X-Google-Smtp-Source: AGHT+IGMjww54FRdV9usG2bAND6j/10A3PtBf2JERSU5gXA+1FH5dtg3t7ajGlDWVwIXh5UXyCucrg==
X-Received: by 2002:a92:c269:0:b0:3ed:fe91:7306 with SMTP id e9e14a558f8ab-3edfe91737dmr19680085ab.23.1756142471734;
        Mon, 25 Aug 2025 10:21:11 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:11 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Mon, 25 Aug 2025 12:20:54 -0500
Message-ID: <20250825172057.163883-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
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
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 13 +++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..ae9409fe398b2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,18 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..96d7a46d4bf77 100644
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
index 6c68b2e54675e..cd9b91c3358e4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,19 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			interrupts = <19>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.48.1


