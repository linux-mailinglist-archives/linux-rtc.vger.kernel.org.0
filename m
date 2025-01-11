Return-Path: <linux-rtc+bounces-2882-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FDA0A56C
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 19:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 722711886FB5
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 18:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A366C1BBBE3;
	Sat, 11 Jan 2025 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="td7IxrC9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A818C018
	for <linux-rtc@vger.kernel.org>; Sat, 11 Jan 2025 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736621650; cv=none; b=kTDrWAe/FswgOewJKBCVVAhSfNg9voxDkpGHteQo6oa2MbOnP9Z6t8Rz5GQqW7Dv8r0sysYJ1tDy/ZNB9P5vbOcbEqkaQzfgdeHN06ZFbUmhWboC9J/30xQd/x3ZetGZiExYEydchNiT4d43YKrbyyk44Ptj8hVddezxzmorBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736621650; c=relaxed/simple;
	bh=6USYYxzCgpUPcC909zd3sk8QnGJ9duS/rrtwG4L4ZOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NU4YK9x62/6PBphk59+yrrRVTLml5YeeWKANlXO7IuRpPNDTNbghrqlgwTHMs6maoJFXd26WwNc+Y0euiCh/DjJWDvI5OCaFuAOJ65At2agJGR5oHF0p+DIOqzABxIgp7XQKLEWcoE5MlRs5MI0t7PtnA4B1AzLpR9+iQp6I4PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=td7IxrC9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f398a171so2881925e9.2
        for <linux-rtc@vger.kernel.org>; Sat, 11 Jan 2025 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736621647; x=1737226447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
        b=td7IxrC9BBKW2wO3vLtBUt/3rNinttb7NCvQi1TTRly8GxRS4k5M2GvZKMtxeCCnv9
         AcQx3YGIK7B5RB2wCiGYyf02vD5fh6y+ciaWRwVGYkU/Gis1HhfX3cCGhwGRmOKz6gZL
         H9fr0Jqx67V5CLZxGCEfZC7GXA/MeENxgHA3Wa7uJqSjcqsg8VsBvjNSwRqVlkp0HKnI
         84fCLSSWV4BnDfxN+4TD/C9wL5N6HCm6lp1DSII68P6hUv7uqU3CoyyFE24B333Mn507
         HBHsvYhBN8SdfaYJSFXZOzPkNPPVvp+VP33HX5m5sDhFFCeAB8Ao3s5yPAjoaWYT2x2X
         QEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736621647; x=1737226447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPRSMg1Y79bflHzzHnMnAqsVQxqcpqEauFJNoySqrOM=;
        b=aZ7Ee9pMlERgwj6SVmN2rVSwiCWnZxHqqAsqfOT3WSF6sA4dMEi8Xvpl+GVBuZNDQ7
         va+/COixnut8vYmcVizxSXkfCH+XH01VP/zVV1d851ibfBub9vyyFRcvKExJElZga85Y
         CpuzWk7ZOPphKZoK7Vk5YengAJoJW8q3ZnpSehjauSMe6Z1ZkqEsRGAtVSl2UJNh6cqt
         GlSuBKZ118ys2HEP6mO+PzuhNZutBGB5F/IOrYHSJGX5zT0uw2KEc4pK/i4YLjHHAAUe
         6v372M2XScTjuKklEOJ9BsVG9h36Or4EvelwHG3O5ZGrA/Hp1Bd8bilv0tks5AQmyZNK
         /kjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW24jvVCnUPRJj6S+wM4qMVlFuWHBvOK1F/lHN8+mK6dGHQHQxc4JJImywRCrX4ZHyzLq5SEbN4y0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxukjixVN+DNgVTDNNahs1IQ7xXnpZu3SfjtfU0Ih9M2pR7e+1s
	wLPFYnb8pMdrTUE0INclqhmRLzLjQLeFUIDEpbSWC9xQrOOCYTLx+LSz91Q57+U=
X-Gm-Gg: ASbGncsUmn3pmakkHgiobg0iwVBHbFGiP4rdEPTiEjwnuZPqvHk8hj9yne0wuEo8PzS
	Gy4UtucbqdrSntaD1rHAK44AdNrbYMB56Ve6V3HgQbmzIA5BKDUGFjuxOqi+iOYVZ1724OmLT0F
	senInGbfy87uVHztaAs8/sOtpzEVpPN5Yo3ibHcv3uZBnKrnoSORgwfUNfKFyFm3NyivHwqpMyN
	AXCgtnCOvEBZQmsDRv4mMVwgQwqPyl7KmTyL8WdcxkEyvkK6FyV5zBKkJdtAXHOvtGE2gY=
X-Google-Smtp-Source: AGHT+IGKMCNZ9lSIpKE90rRk19Kureh0VeUXVKcP8mbMQG8DavWdzbFmeA+Vz1ozm2bjDyjv4IITPQ==
X-Received: by 2002:adf:e3c4:0:b0:38a:888c:6785 with SMTP id ffacd0b85a97d-38a888c69bcmr4077895f8f.6.1736621647135;
        Sat, 11 Jan 2025 10:54:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a9fcb7a11sm2315556f8f.75.2025.01.11.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] rtc: stm32: Use syscon_regmap_lookup_by_phandle_args
Date: Sat, 11 Jan 2025 19:54:05 +0100
Message-ID: <20250111185405.183824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-stm32.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 9f1a019ec8af..a0564d443569 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1074,26 +1074,18 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	regs = &rtc->data->regs;
 
 	if (rtc->data->need_dbp) {
-		rtc->dbp = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
-							   "st,syscfg");
+		unsigned int args[2];
+
+		rtc->dbp = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+								"st,syscfg",
+								2, args);
 		if (IS_ERR(rtc->dbp)) {
 			dev_err(&pdev->dev, "no st,syscfg\n");
 			return PTR_ERR(rtc->dbp);
 		}
 
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 1, &rtc->dbp_reg);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register offset\n");
-			return ret;
-		}
-
-		ret = of_property_read_u32_index(pdev->dev.of_node, "st,syscfg",
-						 2, &rtc->dbp_mask);
-		if (ret) {
-			dev_err(&pdev->dev, "can't read DBP register mask\n");
-			return ret;
-		}
+		rtc->dbp_reg = args[0];
+		rtc->dbp_mask = args[1];
 	}
 
 	if (!rtc->data->has_pclk) {
-- 
2.43.0


