Return-Path: <linux-rtc+bounces-3879-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9DA83285
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CFC746077B
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B112206AC;
	Wed,  9 Apr 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ft4Jz9jb"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B3216E24
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=VFZNVpC60Vs3S8Od6BVbenNgtZRxELgL6mp2mXisrYdlU/Zvw8+o9PcNGwFbS6zAlDvdPp8ZvuiSSNGdz0GMYGChVctMG7ic8Oz5OUFQHvmJ8t0+xNfnYxHT5vVjDb1cIos/fJeI9GLxPtfDMfXIPrPb0YJqpfj0YW9AQmIY4J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=3OWU4PadtGYnTOgmPw8gXiDUPGbaAd/UPB8FUmZS3tg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sibyx4rgDLuj29DqDdZL6FOg+BWikc6NcYYt0YCV6i06fPdAbYyiK8Ga6cVbxoQUocQWEd2WdicxzjeQmQ3oJ2N135J1LlrMUmAXI3nGjpfIo6A/77hzVLS/4jWTNBfQ3/c++bTU3PdBY4l/Mcvdows4TnLWSENCJ3e4hheB7y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ft4Jz9jb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230722866b.1
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=Ft4Jz9jbMd1y08XA5sIYuyQpoPqAntACey9vUeLu+HxanYGg5jA/mMLzJ/F60Ch7oQ
         ekqCc+VOJWz6PFIpIedCa9OsZeQt3S7ZFeCNhIYoLGZe86yu/stCpTTBUMTcvYyHP+/Q
         2hTmIKTa2WwGDaqDmVyhPTJIpV0dRnsZRck1d+0Iq76t2LDdBQ2BHr9dlyDUZ6jslh+V
         R6NFBhcYaw/eXa9ZAjR+3sjCfNPjq+kjvf4g64pq9HKcMDJHPeOOFwjXm/TuRgfiX/h/
         Zr5UIpsqfshMA5sBwoLFtrV4ZXx7Ejy9gHJz3IdL/h5CAn+Zr5bPlh6iLfnWRvyfoSWe
         kXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2K+kGSEI7CbW62pffu4JaosdNeVJj1iuYtYl/IPqMzs=;
        b=YTIy95cXy3ruMR/uVpyxsqWTeD75CyUE7QG/mfHyjFvYA61vZru0nhjF2rKvZb2Jv9
         S+BAUXKbnDDMYIc4k4jPtwvSxr2M//vbSudN8V7uqVXomV4DiIxzz17+67mZQwJ7eVSQ
         bqVFwxNYcfzd9cOVlMUId0VttTfeEkwCCHmpsVPTlxMxN7WgfRXS53nWO5X58ajA0nAE
         GnHqOodypX+khvd1vc5qK4oGQ86nuyAAQ35io/dFDS1XzQiUodnvYkWdXKSuYnf939V1
         /1o43qomSrpVr0XfcNd2vGqsnZOyNps3LYqvDArNwu53/ZnOMG4yU/jO1cnQt9DO8Axw
         y1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBTJL8wllh3LJz4MyY+ZuPj7UC/rjgXOvQYmSGgUC48sYwnJFQsvNmemVS4CiDjdCu0OwIi/HmnZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxerZAvNriQFKrDOy56PwdBr2z4ub3OMBRrbVrtuX8ct2x03Fp6
	d3eSdO5Jbl02E85Hkjew2NMxGT5wA8JNua2RvLAAocjhcq/fQ4eEqtKBZHGjPyk=
X-Gm-Gg: ASbGncuXCeP2hk77kiiUkVxeI7saIXv1F9EKzLZU9z2w4Wpc8rTL8LfgFXFI96EPHaR
	e2lKFOBzyLGZL3YppjP8GbuhlUd3fBG10lu0ElKQM6eVOH8+HmOvbJNMk74rYqobI7H1dGQZf4o
	tF9jtK3HR94RlYKuV0lIxmLkBHrL6wZK01Efoh7USxfzJx4RSSOEWkIdCzhwFuJQUNQAWUsdCY+
	FdJ6OH14jDRl4MHrUPTBeqR9Rxpbtfoq2rPSTjJg2oklaIJ1ZjvaDvhTnlyA60D4sNcIH03eq7V
	cSZDDVt7DWzDYeykLCipAkT+2LAjzqmOQwHUTJ8dWCCHK18/VGJbdIr1nS3BjZcUEyK8N4QW0W/
	7f/DMFSVcg3wJ4XrdSZnjwriZDzQ=
X-Google-Smtp-Source: AGHT+IEEu5frM78xjaYtfvJpOfPA05D1eB7ySMJAK47y8ri2kTuUJkGDYBSO/DNVkH448CBSxwwKIQ==
X-Received: by 2002:a17:906:dc8d:b0:aca:b45a:7c85 with SMTP id a640c23a62f3a-acabd39ea82mr7993866b.19.1744231060332;
        Wed, 09 Apr 2025 13:37:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:42 +0100
Subject: [PATCH v4 21/32] mfd: sec-common: Convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-21-d66d5f39b6bf@linaro.org>
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

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.604.gff1f9ca942-goog


