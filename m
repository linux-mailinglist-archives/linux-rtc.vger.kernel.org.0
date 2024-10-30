Return-Path: <linux-rtc+bounces-2376-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC99B60E8
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 12:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E661C20326
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2024 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E891E9071;
	Wed, 30 Oct 2024 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="foML93mn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463301E7C3F
	for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730286115; cv=none; b=HqHqJfOPf5DwNzMmZ8CgblDbRI+bcTsr1NV/KdjXH0AMV6IQ3GKn9uD3nWeLZwxj4UqgHLhtZ9SLp4LvzL1AxCk5aYYU0Rfe5TkSzOsoaHKBsDFmykJ5qhESM0sKgG6LU/p0XNB92/7rnQGHSH4Y7ggcBYEu5xytB+Vri8T6mZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730286115; c=relaxed/simple;
	bh=KFwokuMw1FPK/d+QbmXe76gVKRCfIfuQJJ5Szt8cbuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B+WtFviD31b31S7eCQ+F1FB/ayxyXaex/Jsmld0AE/x3chj+46idXnp2ZvT12bUvF5MKe4xz9zmCnaBzaRTmHo3elwSWGh3AhbQ79KeNN3PfonnWvDpsym4B0uElXitfCNclO/96m1bA/8gMXK/K3rQgr5K5bc3THdjzRtmfPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=foML93mn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43152b79d25so58159475e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 30 Oct 2024 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730286110; x=1730890910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=foML93mneT8qrVZ+PgUgcJQrcxR7FRzYhY8fo2T4K0JWklN2z1amHp3EFZVrnHQC/t
         aDhpcHs825p5jQP5NrY3P2oU8OGPQrBA9zwEAo6bKnZdgvttGZ5eTErqFR2/YxPwJgcL
         3LCg3B79SNkqw+wBtcQCoBdUSf2NznvvdKS1vJP4ahROql24M7Z7ugrRMeqLPK62G7rw
         Q2ayJZ59BBTlJy39kSoGzSz2MnoLmYA7Lzzd4KLzEFicZaZcYOpOmjiv+LUlx2/VaSKn
         b7CSxPrjf7XSZGz+D/y4ftAFTipINhgOwpYSWG5XE2ZpU00XQ7bP8c6DBPMv//P3sbn4
         iTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286110; x=1730890910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfEYLhjMDeZH0WbYlTTTFbhTtromhzFBfjXyLFGdvks=;
        b=nOln7hMIIRQCLW32IUXZ4xxzcS8jXsAo3f6IyhfUGnNd8XYBCzhPToK+YZ2kelG/U8
         1XKVvD+kd7O+b7COP8FdmXPKVQiixJdOV2xjtLbG1HSMvgukqMtZQ6GMyaqCRZiQdDuH
         2KBW3+OV2S1bl33B8aesX62iLcEM/5V12y5sO0eptALwZP3CIFeWMdhPpvVCENJaRePm
         +n7ZuETyFS34y9criYt1bxnQlNxTYMDsW8tOsQPy7Xjx1hhFwc+25zt5JYX1SmPsldiB
         /JybMz0TXkhCnOm0CTHAwPacakImcLZDsxiu4qd3naOyXJDzj9m5M2yIIZc3wNwOAug4
         pk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIALAt2tTC46hC5M0uRZXb1jJ5pP3b8TBXrz8Vxh8vMS/an0R8U/LkMNeI2YI1I0ZxEzsxodrDd/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBR7FmKibC6+2HV8ajT4LzeoeJhz5CjMu9gp2aVw9OiXr6yY4b
	CDvMwMXPASwgznbyWvRycYTsSxFk30bPWJKoho898mkRp0LxYcmSnKGLDViRqAU=
X-Google-Smtp-Source: AGHT+IFSBbnTsjzeDFuXW2ohx80Zl9EjjF5HTT3F6o10bua6BUx513xSS7WM3daoN9qpwdEzGQrg/Q==
X-Received: by 2002:a05:600c:3ca3:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-4319ad317e5mr121837365e9.31.1730286110454;
        Wed, 30 Oct 2024 04:01:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd99edebsm17956935e9.45.2024.10.30.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:01:49 -0700 (PDT)
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
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 08/10] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
Date: Wed, 30 Oct 2024 13:01:18 +0200
Message-Id: <20241030110120.332802-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB controller. It provides the clock for RTC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- dropped the status = "okay"; from vbattb_xtal node

Changes in v4:
- added assigned-clocks, assigned-clock-parents properties
- set vbattb_xtal status = "okay"
- collected tags

Changes in v3:
- updated patch description
- dropped vbattclk
- added renesas,vbattb-load-nanofarads on vbattb
- moved vbattb before vbattb_xtal

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 71424e69939e..30bb4f5a7dfd 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -5,6 +5,7 @@
  * Copyright (C) 2023 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
@@ -344,6 +345,17 @@ mux {
 	};
 };
 
+&vbattb {
+	assigned-clocks = <&vbattb VBATTB_MUX>;
+	assigned-clock-parents = <&vbattb VBATTB_XC>;
+	quartz-load-femtofarads = <12500>;
+	status = "okay";
+};
+
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


