Return-Path: <linux-rtc+bounces-1809-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF646966273
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 793161F26BCE
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3A91B3F2D;
	Fri, 30 Aug 2024 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R+8PrTxo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF81B3B1C
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022977; cv=none; b=R0JJQbbMD6q/JpMTX5pgTBM745ByZJg3uoy3nMCUASf3J2fJQugEamTiiLpleGlbyV+UL0ZTp5Xeh8Djft+TL3QrGQavjh8EJLUQQQWrtUTP26LGS8+kBdpjO9LNfK1E0p+BVIfQ/PGw2V+hUI7Skoz8hvdOEop8xUXdhUCIjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022977; c=relaxed/simple;
	bh=4rakxW1AIrAXx9O4olZXDDGIfXC1bAD+bHy3Dwf6b5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UK8Nch+SBMfnc6xmiwgsW7Bsmw9COSZpS0RmiUWSMgVOhDGtJ1kZfJEoOAqugaKwGBb8xcyUby0Cl3X6SNkciPZEFDr/nErQ/hLK4S/QsHuhsh2zLBS3yCsX1CAkjQ2vRyCeCrxKYVwtCBhWP/o8incVMQsYOdmXdhUyRsDcTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R+8PrTxo; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f50966c448so20120561fa.2
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022974; x=1725627774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOW1zVumwbW/kuzMezq4g272/iEPuAs621hgPixLK3c=;
        b=R+8PrTxo3q/7ZrFuopV+IzgTjvPElsN49WYOikkrok71GIf9wUGDqBfD6APdkSdCPh
         dTeyTnvCv92HJg2CPdpnsIijeSCr0fJVMfBkwHVlgX3t2Xb2NfKCvZ2XeROTniPTsru5
         eux6OmszCoE6Ebl7AW4FIMZDY2jjzJQeyLdhSCfcN7am+mpJxGlPtGXyopbPktlv7/er
         HeYeeff7A7pVTFyvYe4crnSKYEkox/gHIuDeh1fV8NgKj4NWNij/Ov6cGJIucPG50Ng2
         z6fWhQ365FNSPcKVIf3sUXe2cn/047tVc1iP4YVqq6UvEuEuXRIoZ85nQTAuY9Fw3eC/
         3goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022974; x=1725627774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOW1zVumwbW/kuzMezq4g272/iEPuAs621hgPixLK3c=;
        b=DvXe6kAo5vkaQ515xI45TibJrvuf8Op2ceD9bSBJgTs7O4IlyB8rw2Mcrb6nfJgblU
         7Bmbbr+lYyWZHiAyQP91kcfwkUgC9nnJkb8FBp1Jep60ScEBMPtXc/lY+5dcMAhALyPF
         rLeeyDC2ku62D7h93btco0khkqTO+W4XMIFULExS8h7UYuuDOcGY4bxuFVucP+PEofe3
         +Sj13g0bRSRlm5nQGgAVOT1GexPkP7p6J+7yNNJG5BK3NGFAhj189zxbjJRZqe8f9y+F
         fdfk8ZNj/0ug+DEK8R7Xkm1AylmpUXLGnHmCS7Gl+M5aGHVQ+veCl7tSL7GEIYwxOdpS
         yjLA==
X-Forwarded-Encrypted: i=1; AJvYcCV8pJgbkJ3AHFHhu8rnTBLZl4ZFQkwgbszp7O2cOr2yX12b0s95+bm5USN/JIb7qc3sz6ShqklNhcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8w0r6ox0HCBgMAFQKWpA92n4JNxwRah7xqadONWoV61p1USYt
	0cVHbYWADK+M5J/Qy1yYWrDIqiwLXof3saY2026QA0bjYfOwkOpEzarKdn+jlm4=
X-Google-Smtp-Source: AGHT+IFZzGUHkXYiqjsmNvZxAlgGfJWJ4+53GwF2v50K7HS5bds/Bm3OyQcdWokxIIhfUj6PuvGMvQ==
X-Received: by 2002:a05:651c:b26:b0:2ef:1d8d:21fd with SMTP id 38308e7fff4ca-2f610390981mr50261141fa.2.1725022973619;
        Fri, 30 Aug 2024 06:02:53 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:52 -0700 (PDT)
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
Subject: [PATCH v3 11/12] arm64: defconfig: Enable VBATTB clock
Date: Fri, 30 Aug 2024 16:02:17 +0300
Message-Id: <20240830130218.3377060-12-claudiu.beznea.uj@bp.renesas.com>
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

Enable VBATTB clock driver flag.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- update patch title and description
- dropped CONFIG_MFD_RENESAS_VBATTB

Changes in v2:
- added CONFIG_MFD_RENESAS_VBATTB
- added vendor name in the VBATTB clock flag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 81ca46e3ab4b..465b70a06c33 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1361,6 +1361,7 @@ CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
+CONFIG_CLK_RENESAS_VBATTB=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
-- 
2.39.2


