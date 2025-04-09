Return-Path: <linux-rtc+bounces-3874-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E167A83255
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF39C8A2E6A
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F2E217719;
	Wed,  9 Apr 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfrGGi1L"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76161215F7E
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=hokKqdzjCro1VdP18E/jEHyq5UTIJY0LwE+aaHSNpqHt/HIoVE4z6LKP029/m/pRYVKWYUm7VAoVNQbIiWPEqzqPgFI/r+sLCfMIlWjfFgv+sZFOKNo20U55VCC+dlkWMO6pYzfmV6H96IupApwUzxB27peReWoQ6T9t2O1D4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=3Me2u0NhSmvUHUm87c5Lew65uoJBRoaotojNz31DdRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNi0IbRoA8AEYLmV2hxw6dsBYdnD8wD1BfPN5ygJu67trxEUIRn3w2/W+O8id0nG8NOzr3yyd12bITlibACmJ+lqKhTFrtv0aVC8y4UWdTr/bHJ1Gvs0CJ/xLWucLNIQKVrXZxSvcG8NxkK6KivUx1YvAeDjDL4kBlMYNGBg5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfrGGi1L; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbb12bea54so19164566b.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231060; x=1744835860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=HfrGGi1Lp8vA1fc1S9V6LqqFdvvCXMBnAOE3R5cPH6fYJFe9V+5Q8AUA5kpr2kyAri
         2h6zgKTC+Ka50zQWTkQkU2SrAXjgwLHCzzviTX6AH+AZ4TmlCV4P7IWZiJXUILep/D42
         XqVvrtkEm3M7CDJm0bt+s2ETpetoz53BauLqhveCGTeLCx7dRaiGtR9eSQH8+OLqxv1J
         CL3xZb/mHz1K60wXG1sZ4eUgRYJTcfoslP5cIaE1+srpnhYMXsuNtFumIZBhZPhimjlm
         nfNCX+NkQ2qeJVrgW3yVaikbWdoA4cbniArOFzS/hOepywdoMrszHzLIhR31EC1cZRW/
         TWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231060; x=1744835860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BAVD406cmjg3dX/fyGSMAhg9gbpo2Je5SUNU/Iu6Ls=;
        b=LQqxKmsexpgn0op0JYjN6dXCjA8PggQ/3UkYJ5jLzudsWBmBu/p69TCLuZJVfjAekw
         CQJORuTKw3q+p5XhG0gD4oz9EFLd/c7hNbl8R49hhMEYNSnDH5Q0SK7iovyU00Xauw6S
         5Toff26yQJq8iXBzqUUSWQWcTjczRIzAhnY+M6fe0/8dU8NAnerZHvpt6Yx4+zqISEf7
         gfFWQix6qhwIDWC+blgQzuIoExJxfqiZoJhB6FgvSr5dJWlLL0rNVPG/HHz6m84Rd0vn
         0kYjUG/riUODJCeBgJUcx8Dv1ir3u8OD/nGJmUUGPl9nyOoRIMUGSGbHxANvCMkmKi8G
         s+OA==
X-Forwarded-Encrypted: i=1; AJvYcCV4GQALqvAWk7KCwW7iYWZrLhSgLHDtrj06jzNsTYZFvZBwTkwD4v9ZTdA4suurNAOHySchUY1BWO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+aG1dNXjjEcWRPyaiwLHGiSlxa4V9rrD2kzmm31KTBj8n3r7
	KSBK8iKzmJcxhLWj9qgoY/cgZm5rl/9lvGXPtytPaJP82WdHOSMHxQlPRyv8mTA=
X-Gm-Gg: ASbGnct/qm/YOZFOAorNvAvUxWz1xIv9bYssQB94OyMTxW2huvxmPZCPSkgbwZpzVdv
	kDJJTiD3OtE0lXqdrqQ19dq3Tb1msSIazET0nSSiPUEJ0nBeV3uI15yulyM4PrEWcktc4pUlaCL
	55acT8aPHvTUaBOtwt+la5r8Xykmo6lF+Hev8HOxZ2F+2C/tXgOfBaALSHmbhqiplkuRZncmkD+
	iK+Ok53AA3RJrVIVXIQVJed4jOJ76fWhg81ezn8GjP9dauYAbS6Psv97lEZG+VAYvftOcz4yvgn
	y7ccWfNaPzZaFADbwO/9NSBZLjDbopBn4k+dCoBMvKsDH7cXxmJtIkd4uOiCU0Asc7m6fvtSTfV
	ya3wntI0zWVjTMq8DNRpqZ3eGL1wLEA0wt4jtGQ==
X-Google-Smtp-Source: AGHT+IFGuRopXUZBocg06rjmD3ZHp+XWR7FsT1M8CRyC7YTvs4QmmNCB4EgixbVEA8gphf+u1JLXHA==
X-Received: by 2002:a17:907:3f89:b0:aca:a539:be04 with SMTP id a640c23a62f3a-acabd1231fdmr10950466b.4.1744231059836;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:41 +0100
Subject: [PATCH v4 20/32] mfd: sec-common: Use sizeof(*var), not
 sizeof(struct type_of_var)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-20-d66d5f39b6bf@linaro.org>
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
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.604.gff1f9ca942-goog


