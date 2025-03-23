Return-Path: <linux-rtc+bounces-3593-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA3DA6D1E9
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7831886F3E
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889C81EC012;
	Sun, 23 Mar 2025 22:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPpuqkEj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958A1EB180
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769588; cv=none; b=rCjXlduUfKBTxJMsHv+iQbmssqUXtzAGcL2NiGoL9mkzWayxVq4KQxf/mUAYXIFSW9BJaSn8997poZsozElRA+WhPp25tduH9G5hWYZIzK9XW5gd0pIoZ/Y3HRNZoxVSdMTy/bDulEIF/vzvo6CUUjcrBCh3jVjof3Bwzw4bkJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769588; c=relaxed/simple;
	bh=ANmM5x/He+PE8PRBy0626kbsZRP5OO6JjTlgz9DtHdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hc8ncK9D/U7SvLuCFwwsAPXlwgeVGLrilMguK/2kuz1uZo9PNg3F9AMqGHCPhjV1rQ+kl9L3TQzMle1+h2wMq+29WROt4g0lFm2tV1CcIQp76RCjLag/oldbqsNBjEXor+xAK/Z+WRL7ESuvNkpD+Gk5HadgA4brFe7qeNc3mhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPpuqkEj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac289147833so457751966b.2
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769577; x=1743374377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=dPpuqkEjp6AjZwnV94pKzTW+mqVLGpOch6NK0AK+r1n/E6VLnypm+gFsnPmJ3Qle1P
         rd4CX9OKK8BXaIzsFKYltvDnsT365lCGQkfcRGjv0H6Q13aVB/M2MchKrOOE8D1fUaBI
         PLWDXayWGudf1RZitnKWKNg2mMUqp8Tg+te8ZkfJ75/L6F2VAukjW61vXgdhIBlteLa0
         UrNXkktpa5jWqlf7Rt5Fzr5lmjQj/1WLB6ZXOn973Y1HiDNgmuSxmYQtQkr2xTAHx1eH
         BUObqCLjhMZRkILYVcVY9Pf8cWLcVpy8YuNkUSYbjllxwLG4LaoZzhbWcAcB80MefG7P
         DxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769577; x=1743374377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DaAxKK1RdiX9Q5Rykt2k9FAZMFKWbpXqOP1fRVyJN0c=;
        b=fSBpHelDmg6Kr1+IXX9pz8NsNzRb1JVjL6aS52xkec03/RrdujHlhSnzcx/aWF/yK8
         63FrOLM5xeJN6plr/gDKK3dFa9AP48tJ0JGIMcxeD7jphPharqteXVRwiKTv/emeeyQ4
         v5MUf6ZLm+z6E50t9mhYm45zdoiPmwMEbGe3j0ApP9KHJotgEl84skFREg6rbpb3ufLA
         XjU3BG/hBohI+sUTsDjIM93WfBrRqG3jI7EoICZxjJ70vQj4rcbu62P4t4rt9JNKRkGD
         y31GZ63q0Gu6OdmEyva/pDQTYZwXnpjZg+pZLXEUITZTxBEciCsLEGm8QcqNubW/xZtE
         A0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVyXJTrfhyCVD2zg/rwHO80mrklYZvEJWXKUZICWM+g6cW0ya0pFrJb8k9E5QluLJ1UNTRUgarlWVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84++K201NNiFVEhs1p1fAd1j9DHHnoQSqcP77c5RRTaFW3ZbZ
	kNHp5BwVMxWK8OCt8/rmYC6H8t6QKWe+tmmVw5QxjBsT/y88DXObuNwTY7I+tnc=
X-Gm-Gg: ASbGncsj1jqeOXy8LQq8EOnxCd2A7NK9G+/zOpfHI0GYLH487hnArXxxPIA8TitL/fd
	wf2r00rtVpuLuSM2051YeEKXxRI3HGgEuNt+YYAerkpJxm9mHGXPobFVUeRDW8NIbZnE43JfANG
	06crjPttE9P5f3lTjMXKHC43rnFVPVBktQm+YTFKTy8z5CIjp6jB+AJQKjH/6Q4LDktLT0mj1Ul
	n+Lku4vIY8Bcn7Kv8MyYDfV8UCqhoBi4Xt0AT6v4uUO6rV0EQOZn6pftzr3LhyUk3VD/twaxRBy
	gmPvGSy0shxhrd106xYBIjf4ZjFR55e7VDIpNR5472a+zScOwYYZo6NEaLpb5CvWdTzSRGrune1
	lo5fQ07lmnOEffifBYep2YuRca7Qh
X-Google-Smtp-Source: AGHT+IEHAfiBfUB/nsPtj6YObLClfT3lIBDTn7g2B2otGsQqhwkiW+Sr35dDHIHATiseMaWDI7emPQ==
X-Received: by 2002:a17:906:d7cb:b0:ac4:5fd:6e29 with SMTP id a640c23a62f3a-ac405fd6eaamr641943466b.26.1742769577350;
        Sun, 23 Mar 2025 15:39:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:36 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:39 +0000
Subject: [PATCH 23/34] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-23-d08943702707@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 90225b683fa083d4df7a20dfaa4f47084051e250..5ebc77d7edacbc1b7a3debb9069bb489109d57d7 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -139,7 +139,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.395.g12beb8f557-goog


