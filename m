Return-Path: <linux-rtc+bounces-3873-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE13A83235
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE61617D424
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA87821B9F0;
	Wed,  9 Apr 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+6DrJtq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0464D217719
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231065; cv=none; b=W/hfqyS/cpRI4oA+sbYJNsnF32ohrpWzZevqzKuV6HoBnkIVGionyOGNScjNvLLlqFSzq9j2sfDrQAhaUyDgdb8XbOUvTr+L+GHLey3ZAcLn7vcsP4gS9UK+9Xopv9/erxb1jyDCrAZD23DPgGOWmw6K4LMmTCELHTphX/5uCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231065; c=relaxed/simple;
	bh=+hryrykXS9VQjW9x2uaLv9FXNLWJHO9HAediWJbl+4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyxIu+r2iNE19iPEUT1zxnGr4Jn1Kg5TMgjLkgMOqfEiJrelyV0CTGERv50Yjlb72kn6vv+XK5qWGh6pwS5nwguNYM9qHwH+Gu+dv3g4pePpZEQWEHBhaUliTucn9zQkA+DcTXoykKs6DojREEd2lrjgddoTKMnrfYWFAe1we2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+6DrJtq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso182297a12.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=e+6DrJtqOp556vcssHT+q3B6i4qOa9LWOWl115rrXNQXL/128L8QSZhuhFRvH4nXCc
         IQnYgA3TCRYUSfZsMOTOwaOdsRmojSclYyGBhNIxJk8PqUu0KJ1iY5Y89Bu62ErH+4E/
         8NPnOFTdlLGC10zyRIXXlMCZhGNSbsHwxtgxmpEal9oXXaI034xXvyZg8v+u6c4adCSA
         GQNKoryE4r66GBb3IsIRxHtKOShhVHMUas3f9TRNVBggubcYLjErS4bH09Sy//WmykoW
         kLXlYKgBxgU984k0nLK41F/aFF9rMO9UqI42ESVYIG9kk+3bjaTDvxkAFPHQ8MnalVhh
         8QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=XAi5AO7t/x751vIEGrig5uGHdnPH/snQjY73K8+Ia+E9idQiACtkR3iCMYu6UJIqJv
         qi1aglZaYq4lD5LcEC7/dz01GZ8+Zw6ms3+zXdk2V/s7PXyFGwquqoXkoE3slXJLhldn
         WfgVb2Aq0alZV1bDNzR8gBuugPJ8HEdYjKMK79W23gniOJScQLx3MAoE9jKflUtNO1Hv
         EuzimT0djuHTwhts0ZPn2cDTgDY5Njy7Tmm2SdBs+GlSEl82JwyEUy/Gn/E9NY/lt+Ha
         +Tz0j0sQrQh/pDlRrA887rgK5Z9ZWjw7sF725BbChXtlOTjBc8Ebmkg7UgW/8/v/+F7R
         RMfg==
X-Forwarded-Encrypted: i=1; AJvYcCUYh66rcnKZr306IRnAROXAkrfWhLK3P21BG1eG9vtQPjCH0o4dZEhp9I6fkovsTulaRMSzW1ae+mg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfz33/dAlyh3D1bUgKcXA6Id5nqtn6wkP0Xzu5egFgR1dBXI/B
	obUqVS9TeXNpZc1kJz3E+QEm1lLFbMfPwYRJ4zyy6Vm2rzI34zMv8cXGzDxkovs=
X-Gm-Gg: ASbGncshSMV2b60efPPdNfIZlWANFp0w4j/OCmtFRm/QElo75KMaoUai+WthXBxhen/
	+1XqYY/RVGbakb3uGOb1o0iw4EodG9xxMVR66igGjEpkCMzXYzA6Wd29vG3skmXAw/BRiQ+Zj+p
	2ZdA+gqaI/Tny6mgUCtgmyYEIBIFm1lS/CdI5QCB6pefPwkoW47zubuoubGn/2i41QfVsPAOcsL
	st8SdQqUuWSwP3GkbQqdqWYxDchLNp8If9+mE2MHfs3Oq/miaqEnaXizDnZQtCQHrlSuI1nGE2n
	uMgsfmO+k5f7RR90VYG6LdmzIXG5Xg+qSkR3PNCDiUuB50k9WTeXtgOu+V4ZYPvAnzTkx9zYcRs
	Nx03yvkF4dhjtjuXx0D2RHDzmutY=
X-Google-Smtp-Source: AGHT+IFaBUkiGU7OFSd2C8+eXihngB2V9lqLexzEyqiPbNYC3ushPCaeGAspEyeXYhQ5fM5m2o3CBA==
X-Received: by 2002:a17:907:c1b:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-acabd1dda12mr11931066b.15.1744231059324;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:40 +0100
Subject: [PATCH v4 19/32] mfd: sec: Don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-19-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 54c674574c701eec979d8c6a94909b78dcc77065..4a6585a6acdb71d2fb368ddf38463f001e513c7c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.604.gff1f9ca942-goog


