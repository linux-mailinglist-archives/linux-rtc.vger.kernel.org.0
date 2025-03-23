Return-Path: <linux-rtc+bounces-3590-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B629CA6D1DB
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5592C188EF59
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A46B1F03C7;
	Sun, 23 Mar 2025 22:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cWooRd0l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF8C1EBA09
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769587; cv=none; b=V4bJqj9J1HKdWuAfpKuycTHq5/ui/bByO/sAQ2+fc715OWQ9D/lZXLb7OSmKB6D02ee/SymlhR+4x1ard5i5VrXryqUIJui6lcSw4Nh8tvbVb39RbpkwGg4P+VO3UGLHI/vLVywqwzQTFNUhzSNmtBO5qFvFXtKT1/H0G/wGFRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769587; c=relaxed/simple;
	bh=JzkdkeBjoD27fDThowAsLW8EIMXc8+ZDmGc3PzCcN1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ldqR9VRmErwRYZKe+hO3UND3w2krdHzPLu678V1Re4vhbktrqxIz+pfsrkjyfQCOX8pTlYcN2p/EIluYlHFadvQuo9SR42YufNJh1im6SZIF+tbOcii33kJtJRKNkTAwfIKfUd/Ti1cGsYEPvT855ZXoFALenl6tMmaz5oDS0tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cWooRd0l; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso838517866b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=cWooRd0loMHH/8nAfMH/P78842SkwtNP2Rw5WfIHBTZf48+RqfYbZ//N3gRauhHM0I
         ITeVKOLt9YV1EJruvPZdpRGmrR79yg8Q7h5TATc7g6RCk7lTYNs/NQnRbds4Vuh8EdxQ
         q3FBoNGeTVyHuN03HTzYHddpPEeIDvoRISuiGCtVROc76p3XYyVyUmoCWMlvjPjZVJm4
         VTQkVnoYJVdg7E6ksa9mxXZM9X1KUm0QQm2Mu5flcs8QylKTU2PpBKbxRZoTXf4W0hLi
         xvw2ieHRVVqTd88zuf24XR+5Z2qnCDgQ+5coOJJnRfU0HBzpgso6R2nfX1QkRQr8qIcZ
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Z8QgNOGdyxdSVBJRkjlahCtXXFXCQYtK5J/GCQaRwI=;
        b=Ay69FYlvA99jWP38GizH0eNImSc8LJVGBjGWEQDm/1v0AGqju6BEkIBOGKtQ6K92LY
         gL2JycIMMdoZyPJzbeIM5T+6NdpOkBwpoJ7rp5fBoLyj6CkX93DFEeIqosaH+UgpMnIg
         NT81LfLRnYGd+VFYZOq+7qHQ8iyhT8ggfmP/fCnmb2qHEWd90Q+oKNhBvcMi2pzIpPsR
         t4qAxMZZVKYxK+AoZ3jr2pvk9GXBGnZHWgmhY/tTdGqbjHmoXj0EeRovD4PB/W5vtYW5
         oCJzyD3XvRruIxOrunIrrI0b7fijYbJzfjtxgBOv1YN/2Li3ERQnAZvE6hmMliTVPsbJ
         2sdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6KhuSMbc53ddOL9BzUTdTlNr0H1Hdma+bicFXn9zcrtBSxVZQA6r1VYgDOV2wOMGu4951OPuX3yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL2EHhiPsTn9drYMMXHtt1TlOXyaEaabOssc7WU1m5R4DA/yFE
	DYyeS0dSSk+XJDXogEZrXPDcKH2RfgmUr7MAvwpdWV9yn8BtHRPz47itMFZfOw4=
X-Gm-Gg: ASbGnctCsOROGNrUseQp7YvH7OZiku7uMYKDpqvfVKuubnKH99gAn+kLr9kbGxaUabm
	bZpjSFqQK5BX4sbt6jyw4gev/Y9kVK4aujAKtvmck/a/sxPD/5RFXoW/2nx1QQHjYZr8OKtohfV
	Qz0UH2nidBDY8drPCiVl7IaVlDXQ6XRukk4t1/AohdDsFSfhOfaseX+AVXBSVjYTVWF4G5l4CIG
	YH9phIXWZhRW/bRkCZ78sP8MXTLgAamMr7XQ/R87dN+y9NWGP0kapgkVNZ+g0GkDA/QxNNfIOJc
	k0HFsNZVYO4kF518mPx3BsLM8/t12fkyoVvnUU3pCCWv+AEoR7ywkU0wrAac8cQJyvdrT+l46pC
	7w6oTrPAABQsFvI03IvQ68neZ2IXm
X-Google-Smtp-Source: AGHT+IG1+wcYan4wIw2G87vBZ9kZLmE/4EPPJ6sSCzBbDr/N/WxDb6EjTSy7GHnKX+cpVY7JCrLHPw==
X-Received: by 2002:a17:907:3f9b:b0:ac2:63a9:df0b with SMTP id a640c23a62f3a-ac3f251f206mr898500466b.35.1742769576773;
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:38 +0000
Subject: [PATCH 22/34] mfd: sec: don't compare against NULL / 0 for errors,
 use !
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-22-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 48d5c9a23230d0927b9dc610166ae3f8f1aec924..90225b683fa083d4df7a20dfaa4f47084051e250 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -140,7 +140,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index cf1add30dcd0ff1ad149b483fe40edf82c2b57e1..084a40490979058b48640263ff5cdb38765b9ff1 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -449,8 +449,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -497,7 +497,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.395.g12beb8f557-goog


