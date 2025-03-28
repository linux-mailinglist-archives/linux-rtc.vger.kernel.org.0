Return-Path: <linux-rtc+bounces-3691-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53750A74B4B
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:44:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183181891B89
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C4E238167;
	Fri, 28 Mar 2025 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nV1j4V4/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41421C18E
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168679; cv=none; b=DmcDMGpINbs4DRAg1Ot21/7s+8nbSLuzMrhQ+eEkOtgjR9uZkk1l9apwSWj1CCe/dX9NlurIM8hGxpp+/7UoO58pO8lZa5yxAgvQrcyCpDGp21HZqY2GVByKTDgrfBkasNCYbMGPLOggm9lwPWvg5FXgBIdKtJs4WG1ImP5puoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168679; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE/mFHEsBgLNWk8bBqtcWdGqMeS5SnWfUgxg9LlitlJTxG9MgcbkkwPk4PGVPcrt01d8tRtW9bYGTm2F3sYTeO7sdDMP5W6W3n5KGHxKq415qp6lNMnPMOBgcdcSJqwJJrJVG71x7oahby7/bX2tyTL/e3JY4AzGPxo80tq2XFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nV1j4V4/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so3972744a12.0
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168662; x=1743773462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=nV1j4V4/dIkxhlaR22kwv7O538NCkJMzYdChmNNNyYBx9gYBjA0u6F+qHKjj3HKTSI
         iAdNouE+c8Eu1nT7xfAv41KAsk+auq2GuC+/akczxKWFQmfmX/jc6PIFBlbdmPmZcP3k
         Bzk4Syk3oZBCDIkrUNHm23GHnyFsEEwW46dc6BrGiR6d1pGnPIF1/GTg/rsHaKE5hFQt
         LC7lrJ5cdCBcemqS+R0jAz+ExDU7hYQ7yQpOdthep0D7IiOhi59ZkxH8/qFxyQ0/kehn
         QgC6IEEHVHeNwl1bmRvk0Im0RwRTGWnTeaEAm9K3Y33ExqlUOJfY4jiUPiKYdAhWPgQK
         TqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168662; x=1743773462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=DXAT30HVcXqSCfU67A52PHjXZ/r0QQEBd8kg03EEggvsjdSjK37i3DqBV9XRInXFBT
         MBmVUm/5jJK2BmDMWjEPTceRVkRaIZFrDW2XWN/jkmm1Vg1wiqhV1E+QPzknej88BT0L
         +fxjYQtqHi5JJQFLEVyWTIyrGlDzyZzFOeKgTiihlgPH1IOLNFSJhjWI8Xud1I0aoaiy
         ayN876syT4bQfxhy9L9OtDKKULz/199HBePTyB/DBHEuv+MPGNxA1bQX9/JbwwY/Sesa
         HM7WgbQQDvmS2YJf3b4Uu6XSVk5ioLissq8/eGJkjQH9f2zylpkhMJMx9HFsMHMdfGlo
         FXMg==
X-Forwarded-Encrypted: i=1; AJvYcCWGCQGrimz0xUif7ZHLsxSMuu0EmrWOfk24vY6hN8Om8GHl7wN+bJBqRueCSL4IC/P5e9hKzaFFN7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsn7fLYsF4buQNDjzSaD5zyhhuVTqmK7ssr4qHY1vT2jO04D70
	k5s2VaZ+gr/pJxkYe63bQm50Ou9fFnT4LHROtUAXvlTG1drJqTKiOT+QIFTSgcM=
X-Gm-Gg: ASbGncvYgo/2G9NP2aebmmwLlfywa2EWSGFHGqHda+VqaqWgenjkWj1x56kF3B9dKj/
	pCiBYnQwQtYD/kvyzv6E7yaUS76tzfQV4MCG6JSwEFyDLJmbrsh8ZJiKE4qOmrtP+2naULKGELK
	1x7TUaYiw87N2ecglkwoEvX2T8CuPX6CPpIaWkJnEdy7YlKGMMqoE5kfGKIaPxddSzJoGNLer59
	zcyHOiMvnIQZaSpwbAtFdkY0botx+iyZibHsjLQXS5oMT854RgH6SsdZf/a5a2FYIXhn6Zlry2Q
	U3i8JHMPFAyPcu1XBqrFbFLU+Jc2tJ1vVAbGWG3/O2TDQHjt80O2PwA9iGbDkCdX3/Hdd7fdQLN
	efkCX8nbuSq2i2VKlEImSVi96up9t
X-Google-Smtp-Source: AGHT+IENTriv0ZKQDvxOFGqnTo7xSy+uELps+TAzZydZP4h3NfKqEFYmhwGmgFpAh/R37lkn+8E27g==
X-Received: by 2002:a05:6402:1ecd:b0:5e5:ba77:6f42 with SMTP id 4fb4d7f45d1cf-5edc44c9935mr2924122a12.4.1743168662019;
        Fri, 28 Mar 2025 06:31:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:02 +0000
Subject: [PATCH v2 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-16-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog


