Return-Path: <linux-rtc+bounces-2242-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E019A4C37
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 10:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360BA1C21595
	for <lists+linux-rtc@lfdr.de>; Sat, 19 Oct 2024 08:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9D21DFE16;
	Sat, 19 Oct 2024 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="iujPUGGU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5E01DF966
	for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729327680; cv=none; b=fVdZOxWPjtkqSycL3C4f0Jr8QMwmXnVGOcPUKt+7q5phfvDtNGUdSG4e0LMQeYWX7kDlStmVC2blhyIhIANVkuxYflY7GcyGkKw6c77vpgxERZej8XgDYLdKn6vHvDPWn3wiOdqr5jEC+EPy0oxp0U9p7zQO5RpNQZKQQU5r9RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729327680; c=relaxed/simple;
	bh=XndoBq5icUuaC8n8ZicrSOnKmXky+TlQYLIR6YpqpX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GiZ4g5+SZLyTyeikR11Su6G6denYiM5M+R4u3rQV7Ldfmj5gNVeB1Plxy9i01OVLvNewtCy0v8jhLQNwvqejGEMKX2/0QdxAzFtlbkNXYO9xbf+6Ailu0bxpwdvlTPCYFpbjzlJrhAPcOtnBF3xmisUcEOlKIxgNfCFjhYugJrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=iujPUGGU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43152b79d25so27244605e9.1
        for <linux-rtc@vger.kernel.org>; Sat, 19 Oct 2024 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1729327677; x=1729932477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTnY3HFe3FG1IX/LwF/xVA4nLpmRTEI1DSu1u/YXNZg=;
        b=iujPUGGUOLBWt9ggqyfVXkgp2hpFL5Dohgn750K39W/MRbLjl8luZtJlA2VH0282Xm
         LsVYovd/XxTkgCqhOKTrCRyI3TMRu3EAbs3RvW+UsTUMFQJiwTyO6cuyAUESDuiVHPmd
         lgex6D174+PXWGLWNfzV5T1ng+y0mWCIcTLlhnvJG0XECDjPFyYhNSDG4Ke8t3eJzFzR
         +X+NT/NCU6rimOMmlc8aS2ZrxI0ozMoBaX2FO3jt9GdG7f27ZitJ2sXPTxyiEpCT4dEU
         u1F81WYX3HBBJgNCGH7VyE+frn2O/wtaavOxS9PT+RT/42+W6HfEBSxTc98FIMnMSDS6
         HKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729327677; x=1729932477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mTnY3HFe3FG1IX/LwF/xVA4nLpmRTEI1DSu1u/YXNZg=;
        b=FWfBVxFa8HSx0/dyX4S7b1eGcJJLn/lKNqoEUvkjWefiuh6xBzpKxiftouwqBxRK9C
         qRPA8L+w60KfJefBdpWeFLfzww5uM+I9q78gqmF4mJj/j/Z3Im+18+p0jvBFGEvREhIb
         8+c0RRru/dFKk14szM6US7cqeJavbG+grLgFOzD9kgsBs7Twl1selezwvcKw1D7IMSRZ
         c+hT1Cy7K0kyukfR83fJFkrBk7T1h7t5k5hXPmHu1wgGt9SSUWeL5FjtdsuUUwFHAcPG
         oQEd3UJgbm+LHtu0KIPdv4+YRFVwiKnJUZrRF6oQUTVdp6/0f7GbRXqmt3tIDM5RChBP
         xjkw==
X-Forwarded-Encrypted: i=1; AJvYcCXKWgJ3UwGhHwrM3gsSAMJPIz0N9rp0V/wS4V5BKiGPC5L4CASDS+J/EQyTet4JFyjoEAJ/zY5yFbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfYhcK5d2LcwDKKgHFhryF+a3mG0dBGMVuVeQzZBJocS/vNO9R
	4CNs6+GME4yUlnqn0Db+GbRh/ORLyiA3N38+rj8ZG3ZvGnVbtHfDhLqO+NGYoYE=
X-Google-Smtp-Source: AGHT+IGAvO1pmQAmOC6yOToJlDv9V+XBj+EVZgmE7PFNWYwWoyfUq798Pdrt/ucX3N/Ul+zEkzbslg==
X-Received: by 2002:a05:600c:3d9b:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-431616a37femr41678615e9.30.1729327676716;
        Sat, 19 Oct 2024 01:47:56 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm3898731f8f.81.2024.10.19.01.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 01:47:55 -0700 (PDT)
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
Subject: [PATCH v4 04/12] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Sat, 19 Oct 2024 11:47:30 +0300
Message-Id: <20241019084738.3370489-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- none; this patch is new

 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 4a537260f655..824b62059364 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -608,6 +608,24 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
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


