Return-Path: <linux-rtc+bounces-4595-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8910B12AA4
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 15:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 496CB1C26205
	for <lists+linux-rtc@lfdr.de>; Sat, 26 Jul 2025 13:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8E72505AA;
	Sat, 26 Jul 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ha83cEQM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CF24DCF7
	for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753535423; cv=none; b=l148XcEmKHeTwz6j3vx2qz6p2FjGdwqbFhrf3EHgVBRdFoG0qRjM3fPTKD4yaKJsK/w9T08ZJXhBKOxE6Wnaaq5TlzekHQafBPjUQtHrTL5U64tWr+g3f5+qjbSWRqPqK+XzEVdmeaCXSvA2DwJg7NhmnoQX8A0gHipv/SRVb08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753535423; c=relaxed/simple;
	bh=QGEqlYXIwxO55BW2Qob9nSxq1Am14CofBss2UkP4kt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLcy9f0iJ3wu1Y94SszNouGtLfGp5RA7bBAtoXNyzgVMba/mb3XMj2xebEs5bZ0TpYxcvA8tcFLDFgMTtygqXhEA8mKyPKcz8uc27vrIh6BSv5TerF5LzzGdQ2ryI5bWP0qqcKPTi2aRY9j25NnOFwwHwkq0/YA/RqiotJpOxaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ha83cEQM; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-87c46159b24so110267439f.0
        for <linux-rtc@vger.kernel.org>; Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535420; x=1754140220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=ha83cEQMyAac6y9RdUpuNluiqdFTtq6vqW8WN0rUikBbLmVlvFPixN2VFCR+zEu7dw
         El/GzfRbowVdEGSlGKpvqYrGedqm5p+2SK1uzLHCeFmMZ701aZxcvVVlZGhLHYpd4afD
         MpkWeYzbuxBGwr2uCigmS1XrSZ6AOrk7NOM+PQKGFS0uUIKMZhZT+I11cBTpOnPAc8iI
         Ct/h18HzGkHBdEnsHQthq04cRQS+jXELPNTFSCMOsIHTEweES/mSSjwtAs/DNQ4ekGWH
         VEea/xI6ih7XF/zCsE3rQ7mBU8i5xaFijZd6HEgSWUsyH3l/0HlY/BuCWUy6S5H0og3g
         tQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535420; x=1754140220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=gydAmOPJfaMWnZkE/ZJAA+oHMzRQw2qIS5nVer1t2owcHgtT5NXkly/lT1pt6Kq9/o
         YvvCKufAjv3TeHJUmnREPMqwET8mvo/p9SbSXiOLUGrjNzYgJxhPqe3FzExkPbE6C5N7
         BfnBw6fRFixQbf0hRDMGXjg/1J0Dr3TVkQREbuEYxk3Yb3F6PEgZNc8wSiCUV1PeTuQ1
         MOyN+m3JwinXuPa6K5SHLeoBbXQ8ixhzLd7VJMmS8SUkZNQ2RPjk6NcO8C4q2WDrc9rf
         cyaOrZYHK/jQyun8T9WmmEW+7UPvq4oxhCV4tL+i25Oor1KMyA3G2qwVeTmFlJFQ8w+v
         Xl9w==
X-Forwarded-Encrypted: i=1; AJvYcCXeLQlHfTvhKBNeumNQFSqE4jXzqHty33sxdbS90oxyR+z1cxKA50umwqWM/5h3CdfZ4QExUKfnDKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwriIx8AgQFGGH4nCoBbhw/XxV5imDHbX/IIhmxjNw7wY9k0R7E
	ZP9Y4uk5b1jv40xcNRNEa7p10c8sw+LqNP0xymqpd4ZYvM7wRkDd5Qy1Z0glr4is62s=
X-Gm-Gg: ASbGncsQahYSPuxvi/viocXPd3frKHvfAMTsSpKO1QbSd8jhHQPYZeJIzpvNWdCvIBj
	w5sodvNMlxLUcPKladmkQfAcv+oBv8s2UvPAytxNl0Gl9Mfh9fnaU7Xp2cYpFq7MeUvvCpfhpmB
	TXAiAWEwoxXBbLg5EsI8m2VaXliUXoIx/8PaURoQ4v93cP1OHhEPLtgqfV6TGkCFOLQZDpgv4cM
	opE67agi4SO2Uc10AoYNOGCEcGaNxx+LmmiJLqbzu8feeV3P3pGPmhuTjKFvnfAaZQxOX48ntEY
	isOrkxtvUpmlOugFe1bJAT3W78EsHqVZfXNr2j8Uw0iYubPPPHotPdsKGtkJYqkQ01F9GIybac3
	4G58TyNNR5ZapRJ/8pABS3/HyIc5OO8sPayArlk4yywCcWf9XAFM4JOXZLibQkxSkSA==
X-Google-Smtp-Source: AGHT+IFowWZBk8AVURVAXWPSaWfOPiE/GFgKH2Cki+djIREns99xE2XqEQbxbnTzUozYyQveuIR00w==
X-Received: by 2002:a05:6602:2dd0:b0:86d:60:702f with SMTP id ca18e2360f4ac-87fff9442fcmr893288639f.0.1753535420282;
        Sat, 26 Jul 2025 06:10:20 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:19 -0700 (PDT)
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
Subject: [PATCH v10 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 26 Jul 2025 08:10:00 -0500
Message-ID: <20250726131003.3137282-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
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
v10: - Move a few things around as suggested by Yixun Lan

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
index abde8bb07c95c..580f77b5e838a 100644
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


