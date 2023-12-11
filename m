Return-Path: <linux-rtc+bounces-403-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58B280CAEE
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Dec 2023 14:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C12CEB20EB1
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Dec 2023 13:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6778C3E472;
	Mon, 11 Dec 2023 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lR+XssDY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64DBCCF
	for <linux-rtc@vger.kernel.org>; Mon, 11 Dec 2023 05:26:07 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c31f18274so38117385e9.0
        for <linux-rtc@vger.kernel.org>; Mon, 11 Dec 2023 05:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702301166; x=1702905966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYJ6ekCGIROBxHKfB9biqbpmrnuVuPrZ81c+TDg+RPI=;
        b=lR+XssDYJKjJQvoFa07zuBnlAsHyhD9WzclRs8MVQhxp6Ybdge9b1VaEy85cMlE5W9
         51Lnljs4C1OKDywnISecoE8ddlc96vLsaShrIWQ7oRvwnHFyBAEpo4N3WNEwmGJnHETn
         yiP3j5j56eOdn4iYH+uHsL6qhvD/95pnj+u59Vrzluaqa7qHlEXz+vX2NKdQS7+5a0m9
         47qSbj7QY5DYuFHvFAYuIN5B0RtSbm1cuvp+LY7ceRK35MffaPNd7n/OlIFc8ZYY7/TT
         /r7CBOMX+AvPByUahQNKohWBGTkzxYIl7gZ9L5gjqJ7mwB8vRoKkLUrLxkGbV0AnTVBr
         rfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301166; x=1702905966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYJ6ekCGIROBxHKfB9biqbpmrnuVuPrZ81c+TDg+RPI=;
        b=N29p5oyV8L0YlF1SaxKT8JchmwcMu0vFAFESjW2uoU2PaUtYEK3PiNjcbpUFJd84iK
         Uba9hFqKsdASxdhGinRDKHBYb+uMXsEItPqcq5zYkw+ciMLoaPQ6drUwo+niQzww+WP6
         aBWlJ115MqXC3AASXzQjKpwlptK1mQ2Ah56+ZN5uKGUY0c4QP/s/ptNYzo4uvtyNri94
         H1W9MGZlyYow8qZ/r/K4NNUoTKb7rYrv5sntx2kKkVAK0iCi5qatXzW8AM3mljIFe3XM
         WUtxNdh7k6iqJXXkQ1EmxciujRLkFijFNg+OxuOmBkH7BKjxAZChAUbzUhJerlcGJIQI
         r1Qg==
X-Gm-Message-State: AOJu0YwOpc1T9HpbFgMe+DfU/P0j6dWE7E/3yFb2hlhIKBq95o6PMnuX
	IPGmlN97NNiH7om6pRe8Mh3z4Q==
X-Google-Smtp-Source: AGHT+IFf5HxSPeDK3DJfL40vWxPIVBU1BjyzisRjUU1H31RfJgiYx4xFZaO7SEXhS1VXxjIXyeb7Lg==
X-Received: by 2002:a7b:c4d0:0:b0:40c:3272:1fea with SMTP id g16-20020a7bc4d0000000b0040c32721feamr2173115wmk.87.1702301165789;
        Mon, 11 Dec 2023 05:26:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b0040b54335d57sm15152226wmb.17.2023.12.11.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 05:26:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH] rtc: MAINTAINERS: drop Alessandro Zummo
Date: Mon, 11 Dec 2023 14:26:00 +0100
Message-Id: <20231211132600.101090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Last email from Alessandro was in 2016, so remove him from maintainers
of the RTC subsystem.  Stale maintainer entries hide information whether
subsystem needs help, has a bus-factor or is even orphaned.

Link: https://lore.kernel.org/all/?q=f%3A%22Alessandro+Zummo%22
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec736fccbb26..82ef00014f41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18271,7 +18271,6 @@ X:	include/linux/srcu*.h
 X:	kernel/rcu/srcu*.c
 
 REAL TIME CLOCK (RTC) SUBSYSTEM
-M:	Alessandro Zummo <a.zummo@towertech.it>
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
-- 
2.34.1


