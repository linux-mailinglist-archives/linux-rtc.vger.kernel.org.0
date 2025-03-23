Return-Path: <linux-rtc+bounces-3575-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75766A6D193
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA00816F117
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734D61D86F6;
	Sun, 23 Mar 2025 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ro5ATcEw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E651D6187
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769573; cv=none; b=UlnavXIO+lhnU2YL4LFCijhy+3MBnIDZ7h8B4/aVpu0ZaytExzXuNMXRv44rAuc7Qtky0GEiHCASzFrNnkvWUUPhEw9+lU0IUu+spmiUEdVuESvxqXfOOU/IkC91B7wF2W2q5wGOCvDwL7AVrWgV77NDYq+ZIqNImJu/S9jdDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769573; c=relaxed/simple;
	bh=SOWDFBYDVimh2JZdbpqs93MuJ5ZKdaya15zjUJJgJoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ef5i5AiMU9e5QZGS++aVIe8PgiIpZqheKBPD28YfvgmgF/7pVI7VCccy3mCFk3tOmWPfZc6A/jtGzHLDBX8ON2wOt5nwf9PMdyDyjN3cmM46vBwDGEH5N1kMrA3MjN5a2IiwvTkxePdIw7KzakSoN9II5Zn5wkIkEDasuw14S2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ro5ATcEw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so677056266b.3
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769568; x=1743374368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=Ro5ATcEwOXJoVYOumsx3SzyVEZr0IG0MbaEdO3CqShFnuHHX7IA3m+53Mge+A4z2+K
         Y4gISwjjFDeTGH+A5hP5NV37c3Mfk1ZROF6AeKE66mHgWJ0rbvnyRe2h5SCxyavfrjP/
         xOX05pEBekJgjHGfLO4PmSIYxso5YMdkOI8ZpXp5oiQLCrqMWFfYaQgp8lVJ96JPsfBy
         KsOvSJRRe4uaTIPxXOF03cAA0oqbGCJ6CSP7YEO8x3Ncs1SsxqHmbjvwZR80nzm56bWY
         zroBW25Zsp9DOgHUsb+nRZLCF0rlB+LDEdvogubZegvgBkEOGZO7l1skyOEFAAdhvJr7
         9+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769568; x=1743374368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1WAgr4uwM04DZyOzCnLxT64GQbYEMMtR1/k9PjNmnI=;
        b=WKp4mKuPfc0YJtlZuJpM4jAF+Qj5FuYGTPEOYKB9dKx5imR3VktptSW2vZseuEGS8Z
         CahuMiDgTMaardIn1+7Y1aQYgEk+zuOgCw7YmjZbWQj/bLJ5DhGbfUP3K0/VEnXOg02N
         JRX+c1oV69yUkWljEFoUXXwnFu/0aeJ8888WHqvw7Lkj2ME16jof+YpTn3u7I8UUHvcc
         A4JgOoYbWnj9LWjSUZRniXS0wS03VEngDeSJ284tSXwSq6wXvsA/Qu3IDa4MTVR1HBDq
         H8lbGFjcY8vK2OZ2jwG8zIHRkCJeTXrFN4+yufxMcSwHAU9eJF9nQ/yshor5ATeU9B6N
         8vNg==
X-Forwarded-Encrypted: i=1; AJvYcCXz8ktRLeYXtvjvp7UxQA/kitS4idXCtIsLJnn+7/iEy1MFCteOqUOWhw3guJSEJe+v2/Paxnrttl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZwrkMxtYgxVs+ZBQqAcY0lH+GWr24kML3TRTnzHGxpaASzGz
	T2K3MhTwttE+GE6Yp5OSKtMTxMJnx68Izpk0DxfT2JaQ/WDvudoZQIvdW6Q++Vw=
X-Gm-Gg: ASbGncvwAenAidcnGS4Rwslrx3KJFio2MXP5uGgoIFJKzMcrfU2bojgT3pqmzFN/xir
	iFJJv2XMgx450Bp9s5qgoqyxB5ss13+xD62YQ3+7aPzqHbRfuahcPzY1zxosuJBcssN6B/+DTVY
	PYC/wc0bR/o8pdV31gOh5cgBD7F9UE1dANhIMAXIbAqyaC0+okfJ0/qV06TXMD4d3f6phK8Z36S
	WAIoNXFa0Rjb64ta9W59hgodQXFEXe9VDszc8EZBT0jU8wvLbS5FvNHI2lZOP0j4kL7ojgqXovN
	xlrKfMqnVGsmTUl9iBdjgmCjyC3n8TFz15C8EchyE4/cPLM4ssrEYQN+YTzWouKLQkc2K/IZcNo
	GWcpVSLJJI8+R9pZyeStbSiYqc+gT
X-Google-Smtp-Source: AGHT+IGESlPld0TIZcF+ERlnjIFgWzaZCupFw8MycHD7wowlazt/klJI/2hD2dVdJFw5afV/HysuBA==
X-Received: by 2002:a17:907:bd88:b0:ac4:491:1548 with SMTP id a640c23a62f3a-ac404911816mr803996166b.11.1742769568148;
        Sun, 23 Mar 2025 15:39:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:27 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:24 +0000
Subject: [PATCH 08/34] mfd: sec: fix open parenthesis alignment
 (of_property_read_bool)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-8-d08943702707@linaro.org>
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

As a preparation for adding support for Samsung's S2MPG10, which is
connected via SPEEDY / ACPM rather than I2C, we're going to split out
(move) all I2C-specific driver code into its own kernel module, and
create a (common) core transport-agnostic kernel module.

That move of code would highlight some unexpected alignment which
checkpatch would complain about. To avoid that, address the error now,
before the split, to keep the amount of unrelated changes to a minimum
when actually doing the split.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 83693686567df61b5e09f7129dc6b01d69156ff3..b931f66f366571d93ce59c301265fe1c9550b37d 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -276,10 +276,12 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	pd->manual_poweroff = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-acokb-ground");
-	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
-						"samsung,s2mps11-wrstbi-ground");
+	pd->manual_poweroff =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-acokb-ground");
+	pd->disable_wrstbi =
+		of_property_read_bool(dev->of_node,
+				      "samsung,s2mps11-wrstbi-ground");
 	return pd;
 }
 

-- 
2.49.0.395.g12beb8f557-goog


