Return-Path: <linux-rtc+bounces-1801-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE51966242
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 15:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814811C2353D
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2024 13:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890661AF4EA;
	Fri, 30 Aug 2024 13:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="C5c25xOG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA961AD5DE
	for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725022960; cv=none; b=QfQZRZa4lZBdq370ZfAILWS+kekM8p83FN0o4VuXjV/6Pix8BqUX+gwRVnP7uZHuMJBRrY7qR7HCH2JXlgh0mRBgu10lWvMvsanc68aMWqsDjOWDfCQzJ7rOf7vhoRE9McZQbgn/tolpSPdm9Foj4ctjV8n04m/RnvskQxZ3TlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725022960; c=relaxed/simple;
	bh=0NDjqlI4uZwZiIKOebtOX/P36Pfw3hvCzMBzvuazjxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AA3ZqKdtqaTdDSNTxPwROku2AJitBvIonHL9Sodx739ruIfBbmBl4fyUG/aFO/FXEjav9O29IfxNhtJ21Nkd+txr3Xz2AL48jfoISCfFd5sCFikUj371eUUxgR4OWe1AIjkxKxgECwFiZUNc1ZTtW1ku12iT3qbhuUk3kIz5/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=C5c25xOG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-533488ffaebso2166118e87.0
        for <linux-rtc@vger.kernel.org>; Fri, 30 Aug 2024 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725022957; x=1725627757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxknm/UXmtXHlPwjDVhWt1Uw2fradJB++SjLkjTrWtM=;
        b=C5c25xOGTO3E5HYmrGRcDsPdscuZXyeD8MNA/2tcDfcbddbCOGbY0wKENUm4dF/8LK
         yjVwFGvPQ+j0ifJosJmrXisITzRJWl0hJvFNrImZ6rQQEfzIYphkC3mxOVODHr55vbd9
         BYGt63Bao84JCuZvsiupWo70TxnEsUAJrH5wSMb00YHcPQXxTJNsLUbylZE148hYYW5L
         vU5SWhcTdFZd3ug0WeE/HGKBkek22kMQ2DzgfJLXOpUnlPId+2mTjF0jVDMQDstObI5D
         0VPhn9oD18zshrjIomR3B7pOExWNqoC3y8G/QBAdZnyxq1JdEzcHXMc0t4hMmCNoCJuh
         iPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725022957; x=1725627757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxknm/UXmtXHlPwjDVhWt1Uw2fradJB++SjLkjTrWtM=;
        b=WQvWurctSxqCMjSoI/YEMLevS/5IiYL3HhTNGrrPyoOOgXwFuWRD1/pTNa64CppbRr
         oOwA6Ki06kVCM9WAGYAyT7oJbB7TNgVxy0hTWe0s475wtmeZxlsVVB/tF3RJtIuetMIR
         daDPPSHmKQMCZGcc6R7u54Na4kn7HMDoHIyW+Fvs4qZ/2wOUV3owyRCE9yfiHVNZsPbx
         H8WAKE2eu3sl2vo7UrOy8KH/B05y9T2QLaizyQ0BtciFdFhMCPyC8tlfb95pvCkZstUG
         Y9JTkZdpHfmBs6gTyp1jOfIzvmPvpq47pVJFuwoTYxIBr34Go2R1A5QDeKxzgLdcNeNh
         Jb4w==
X-Forwarded-Encrypted: i=1; AJvYcCWbAl94cPEfBaMJF5IwBY0VkXziiagTKRkYHyRL4kiv4A3eZAwuk+vRqb46lxUmT6nfeW7vSUwBJMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQwsF7sSW8zCZaZ9GAuEgLZ0kJVDfN8FvhNHi39f0sJnbwcPP
	zE+eA5RO8kS5ZBt094kNz8hG4o+Z4CpIdWsRlnODq4ig7Y1K7eizhQV9zVUj6/U=
X-Google-Smtp-Source: AGHT+IHczdRB06BuoSLQgq8hhYH1CNuoRnBx5DM0ialnn7WYz/l0nKY+9xvSzheB55rdSChNyE4hiQ==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id 2adb3069b0e04-53546b93f39mr1386545e87.41.1725022956336;
        Fri, 30 Aug 2024 06:02:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642594dsm80361785e9.47.2024.08.30.06.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 06:02:35 -0700 (PDT)
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
Subject: [PATCH v3 03/12] clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
Date: Fri, 30 Aug 2024 16:02:09 +0300
Message-Id: <20240830130218.3377060-4-claudiu.beznea.uj@bp.renesas.com>
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

Add devm_clk_hw_register_gate_parent_hw() macro to allow registering
devres managed gate clocks providing struct clk_hw object as parent.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


