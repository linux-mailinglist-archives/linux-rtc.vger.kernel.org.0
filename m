Return-Path: <linux-rtc+bounces-2854-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA0A07BFB
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 16:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D38162AC5
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Jan 2025 15:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A8421D58F;
	Thu,  9 Jan 2025 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3Tlhsh+X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652121CA1D
	for <linux-rtc@vger.kernel.org>; Thu,  9 Jan 2025 15:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436608; cv=none; b=Bxd74n1qvbidCXFVgDBRBXneEmfdH8lmnNxHuVDNvv77xakG4YnrH2OEy3cC7cHfEbawT+ZdZhgyHVQ5ffz6n4KLkexP4PUEcbbN/PMPXB2IIEJHVHMShTP1YtR4MCp94NXsUQX7SC86kUEakuf+nraEhXI/hqNYyeT5TcyI8+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436608; c=relaxed/simple;
	bh=QOPtwlardGLEi9evReTJWR65j/y1YA1zAVx5xliXYTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfSU/0XAmBccLfNcyGs+0Q/XpgtmuESTOznuqIuzWYwgMbqCgsghLIZ26ITU8BzsyO3uj8gtc8Coe0hnXH/QwmEoDdJteBFVVFiV+ouGYChQO6vgso2hR3Pl9kOoII3p8on82Un2cwrqEe2rYWgjy7LEMuKCJP7zyYgJbtFg7s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=3Tlhsh+X; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so610671f8f.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Jan 2025 07:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436604; x=1737041404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nxBzYrNzM8Me+hNhVQhLjukgzaVazmsb+QowMe4xPo=;
        b=3Tlhsh+X0nYWOA0GcgDMCCTL9LlypvOhOs7zrPJBJjBzzG9lHv22Q9RMLEQM/O6tMJ
         29jgCy3uGp6tL7VYQAgPuo5fx0oxyDo0hRzOr7rb2XgvDyEtOMY0WEzFYn93lb6Lg1lT
         jE9EVg/ovB6ut5TS1K9yEv7d3AJlLnIG+3xqMX+mxcjr/DTxaCH/UhSl+0gvwnNp0z8n
         4iEdjPhVyR70RK64whgLGeGPd9TaVs3kRRKamb6DON82DAGR5ouhpijBHPRhUnadd6d6
         fZgPJ+W4ZeTm+IGPqWrlTMdXluUpKwWyOcIJ1VDguZLAt0QiKQKtEax/wousr7TF5S8h
         fahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436604; x=1737041404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nxBzYrNzM8Me+hNhVQhLjukgzaVazmsb+QowMe4xPo=;
        b=D7w8Qjhc92JReEiNMmKc2SihtprwoeNLtPOh48TvRNA5otyexY/IzyYrMj364U3b4x
         oFVPHXz5VrOq4IcHQyObdJrR4tJkLxZjp++yT+xOPgbJppsghSjl2PmxE9MwY+Bpq/Ai
         rAiw8l/H/H1W6xk3JZeSi3Fq7oCCLVIn5XsguI3x1EqMmx5NtFDr/hZsVMUbiV/M9fkp
         z5z/jpylc9aV58Ej9jYxfLMExAG6qmT5huPbME5LBDAE/WE8rOIaMKW5UYnQ8EVp0Icm
         Z2cMG7OKmHJA658FBPQXbEEUOU4oidHEsZCgCDNspxTryCyHNL7FfiGvnKL1zB/LTctz
         tXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXey9inTjOrnyy5BjrRByyQGQFM3f3KtW7uB3f+8YgsIyj79p0eBGZWM6dAxJkcxV0HS4INMZstu1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIjYIgsgM+RVVeEi14EzZSnMRpPN+zFuVt+5ZMgFRoCUd51Wm
	jTLSJ5zN222FkXOyAJK2En52O7bGXJHhGMmL01IYxkCKg176uIdkUQdW+NHoNE8=
X-Gm-Gg: ASbGncsJmyRWfNy3stbNxRorEGNv66mL6E8Y7JxWIw13bCnksnXaK+QGarsZrTHwTts
	aX0Fei9sVZybTVEU1PbM9LjX6GTMHX0YHLhY07GwnHhaBgzSLyvIrXVDw9txj3Fpgy4/JWcbXCH
	ovyGPdiTBaIuHPftGSdJp4Xbzed9IanXJgei/iCOaGPx29oeN5bwerZTrW91EaNuAKZPvWqbh0J
	Vvauyt7wqclmMMEZWglqGayfDpab4ipS7DwwWwJMgbpPB8rKmLw5iB0IGA=
X-Google-Smtp-Source: AGHT+IH7DdR8iHL2Hi28KJ2xlmMvDv/dz/uFZ53tjjjsjQowPC4CZmmWUVJY9138Dh2OGjHWbB1Iqw==
X-Received: by 2002:a5d:5985:0:b0:386:3f3e:ab11 with SMTP id ffacd0b85a97d-38a87312e0dmr6332012f8f.34.1736436603924;
        Thu, 09 Jan 2025 07:30:03 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:03 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 16:29:51 +0100
Subject: [PATCH 1/2] rtc: mt6359: add mt6357 support
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v1-1-e8223bf55bb8@baylibre.com>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=QOPtwlardGLEi9evReTJWR65j/y1YA1zAVx5xliXYTo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t5Uh5A00pLQHAjBhwGqpehhi2NxaAmpv/tdLI+
 QoL7SkiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/reQAKCRArRkmdfjHURe2CD/
 91UHitfxOG9AFgC4OxNgHslqy/ktEncdPmkEzj4qa/S0mkFFbThl1dTkHiokREYRRHWegB2nIQxR0g
 XXbhL6B2phVKeYwHj/awOTxD/0Xz3f1AIW6uXrReZ9OwPiOocSKEbhkv/TpynTsEglyCKyoMj7uDQy
 ZyRN64qJurasgzdP+chqQA/hVuBMgeY7TKsb9iWUXywCzM5d9vtauWZ11gky3+CVpEcl4nD9b5ACuC
 8YVRgHfV42ZHBjpGancF9Yw2mH+4ZePPBEL71JXGk+4oo5rdLr7cwGmH+b7hCKV8jFRuVvVD7kLeqq
 HykeOuklv0stKYLgkQrYC+m2DVov3dH/LRsTsrwQblw5QTR/kI2z10jO0Myuo28BJxhmUx60Lh2ONp
 KWOxwyX/SDoS85iVCX6rglVYLUyfKHwTQcupnENexHrbwm6e5HdjqrgPYi101AIrpflbv11s/cjHJ3
 fvFQmJKSI02JM6S/jrk2TTZNsFLBLf2SMZneU+p4j8zJuHYUGr0QdqP8S1x6WunOADkV6Mm438Q1vL
 V0E5mPdlrAiREzegdBOG2OJD0tPNO68/a7d3nxlczqX8OYztJnkK7w57Ope9ISflKNBh6O1gHdPpuU
 Q/HMAfzexfkRvazAMpBvYk3hmsPZWtHyAN5tQfuQcFdDutdh24Kx+E0iCAZQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

MT6357 PMIC's RTC use the MT6358's RTC data.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 152699219a2b..55e75712edd4 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -332,6 +332,7 @@ static const struct mtk_rtc_data mt6397_rtc_data = {
 
 static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
+	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }

-- 
2.25.1


