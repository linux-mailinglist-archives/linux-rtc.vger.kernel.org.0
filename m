Return-Path: <linux-rtc+bounces-2425-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B979B8E4D
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 10:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84EF7B217FB
	for <lists+linux-rtc@lfdr.de>; Fri,  1 Nov 2024 09:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E891194136;
	Fri,  1 Nov 2024 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YrXWyvte"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1A11607B4
	for <linux-rtc@vger.kernel.org>; Fri,  1 Nov 2024 09:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455066; cv=none; b=ds7mjtRlVqjXS0RKuUnyy9Vz6w3twZmtcbMDysNoH57gG650JZokaLw6j9b03i1TlD5o78mucxP0i+3N5f9cbB3mZGHvEACi/e7t9Ok5MsO6U/jOodjYaP9+lrFg32/Pj73ylT7IOKeMHkpHCIF6in1lgFRGXESgLTW/+enQpTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455066; c=relaxed/simple;
	bh=S+F2FkEdi2w5OLkb2FF8IDO/kgC5BfFXc48xK0PQxEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YGSBNxzNKUUHFkAXl6HlRz63hg0wqJgabFa1ZaRLil/te6/Wec0rcsANrl/HqPBU2j7K5SEMeYvHMJ4ffFvC+0K+QX1RR4jGA9xocwdX8c3s+ndlv3m1+4xLNDI5rYVRwiCq/WL0fh4+EKowA6lesLttjeIZDpJMslhiPuBM7l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YrXWyvte; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9428152c0so2442331a12.1
        for <linux-rtc@vger.kernel.org>; Fri, 01 Nov 2024 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455061; x=1731059861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=YrXWyvtemX2WGnv5ubtRDUhTK7QTIqTHAEEtO37tJi3TGtO5qMEHccZZIU4b1rRixV
         5KMAy1JPN1GjnLBcAEam6x/+cNejTDUnRnO09cQ+9A+LmSzfFX5DYoYXnCHiS/t713ZU
         4s1mfJxgD/VtMt6DC88DOmF3HLSRnG7uvnHW3goK7tqKhfhQkBY8kL34Obu4iMFgHgQm
         Md3YxmL6GNYahpg7tlG83y/vP3vKFIxeKrRZF2kQ62l0qJdk9+6xscRMU8+R9DsgxqfF
         kQvnKTrzUP9Qu45hBJzBL31OQXGynjYBW9aQXwmicpExEbWPb4WMuf0A5DeG6KC4N6P4
         0wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455061; x=1731059861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewtg0K16I6vEI9VCro/VP2IXg7P8FX0BQ2vY0LS22pU=;
        b=QV6YrqWXIP5RRWymUyLqVCWv3S5qnPqjXv0nEM9Q67ECI9w5cWOSWa4zpFgA7cXPM+
         ApdjbN+GhtszVnf5H9iOb75MXFSuyQCAoev4aZUCxiTe6A3ol0h9Sxciac5zePAe4TGX
         IXnO3idk55KMCq5+zFsRsUFkLWJHC1OdxrRxXUyH/dL4BlTGv8dfbbOMAMnqVNLGmICG
         UV4wS+/828TNpDS7U+M33yV0k66Rsae6Lhpyf0J9CcHO3hSESI865nQC1e2Mzj0VlCGV
         uEN4c1ysXX9cCrKTNJZ6v7iKVrcdbbRO9xfgsk0Iojdfq6bKzVRofftNzlSFIOJoMxH/
         uFPg==
X-Forwarded-Encrypted: i=1; AJvYcCXHFsNcR2mf1LF2buAvX5OXpV0mvLsZCEJMbh7/QMsc90mtL9VNIsemO4MuoHFRMEiJ6W0d4hz9jRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5/tiaA/61mbBqraE2488J9sWaOTakClvG+qDKOvbPM7ThZ7w
	j+KjMBw1VBh8jNceYkoVLrRpbzBtWP2HUw6Z68W7bPOP4l3NdbDkD5MO2iB/79k=
X-Google-Smtp-Source: AGHT+IEFGiN/u4W5r9i6MtaqopU2l9fL1FFrDwTz4s8iqC4tcmgZL2qm6/VdNeHlxydCj5OuRaUwEA==
X-Received: by 2002:a05:6402:350c:b0:5cb:69bb:ba8e with SMTP id 4fb4d7f45d1cf-5cbbfa78a8fmr13489266a12.34.1730455061093;
        Fri, 01 Nov 2024 02:57:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:40 -0700 (PDT)
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
Subject: [PATCH v6 2/9] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri,  1 Nov 2024 11:57:13 +0200
Message-Id: <20241101095720.2247815-3-claudiu.beznea.uj@bp.renesas.com>
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

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- none

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new


 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 75444e250a78..a49859ef3304 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -622,6 +622,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
 	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
 			       NULL, (flags), (reg), (bit_idx),		      \
 			       (clk_gate_flags), (lock))
+/**
+ * devm_clk_hw_register_gate_parent_hw - register a gate clock with the clock
+ * framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags for this clock
+ * @reg: register address to control gating of this clock
+ * @bit_idx: which bit in the register controls gating of this clock
+ * @clk_gate_flags: gate-specific flags for this clock
+ * @lock: shared register lock for this clock
+ */
+#define devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw, flags,      \
+					    reg, bit_idx, clk_gate_flags,     \
+					    lock)			      \
+	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, (parent_hw),   \
+				    NULL, (flags), (reg), (bit_idx),	      \
+				    (clk_gate_flags), (lock))
 /**
  * devm_clk_hw_register_gate_parent_data - register a gate clock with the
  * clock framework
-- 
2.39.2


