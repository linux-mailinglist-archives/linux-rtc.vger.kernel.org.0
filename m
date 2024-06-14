Return-Path: <linux-rtc+bounces-1296-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8452908455
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5420F284B5E
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Jun 2024 07:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B0E148FE3;
	Fri, 14 Jun 2024 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="nC8TDRst"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8634146A90
	for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349594; cv=none; b=IvHMxEqxvjwe/a60bWPuRddIc8yCqZXVYnSt3CAYrq7/RKVjuhshjxJ4lOi+ta96598f97iMthvXUkzFMfRCPaGJYhwbYtU/hyp61IJomTpk5WGkhoW7oS5ERZEHxAsnTC6nZoR+V8IxP3kfzBgYyIFcJEp7lxEpxSPsfo/HJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349594; c=relaxed/simple;
	bh=Zhy743BbEYY+SI+Tb2YTPmBo2LZvD7uiPniA/XwmwtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gt1Jtvu/mHE2qb6liIVmvVk4rvbPtfUHf9CZWxSYd9Eb8qgC9ihc+7wc7MpeOMLNQ4ksEBfFBckI50ruBuPrDwshzJrjePJcqHsdUGsrW4EX1WzTJi/Vu6urHsPMmWhH0vtNm+4jvk0DhenOzr6LbIVL9GaVHHrkbpTIiyJDhKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=nC8TDRst; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so11308525e9.1
        for <linux-rtc@vger.kernel.org>; Fri, 14 Jun 2024 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349591; x=1718954391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KasawgVYyRihhmap9sWeLzVl10rVjnzHePrPG2MZMwM=;
        b=nC8TDRstr7n+ZhdNTyRdDgG3lWcL6+Nl/hAgF7OToplEdgMHJoAY83gAnsCBkyy8i2
         OdF8dE4BP3YpRWOHexq7h9kS6CFd6/PijuryXwKYvRK6fTZ7s+tjkZt9NmD3IkF55W0k
         ktwv+9ZMiPsCYM8xH3i6NZmCY8yRK9BC23B+ORTl6SmfY5kNMg3hh81noO3Ro54QH5+a
         4bwXjVcn+SFgKSy0tT0BLWQdYcj9/BAXyChpoCLJ9UU+Q1UGAhb0GP2Ge0cNy1wZ5nVe
         u3lUghWCK8rVS2WwpEWROFAgvGc/QUzOeGZPvRO77LI14TfVc/DKWDnLqV3w61KHAhe2
         mFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349591; x=1718954391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KasawgVYyRihhmap9sWeLzVl10rVjnzHePrPG2MZMwM=;
        b=RP6hAJDRnxqhK4QvPZutOFA0i6kaHeSLvoC+t6eBX+rx1PnFSobJcuXdR0Phq+GILe
         CBT16ecxtgFU+0/q3jp+g2mmp9MTql8wdNDIRDg3CDGOJZbuIn/j0VBQBOKPTStb0d49
         F3jc3ejhZmLXPHAzWQUY8/EaNIyc8TXXJHlE+M5IgYbyYND+J2vWdh4hdYwHDI40GP2c
         LIZuijR9mkmuJ79eG4d5wK8jCqPdEs/6V6kGzp21FFFL2u4EWGCr/SxvwNxuVS7JymrN
         Pc6B2tQczrBPdCYj2UMGnUwGJPeBEGymEry5sBgfV83AtsRvOL0pt7xFm/ybflbZAzhf
         6IJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyqgMQKjp5SRhATwlwryn1H60nVnwsBV3oaRa7Go86IygYYd3R0838VAgDZYRyx2blQ1zymRWrQqdDIqy3cj/eAo0ABBhDt50P
X-Gm-Message-State: AOJu0YwKHA/kbrtuLX5PX57UJhzWlEfjBbTlZ+sylvfuD0C1H059dnhy
	9gbwDbNfWL8ADeVku4z904HszMyPZYq5CzSk2qA6nWDCA4p0nm+ItdcBww1DM3I=
X-Google-Smtp-Source: AGHT+IFm9u8DBlylzRCM4uhJJE2E99q1w8J+jbzBLdvMg/1gVqKsZ7fS/hjqLa586dIEhzPS6xfzCg==
X-Received: by 2002:a05:600c:19cf:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-42304825ce7mr19505375e9.10.1718349591097;
        Fri, 14 Jun 2024 00:19:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:19:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 01/12] clk: renesas: r9a08g045: Add clock, reset and power domain support for the VBATTB IP
Date: Fri, 14 Jun 2024 10:19:21 +0300
Message-Id: <20240614071932.1014067-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC has an IP named Battery Backup Function (VBATTB)
that generates the RTC clock. Add clock, reset and power domain support
for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index b068733b145f..2ae97c29c377 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -215,6 +215,7 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
 	DEF_MOD("eth1_refclk",		R9A08G045_ETH1_REFCLK, R9A08G045_CLK_HP, 0x57c, 9),
 	DEF_MOD("scif0_clk_pck",	R9A08G045_SCIF0_CLK_PCK, R9A08G045_CLK_P0, 0x584, 0),
 	DEF_MOD("gpio_hclk",		R9A08G045_GPIO_HCLK, R9A08G045_OSCCLK, 0x598, 0),
+	DEF_MOD("vbat_bclk",		R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
 };
 
 static const struct rzg2l_reset r9a08g045_resets[] = {
@@ -231,6 +232,7 @@ static const struct rzg2l_reset r9a08g045_resets[] = {
 	DEF_RST(R9A08G045_GPIO_RSTN, 0x898, 0),
 	DEF_RST(R9A08G045_GPIO_PORT_RESETN, 0x898, 1),
 	DEF_RST(R9A08G045_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A08G045_VBAT_BRESETN, 0x914, 0),
 };
 
 static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
@@ -238,6 +240,7 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_IA55_PCLK,
 	MOD_CLK_BASE + R9A08G045_IA55_CLK,
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
+	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
 static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
@@ -275,6 +278,9 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
 	DEF_PD("scif0",		R9A08G045_PD_SCIF0,
 				DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(1)),
 				RZG2L_PD_F_NONE),
+	DEF_PD("vbat",		R9A08G045_PD_VBAT,
+				DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
+				RZG2L_PD_F_ALWAYS_ON),
 };
 
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
-- 
2.39.2


