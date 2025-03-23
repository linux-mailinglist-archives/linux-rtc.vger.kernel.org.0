Return-Path: <linux-rtc+bounces-3599-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEFEA6D202
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 719BF16F580
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE86A1F153C;
	Sun, 23 Mar 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFuCW/qi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3081EF0A3
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769592; cv=none; b=Qp3jUWqxX4GBIEUB4FxREi+GvpYwe8mi8LYl3+T3s9+PdDCyAR8kJPA1Tmz/M6MpqC7hJaoBXyHJ+D4qRyHNrQchy77Ibk2DFXmkptisIlNTB8tdxvHzDcIdw/LppM/vre4hcclz8TWNDn+B5W3NXRP+MGMqoYO067htFOs38uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769592; c=relaxed/simple;
	bh=wFMuIyuQV4OeONZ1CTvvoJlBLS9yPymppIm/9Rg9fR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rozHZBwXw74yEV+74MrZY/PzHOEO6gLoo8aY9VKj4g6wYe7TUb/C32gG6f3VAyNF7oV7idyVC0Wp8rpY6AzYB4iiCDPYqwZjwRCGZspiqWlTaEhFd6PNXbP7qvZdVIDUkvAx+pLlp9XcaR5Vcau2JHUsUxBwdM/x5w8C0Ix0rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFuCW/qi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so499768366b.1
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769583; x=1743374383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=CFuCW/qire8aywCE8R2nF9KA3js6JnqRjYn0LxXqEbLMqqh7gljrc1Op+LWpPpz45+
         nzeHo60ZbYx7hfxaW6PPbDGGL+2YfYb/J0n51c9SPiMhge0z7JKYD+WjSpwdGeJYGTNa
         rNQsoK5zJjgWkTUgINrZyBDXgUIE+XUVFIzMPG011L5tTLUEmtg31J6QxPCn72ykhYec
         p/vqLmTB/ZJP4g1WqtgCc3OzI3MfhfTPQeEj+4UcgigbR5Sz3iOi6pEu96uT6XI8NsV5
         lGZjddAI4UHYxZJYjL3YlbXMiLNNqSdDaE9XH1YU3iE/p/2C2Kl2Qc4SOzEvzMKH5+H9
         LX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769583; x=1743374383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB2B+UaRvhzRZZ5Wx1Ln6+NaDhGt6Oe4sLGxlVN20j8=;
        b=JS8rfh2lEVPEGHO2ErPTkThTi19kBmKOUduyahvK1PhLJR7tDSd9XbSjKIxqLNP4DL
         qFHFe3NYtDAPH9HJHs0A/t6kU0fkTkvUpSAmgb2TptHN1q6xiwMxgOFEsXWcBHP4I1ix
         r1e+4fDiia/4cQzaBQ7V5rAPEcAJ3oV69hRPtuGYOj50fdxgLBnnatrDCgBNKTiwtigB
         zXGFfwDezwPr9VIh7rYMeOorfDdaGLeXIZP+eAConJtevXmpzh1BAZweAEvCOyDpq527
         xu+zTzc00QEk8bya9/CGlGuXr1LliXo/rq4l3Yn9gXKhizOyB4huMrNju4/D6jlx47Y3
         waRg==
X-Forwarded-Encrypted: i=1; AJvYcCWdjOAy2IJ59ERSPn4uqBfSA4KBJDwPC4r1NPp6yCUdZyyXPOhTqB1a16ZU4cBkoTQVoU8f5Rxz+YE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/PDREj97CQ5Bdf1UoDuRXv5HEBCgB54vXkp1WyEmDKG/0oVUp
	fgmJx7iP9ZbcSjiaAiBEjqBVK7owNVw4T+q1QBvlv49qj2gGwkhY23MwXI05zjI=
X-Gm-Gg: ASbGncs3P3v/texqilbgFN8pbOwzy0I1MvhNf0/rUrzGXf8aPOKppaswRsOx2Zhqx2x
	nUpUcK8OsymlOxKBdyCqv1vAbqKNt0GaNSFbLC8TlQgZtqj6C7hiQTjp75tTVl2h3JwR8M5xqn+
	Lbi24//kBHKObNq5z3ZNbSWWCM8s3nqXInxlyynj1h2/s9jlRmvp3I7Lr+v3WeoLgQHejm09oDy
	DpMrWJtDghyOLQZsTLKopsiL9IefwwJXoAEznItK2ALOqLg7VCOHT3KNfEoN/S+XRlpfErl4UKc
	q4bRrnGcnoaVO6noMiEH0AtlqownbXXLZwn9a4hyx85hD8LCWdOym+URF999Ux3oPlsvT6+MG4g
	FhKO5JvFds5qsZQVgdSfM6/MNpMVh
X-Google-Smtp-Source: AGHT+IEqdMFkeJB9L19k5i2T9SHkqV7HBIih5q+Sk1+mGJp+qYtrcbGq+req37UQlXtoOfZvy9bw1w==
X-Received: by 2002:a17:907:da0c:b0:ac3:f683:c842 with SMTP id a640c23a62f3a-ac3f683c845mr1099102666b.42.1742769582647;
        Sun, 23 Mar 2025 15:39:42 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:48 +0000
Subject: [PATCH 32/34] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-32-d08943702707@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.395.g12beb8f557-goog


