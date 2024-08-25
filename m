Return-Path: <linux-rtc+bounces-1730-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528595E4B1
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Aug 2024 20:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E888C1F214D1
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Aug 2024 18:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9038E15B108;
	Sun, 25 Aug 2024 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AQXZbDu6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95071547F9
	for <linux-rtc@vger.kernel.org>; Sun, 25 Aug 2024 18:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724610669; cv=none; b=t0nSFILpmy1np02pvL4sfELhKQ0J3R7qpRxYho7bH5YvB9unfQk7X46GPDQmJWMR7XMe2Q2B1JfmToJb/u7wG5JnlMnWaqAieTeVXOEQYs56smzCSH9sZ0vklMGFvVdtuIONrcJjC6NARhSX0MbVl+rcA0wiK/XQDqBucWS2aLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724610669; c=relaxed/simple;
	bh=331aaMLNzttvOKxi/Q/+mmK0DHaLczIPAXBxXCaSyKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlVHH5JcBrvnk4oLunamCd5zyTBIrrLtVeYFVKH3m9JTzr/idL0sRXsC3beSUGgimWgRR8HEzqPKuJTGN64t/DNNyR0nvNlwYWDyTj+fWIzucEo34RQm5urK7lRTFwsIfHXEqOzvwdGbrHqg3h5etIpvAqkESt1A1ICxedJxf0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AQXZbDu6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42808a69a93so5569225e9.3
        for <linux-rtc@vger.kernel.org>; Sun, 25 Aug 2024 11:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724610666; x=1725215466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w81sNAjj7bntfbvuI21+JZjX/UT6h5yzbhiBUj0PJK4=;
        b=AQXZbDu6qPxjvl00UDSvK30IFoQpjLXdD1GnzcWG+yxYYZmtuybHQic2wBx6sjFdO0
         UWXv0JHfjo0KnDdzLSntWfIJOyKLWhP2F8H1u/bs4tdMHJ3FWOM0B6i8q36G1Rl0P/g8
         DRdKdlFC33R2hIp9erRCKP7uzhgW208WJhBvkiuUd0NABD4hFuQNc6zcIjxpQk7d9oRE
         O7fbBZ3etSW5BCgfDG7hoCU4xGR5oNXT3v4i7mWGa8s0ycUd4W9H2zj3ka23g1riqbbR
         0Ob81kYMF+DQ2C8+FyKlj5UHh7bBDGDMQnbNmuAHpyEy7kAye6KbDtkpBQIc4VezLTEh
         HmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724610666; x=1725215466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w81sNAjj7bntfbvuI21+JZjX/UT6h5yzbhiBUj0PJK4=;
        b=bkbUKJBorbFp6EWEy8q5bWejXsCbUEfIZyMhxrykB3Ne4eRVVRdiBxyyXhLNVNznEq
         4yvccS8bnk2kVz6Q5X69DPWFbk/kosBgyR5iKNL0OO8eLpe7EplH9iPWsrnmIDb+PLfK
         zx2ojPBeQdzxfzWFXMB+YLwnBo3xs7CMT/5kbyW5axk4R8flix1sfu2/Rlnb6RZYf+5U
         GCuqP6njkmX1XZDeTNvmAHMlIUQjL6wmyGj5uduBkyzhsaqmvqhftt5RWIHDZgFsktyV
         lSRifzDpA9t0j722rQ9WwyE1JX6YaCCMjmJMqJ5VdqrTgyr/ppI3bNylJ58rIptsZVhq
         EfDg==
X-Forwarded-Encrypted: i=1; AJvYcCW+BA/7f7zWzrk4BUxr5sIrrBFyv9ZUB/tP/ZNF3thAmXoLCqW8hLNIvLgBPl+wKS6XFpn/OPwCUS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK/Etwe+BGnyPuJvxrio64ksMCQ3l0gkWi7XpHnxRqFwe02eq9
	XAz8jKRZXmp5CJfNuKIhiVv+G1g3sbMd1JZnHpNsT45IFYv4C9Hoyhd3mwoDN5k=
X-Google-Smtp-Source: AGHT+IFejGAuvYGwHP2LF9xrcXSzDcVV088gMtM4kujRFSeLgJtQZGFe1VXGPMy0SKXdemyo6Zw+ww==
X-Received: by 2002:a5d:6481:0:b0:360:872b:7e03 with SMTP id ffacd0b85a97d-373117ba829mr3215443f8f.0.1724610665912;
        Sun, 25 Aug 2024 11:31:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308141dc3sm9034183f8f.41.2024.08.25.11.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:31:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: at91sam9: fix OF node leak in probe() error path
Date: Sun, 25 Aug 2024 20:31:03 +0200
Message-ID: <20240825183103.102904-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver is leaking an OF node reference obtained from
of_parse_phandle_with_fixed_args().

Fixes: 43e112bb3dea ("rtc: at91sam9: make use of syscon/regmap to access GPBR registers")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/rtc/rtc-at91sam9.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index f93bee96e362..993c0878fb66 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -368,6 +368,7 @@ static int at91_rtc_probe(struct platform_device *pdev)
 		return ret;
 
 	rtc->gpbr = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
 	rtc->gpbr_offset = args.args[0];
 	if (IS_ERR(rtc->gpbr)) {
 		dev_err(&pdev->dev, "failed to retrieve gpbr regmap, aborting.\n");
-- 
2.43.0


