Return-Path: <linux-rtc+bounces-1516-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57943932411
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 875E71C21F26
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7656519A298;
	Tue, 16 Jul 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oOdrnT2j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E5199E91
	for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721125853; cv=none; b=fH5nAIEYmycAWYSVr34Uq1/+a0L/GtWjHvA9MUPwmNx7ChcKL7wylmfXBnWQmyn9JTVJvlDLp0G0ztMibZfrP+XJQ+fLvXrf04VtcIe7A+MdvUVr5tqGXn3oL0KdkVoT1lUXIQEPqBBO9RtHGxkS/jQ1xnt0amfhINvqx/N5+HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721125853; c=relaxed/simple;
	bh=kHYvG6Jmfou0a/3H3JPJCy+a3te9zYGMB7WNF7i3CEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DluUJGKqvTIjt7qZ3/H+sVxMWQ+FUvLeMByj6WWPEHtVJrNFBYyzGFfKfadCq0VGJpq8ous7CvLXBskkVcG0Bu+EDK36I6eIG19aaMX1aw9HmzbF/43W9H/CWro7c3MyT+toIpLsycldpZYNiIlr/mrqZYEfV5MEr/TTvvlGoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oOdrnT2j; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eebc76119aso60036511fa.2
        for <linux-rtc@vger.kernel.org>; Tue, 16 Jul 2024 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721125849; x=1721730649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgEFJU9TqEeEi7v4UfFzMf6SUYm8BDlnIzCjSGdepnE=;
        b=oOdrnT2jlbBMpxuKx3C0WXIRN4heqySo5g9u45cJHalGbz/kK0wpmpgg4xzpStvp2n
         omNnvyDO2vgDq5lY1yniqfUOiAd784/GJIc00gk/zaxDmAEVIrIWW0tG5dC7R98Ui45p
         FFy2zXBlWdGKcoZWotI39hVEy3FUwQ4HorhV3tVhvwDqE5ENL6PF3lO/6MNf/Tcif4y0
         Uhz0iBxTnQpThrHwIzwSmdYhMy/DK8EZSSdB1whVlpYutT/pq7OUPBMVIXzjli0eGcef
         zHdHqzvlJC1K5wBu562357GNLliijHt2ikXQ8omDzAY37zdSlFu5U7C/vpN29zZsykXk
         vmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721125849; x=1721730649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgEFJU9TqEeEi7v4UfFzMf6SUYm8BDlnIzCjSGdepnE=;
        b=tB4rIiPyjkKalXSQX+ZYXXNPx+SSaECdrz68iXY2PXR1x2n2m/nK2c1J/PGKGDnz92
         9lgDC2gcMSk8k/IccUQYoBcgJHp4hG26Rms6rwFgGk/6MoZ6hYPEIev8AhyY79Hy+Nl/
         RhADYGVTvFSmyQYL0IfNd1+29aBseKBoqCYDuFLnia2kwzqNNG/38C05J03iOkaXq9n/
         twkF6dqK7fq2s39kEZqT7s0DuSFdvkUH2LSF3CawaZwwmR59sxVXEK2KNz5NNUx2JX0z
         pZilAAuRCioFurVaV8OOZJfY0oiDf5UmtZ+/SYynkiEr2UgylS6KwhVS/6itT0ZKfx2A
         sJaA==
X-Forwarded-Encrypted: i=1; AJvYcCU26QIv8YY/zoDI+z6RA9sUL2vffBgKjOyMBtzuwqXechBT7S0c4BZaEPZTCb0xNFWs/JF9X7OywFov7Q2HZgG6qGW0F2rSWU5R
X-Gm-Message-State: AOJu0YxIHgR9pb4kqWnXszPn+0je2h59H/jodKhDY7S7TZoNnZ4AkPgx
	qZJmDtXnNoVxxWfOOY4KHaTQdPHHup/jT8T3Va3Ix9/kc3cDfenBZzq3mAORdsE=
X-Google-Smtp-Source: AGHT+IE4UrP8ocZy8DYCRi6ljSVc7gUaTDEwV0MlfP0Wt1LcKXTzKRIXgiUNL8wbFViSdsnBD2NBxA==
X-Received: by 2002:a2e:9ed9:0:b0:2ec:5699:5e6 with SMTP id 38308e7fff4ca-2eef4190aedmr11234431fa.26.1721125848934;
        Tue, 16 Jul 2024 03:30:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e77488sm121546145e9.9.2024.07.16.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:30:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/11] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB clock
Date: Tue, 16 Jul 2024 13:30:22 +0300
Message-Id: <20240716103025.1198495-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240716103025.1198495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the VBATTB clock controller.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..517ce275916a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -341,6 +341,19 @@ mux {
 	};
 };
 
+&vbattb_xtal {
+	clock-frequency = <32768>;
+};
+
+&vbattb {
+	status = "okay";
+};
+
+&vbattclk {
+	renesas,vbattb-load-nanofarads = <12500>;
+	status = "okay";
+};
+
 &wdt0 {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.39.2


