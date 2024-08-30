Return-Path: <linux-rtc+bounces-1804-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA696625B
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4BC2878E0
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E3FC1B2538;
	Fri, 30 Aug 2024 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DRekLhrv"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43851B2511
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022971; cv=none; b=Nf7EeJF84O+V9CNPcr38PhIL2tlhy71UxtPCegkjZxGgUYUpags9f0luQGPLpTSNoIhWHge/QU3Djiq4jB9rylm9DVlcEbpeU3COXd3T4hYjEPOVRuEUQ5Vq3OMCxqlV4AQr89MqgfyXuZkGe56XC17jKYfbjHBGOKel2fnq9Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022971; c=relaxed/simple;
	bh=SOGK7YXZYXutzKsB4rqBEXBmAsm7IDgcVUg5Tr6j8dw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qjyWK2xV+BI65fiCx3JbrmN7qiN5Db4P9FrsKe+CjmSKwIG5/yWXf/Wzfe1YJbW/+YOIeuUnZs8i2o8M8k2ox2Pq9pc0hIwe1v7kseh4+/Gkw2dCbdMs/4ivFV/UWaUqGuzB+N5Rf++qfA0fiOKTpMhVug6w5vp3/1kLRVu6/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DRekLhrv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso20039545e9.3
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022967; x=1725627767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkRwte9q+8AOt+nLdxE1AfujOX2Kar+XMD+HzKexS/o=;
        b=DRekLhrvNR22sORM1LeuRJ4p+LqPx+oKKOhb/DEhpiiLaMQnPIEZcTmuaDu3lGGobY
         tA7OrP2P3zx2j/XMu32oIVT000RrGPkOWvonvn/fvVhk7d/h2/CBVsMqPU0eSMUi6nQ3
         EHRTNKuTXQ5fud/pPzn6dzZg8K/NI3+FV+qNS5D9Lze6cSdaq4r/y5xBQF9XzYpe4DZz
         A+zItSmkt+NLz4YtVb5SE50rFgjZyae3yuaTIzC191agS53UaaFdRtPdRgxyUpE8Bhzp
         1WTJ9XarU9nTW1k1bk8dZ5WYssdDMiMLStXR0Z5jjhPXtZ8LE9nXRSHbH7fsfG6G1mKt
         mxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022967; x=1725627767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkRwte9q+8AOt+nLdxE1AfujOX2Kar+XMD+HzKexS/o=;
        b=tyLKU2QqbaA2jY5wsbSWlFTWd/igkGVPSoEgjb1ZJCXTI2H5ljllkYdv8jcmF7M0Qt
         JD+TyyeS9tWxhrgYwI9/KQXsWYf2njhCbsk7vUy2mZ2/7r/sHcA4Hhr+ao4ERSpOTiM1
         yoo5GAU6Bd5lKmf5WCZo5S1KyoJnlUHs8hJnJaVSVvAXmybWdssWy8VF7g1gKKTJN5Yz
         qoBjNht6HgTE1QzSWp9lRZXAbZLwMxiZdi8ANHbhdMOOXCK11GogYPBCqc0ahn1G98ec
         CQ3NK0tBtQV3AVW2hP/UAFgEIHWAjHnNMCDkosuUAA4nTw9l66VpYmjjoOsXsJo3mUg3
         GX9A==
X-Forwarded-Encrypted: i=1; AJvYcCWhyt0URrJjzEPzPIjx3SVjqZmsaqBSzfSZTetA4whMYy7ikF92M058PZaP3ukYqzoPomrXwVK/YAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoSWz9EnKRqdbg58pBO3gjfV/6HTnC9WXIa+RlwuM5n44uqJg
	xZn+bHTR9tx7dVWRyWHUPccrUM2GzcwE4TH1fC7kDuJnH7ywTjIRZyl4RficOkI=
X-Google-Smtp-Source: AGHT+IGU92UJsrTL2eS34wvxlFxInUfaWmAHimLJ8uHD9As/Je5eM6xtpedH3VaOd1rgq+IJrO4c2w==
X-Received: by 2002:a05:600c:3b10:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-42bb01ae1fbmr61952375e9.4.1725022966892;
        Fri, 30 Aug 2024 06:02:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
Date: Fri, 30 Aug 2024 16:02:14 +0300
Message-Id: <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- added CPG clock, power domain, reset
- and assigned-clocks, assigned-clock-parents to configure the
  VBATTCLK
- included dt-bindings/clock/r9a08g045-vbattb.h

Changes in v2:
- updated compatibles

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 247fa80a4f53..ac9b6733d289 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/r9a08g045-cpg.h>
+#include <dt-bindings/clock/r9a08g045-vbattb.h>
 
 / {
 	compatible = "renesas,r9a08g045";
@@ -160,6 +161,22 @@ i2c3: i2c@10090c00 {
 			status = "disabled";
 		};
 
+		rtc: rtc@1004ec00 {
+			compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
+			reg = <0 0x1004ec00 0 0x400>;
+			interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "period", "carry";
+			clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
+			clock-names = "bus", "counter";
+			assigned-clocks = <&vbattb VBATTB_MUX>;
+			assigned-clock-parents = <&vbattb VBATTB_XC>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_VBAT_BRESETN>;
+			status = "disabled";
+		};
+
 		vbattb: vbattb@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
-- 
2.39.2


