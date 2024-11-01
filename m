Return-Path: <linux-rtc+bounces-2432-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4319B8E76
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 11:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD5E1C20EEC
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC71A0AFB;
	Fri,  1 Nov 2024 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rCrJOyjE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E41A0708
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455082; cv=none; b=gJdGwIxm50kR+1dibIcBWy8T6Zl6ktXYfrFDy+TmhbZt1iqjQ5xv+KeiiqAO6V0Qct/cbtdLv9LskoRsdBUB4/2gFXzo3fqD3xiK9HE+nkJps1WmBJHV93WZr83nZWDfADRrO6Uj+dW80/Bvw5MhkZJYKxTTyjIReb9lb0unOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455082; c=relaxed/simple;
	bh=5q3sZ67C/C9aXpvq5Ph2rdpLI36199ziQrN6XfaKdN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AvSyBiV0JfI2P4QCYoe1n34h5Myk5aTBDEAdY0FErFe1S8L+VEJIMYwqqzzZJRnvvLH2+fpEUgyTF60yUTWSOdlOxdztqVP2/+SOtd7S54mYKOZtnByFTEMf25E+554AxoaY+5eR246omoLx6WHQi7T/99WepAX8lDJv6jVRV2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rCrJOyjE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso2251778a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455079; x=1731059879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDVeB7Y+VIp/FplukcEJ+LJ4Vz9niC4RyWfPRl3XIfk=;
        b=rCrJOyjEbqtAfGFSmF9fitisxGo6N/aRbGgwTYNNlDFTUVgrFwiO+alJUk5H/vdHTT
         ADRy0YSjkVKM5qnrf4cULKAzriMFJlEiPQ7i5oulnl7meAjB0/Astm4gms3dMMi9dQnE
         ygqQ+HDq/YfLeSgj7sfW5TbOAUMhoGiPurgD2px1kMBInsyFE7qkoQs/yNCNiO/FVdpK
         8K+bwlrA/I9xyeany5P9TJSqC0OyyrqOoCU6uq9ipyX8ex+O0o4/LrSxfMMlxA51SBxp
         ZtOzksRmPQZLtLEEqhXsdKAbBtszq/9ju79/9Aw7IAIivTyzv2XAD3JPM90NVLl/dZvc
         OQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455079; x=1731059879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDVeB7Y+VIp/FplukcEJ+LJ4Vz9niC4RyWfPRl3XIfk=;
        b=YzaqR6K6BOZ6XIjaE8WKq/yxHYC1BRfTMyMllxElWistCZo/ZnWFgaBQ46omTMf5kB
         ZYC3tFtcNMo0A0e6yVIPcgex+6610Yb9hA0YAzMxGrU8pTXo9KUieAm9MTFnr9SrYs/X
         qxTpTxCSUBMIFKc+cEgTuWGcJr41HTLB9+zs87zscRXnjUVzP7Z4mb2HD9tCvx7uoylZ
         6fI6dzOL+cDoOUaKVLa20M8LZND2txayN2Dvqla8v8Xx2kMvbxcpdj9dz1kJLwHJUJNc
         7MCUvcDWfjhIolayAY/icSUfZhuMtunpCiinGWsKA2VhdQKyxv0SYmYfUqsCvDhIZoy/
         3eAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWFxDiassOKJ8vQgwM9AUewcBEH9G3cJVk2rmJDo+gVqty1Dt0n7NiZBamStrg3jo8pJoxNZOxXuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhO+BXIDevx+X2qBGjUlBm1ymuzOYiDmMsmPjQGHgZ53AW/LCk
	VffACvzfji6sHwDZPENItTMOR3aqPZOXRVE+eqeUe0ej+J26MV+/cIiq0+lHt/c=
X-Google-Smtp-Source: AGHT+IFm5mOqj3B/Gyi2brvekA2DF+HNO4SlxfDE0BQcyiDTfbNWcuu/umQTldMEOxZlW5iJz8fSBQ==
X-Received: by 2002:a05:6402:3585:b0:5ce:bb37:c2e1 with SMTP id 4fb4d7f45d1cf-5cebb37c36emr1662850a12.19.1730455078849;
        Fri, 01 Nov 2024 02:57:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:57 -0700 (PDT)
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
Subject: [PATCH v6 9/9] arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags
Date: Fri,  1 Nov 2024 11:57:20 +0200
Message-Id: <20241101095720.2247815-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the Renesas VBATTB clock and RTCA-3 RTC drivers. These are
available on the Renesas RZ/G3S SoC. VBATTB is the clock provider for
the RTC counter.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- enabled as modules
- Geert: I kept your tag, let me know if you consider otherwise

Changes in v5:
- none

Changes in v4:
- squashed w/ patch "arm64: defconfig: Enable Renesas RTCA-3 flag" from v3
- updated patch description
- collected tags

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 0fad83642034..c62831e61586 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1222,6 +1222,7 @@ CONFIG_RTC_DRV_IMX_SC=m
 CONFIG_RTC_DRV_MT6397=m
 CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
+CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_DMADEVICES=y
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
@@ -1371,6 +1372,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


