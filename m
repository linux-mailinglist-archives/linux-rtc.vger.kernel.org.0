Return-Path: <linux-rtc+bounces-4681-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B2BB23E61
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 04:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2C066270BA
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Aug 2025 02:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFE620D517;
	Wed, 13 Aug 2025 02:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IXtbbbnv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FFE202C58
	for <linux-rtc@vger.kernel.org>; Wed, 13 Aug 2025 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755053125; cv=none; b=IbPMN3r7HKfv5o1qtJL8C7fvwopX2zQ4B80Zu/iKz45I3+6dTP1GlJ/PV8emQShqg4lX7miKZsdpQWElz3LMo2gQwAJDNQAPe3RBggvq8aIJg6F6dd00dIgN+mPrNDRTGI6Ai3Yuk1R8MJRPNcf3mlt6yEx3vuSeSR7sa7N1Ank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755053125; c=relaxed/simple;
	bh=ooFOOV2isYxwgZ2SmK13jgjsTx8sBuH2wENU5XY8MgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPtzb8iV+FjL5Wt9iI64jSjM/e8YMYZGykx4SDn5adIRCv4X9SKVw6MypGoM5VB47KiLgTW8buE4YV9Qzak14pl/iU2QhLCHOaAYHVCTCD6XkdgkATEtqrLBa+388g3/WWzGAVjmrWMbazESvueqmellzFNNMT91OabQOyoYh64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=IXtbbbnv; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e5328231e6so18380485ab.0
        for <linux-rtc@vger.kernel.org>; Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053123; x=1755657923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=IXtbbbnvveJf1MZUCiB+41pGDx1lnkcx8N6SbOGJNl+xw4zoKizkUB1bG0r2+6QREA
         ESsgVd2lFPse45nQLHbEuVRLxPVtExph//lDjdCWfIcC8L8kNNlTstw89pVLXBRxlczw
         UBLunpjrliCirFI9vjDml52HakFP8QNGv/AuMITgfkX41/MtSJAeYGVAxzeXUx96xY9V
         5ZrCeGjqEkfsFtdVigOZp8aWKH5+vkiGsxCLJ5HjeZE9GaZzei3SA6l+3fgxbZHou9X4
         cB8dNrQFEOCE3QxFiQHFe01IZxb+pX6XiH+QNjJZZRDpu42kx0JNhmbgkxIUo+VGMyp0
         AORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053123; x=1755657923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=WQAlRwmxiHFzYajBgRulwBL+5+KINt3HWW+6u5sm4yy7OWhV7Ru30b5RtKU2Zt5FKJ
         lFKYkxTBhPT1QgiDJzihTjddGn9KDjBWK7zCbvCKhqKRy6P1kEbaVvI5u3T4c+Nb3MnR
         WgEK6qBbesgOkl7H60Ek9bVcy37iKboK6nnR7rhyDD5Gu6Y1fn6dIrxfKVxv0uastHZ9
         1mWAO5u6jHO8YJp5sENrAMJzEg/c3W+vCry/Z0t5LacHxKc1xnneoVKcRmDnjge1OOuq
         d/Z6o5KgrZcTicZbcwM2nHVhL08WmkDijmoBBGWu3jTUidIh6fni/h/TrUrLQFfEQx1+
         oSIA==
X-Forwarded-Encrypted: i=1; AJvYcCUUGkWjVV/XfMHACek11Cy63eX2SStEaigt1u57V8wTjtys6cZ2QVzLsU/HGpegXV48uYxUi6jsRPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYzkYc4szZYoo3UOs/BtoGVcMBbId92OQwkfAGU/6mFOnYciA
	q8cr/B6bcpXPkRI+zCdIj/WANA4kAYtdj1Q+OXac+VJAr+Mutgi4J2p1Fb0aeXw2FAo=
X-Gm-Gg: ASbGncu4asw2CRKGJqz2Jnc0w400LgPwwxL3o+PxykvOOfQmhAq3BUehoMMbRLKKjQh
	Y0xmyfUJB0k7PWYYN2nZK6+5WRRKdMM6BnYvTs3D4Asuj2FYWdDFclge7YRUS0dkcORbYgKVoa1
	AyVA3j9uclPSpCqUttSigO4PthgmWrE4Tf6MOXvOXxqs8TgrHXg+Bi4/K0yGOT7FNrF6Xzo+yho
	t3E0FNqYVt9FlqczvqQvW9KyAC9rXnRpc5Tn4Arh9KwunATvEEjkwu6RlvlD98pcgqScGusOxpN
	GAc74w9GK0weuA+BrkxnWtfrrGMyoe9u/0a4l6f8mmmULXu6mXLsDBfX9Ve7QEbcM25MoRquD2I
	558sGfP0buhB2OF0mshaDgm1qJxjqhQNFcdf9esk8/tmHnbMes2hqCdIDOu0g7TJKTA==
X-Google-Smtp-Source: AGHT+IHNbGkypv04NReHT7LS3KpLc44/pbzlP8yxnO8gc+9CBy6bawzkc+ztCNL8hpgqnMvaPSvV6A==
X-Received: by 2002:a05:6e02:154d:b0:3e5:5357:6df3 with SMTP id e9e14a558f8ab-3e56738b0e7mr29089105ab.8.1755053123016;
        Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:22 -0700 (PDT)
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
Subject: [PATCH v12 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Tue, 12 Aug 2025 21:45:06 -0500
Message-ID: <20250813024509.2325988-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
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


