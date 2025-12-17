Return-Path: <linux-rtc+bounces-5581-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB464CC7AA0
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 13:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1EAB30A1DC8
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Dec 2025 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813663148B7;
	Wed, 17 Dec 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooT9ab/V"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9311C5D57
	for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966258; cv=none; b=mPpGvI/pksx/KK33Jii0iV1jJMucq0UbfZoL/nNdD1WjGeJ+MZespRNksXu8fv+S6A4EJ6wZFKnuaV0ayLq+A/HLoOq1cSsNSyqnBMiMCArf6qMeABtJz6ccZNYg4bK5rQeAzNr4TJvWCxrEonInmV+JwitRceyj1pVYRPQqDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966258; c=relaxed/simple;
	bh=D80UQ8DT8x5gDNh37qxMkColQlMlnGetG+D6Y4IENvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C1IXU8v1nr5XZDFesDSupZtno1pDonSI7dSYEl35sRgsE3jbtTpz3r9LUu8dfaZho5/Lh/9rv1rDmyXTwcfoMhjigs+6EFW2bouy5VLJBcWQqEyiVfKKu6zyZgAZopMLjyZ4HtPp/cjUQLShQYjN11WwMSqtgo6nvO5vo9BdyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooT9ab/V; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so75561166b.2
        for <linux-rtc@vger.kernel.org>; Wed, 17 Dec 2025 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765966255; x=1766571055; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=ooT9ab/VXs7NU45sHldIHT0bAGl7MJkJxljRqp0hA6gVGCOb26E90AejzoBinHBg/E
         iyhgOo56mAF9NBrNUs1QipmqHZsArz6qwVT2uXpQOKtoL1tCpQ4SjUKrtlPk6V/K40e/
         Z8VFIGebVdD7d0NvNwqrN79ZhCO3ReGNMJcWmz0W7URdQ+6Tw68srKC/W0qIFbcJkiGN
         NPm1Kb32xjU4lappnOgAl8MjShI2pMNRlEej6GoA80TsNIIv3VhG8feJcWh8ru3QjB1z
         JHh0Pmby+pOeFAs/Zsj9+tkUWpU3aTTngX7ls9Bt+k2UK9ZdRuNdOOovstzEQkxdhrUp
         i8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966255; x=1766571055;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmx5Fh1q9VVmgUGBpn1GZZhSMw+zKOQQK4BKRiX9H1c=;
        b=XhmrlHg2sA1C/a2tX4aVDhfjaq/1QstMIgAaWGGPVX/JIqr4xkUDHxl77kdhOmDzIA
         XcpwpjS41Ryz43Y8n3OwBrY9MWtxzr/tGkcoaSY4Ex4lJumO88C3u0Kbj5z+8zA2ylPb
         fRns5LsSGXtASvCmBS3Id4d30sgzDPwTJ0V3AmprxnYYiMY7cYpXPUERfL9YrGfRLRkj
         tEyV0fS5dPNmLcSzeijiJJHMxzv28FUoutTS6hUqTZAIHZunhDjcFqDrfbhrXYR2Umj2
         j/G+HfqND5abeA4HIoPNCAH/xT6thHQe1V8ux/kqIfmpJ4LaK4C0rT6vQXItx6EMZVBq
         XJog==
X-Forwarded-Encrypted: i=1; AJvYcCWf6Rg6KP1EjEYmuVX2qonGxnmBVMolO7g8apGnV+v8pwbyjUaaMXcIbmQYiwvt687UsQGzwErROuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiDr5SxNS5GPBVoa5ij38xZO4OWUoPUoaJfmrQvnd+tYn3dzI
	vvhUOE3nAHlc7K8uYOl0eq0Y7d5zsTOIksqPLbvJpGkv+fqOnHFX5acBhKnsM+CxWlI=
X-Gm-Gg: AY/fxX6SgPE4XXS5XKT4uX9nbG3Nd0I6TTQ6vEwMdIaCvar5DZZtyDbVnJ74kSjchrC
	Z/KEe93W/rjYvoEjUc5Gl1abp6dLo3LSI67tW6tdKPG21ACMM6ptE7mOQT7Q9cWYTFZ2MvnFVxe
	l88vULWtRKAbYY2ibe+Clmay7ij7bcgaDuVR8fYD49mF91mQpGwjWnG9njUwM1FFzfHYGS93JX2
	VHjLF7Isqrv94PikkTGmxjO9CcQQa+1m2G3dhn3RBIoNtyYBTd7gcySthdPCc5wXx38G/rVdtth
	vuSn6R77ukg8gR3HVD47bE5b6Pnff5jGvVUUYZ7WqUzQL0UWjcjwilAUxECvYgYXlgsg/G+xSk6
	5mY9S4p1tG8UrUlXNY1rkQAQXnr+3wt7ADDnc/gXv/GR/8/3qe+06IdeCYQB7ZQh3m/G8Liyi1n
	m26Kb5YD4nfy0PXvmr4XlJUNO14DUmIH75wggb6Ra2yYu1vNiNE3Jmytu7fZiL0tI1YNnQnu2bM
	50pQQK8UnRdBevu
X-Google-Smtp-Source: AGHT+IF5zm0UEFizopfWKiRe5Ec3MeSDOQ/+bpnMQXefKzphsbz91xocDwvtUI0VN/lqSomvkA6FhQ==
X-Received: by 2002:a17:907:5c2:b0:b73:9a71:13bb with SMTP id a640c23a62f3a-b7d238bf832mr2100181366b.32.1765966254506;
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2043811a12.9.2025.12.17.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 02:10:54 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH RESEND v2 0/3] Samsung mfd/rtc driver alarm IRQ
 simplification
Date: Wed, 17 Dec 2025 10:10:47 +0000
Message-Id: <20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order as patch 2 without 1 will
fail at runtime, and patch 3 without 2 will fail at build time. I would
expect them all to go via the MFD tree. Alternatively, they could be
applied individually to the respective kernel trees during multiple
kernel release cycles, but that seems a needless complication and
delay.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase on top of https://lore.kernel.org/r/20251114-s2mpg10-chained-irq-v1-1-34ddfa49c4cd@linaro.org
- return struct regmap_irq_chip_data * in sec_irq_init() (Lee)
- collect tags
- Link to v1: https://lore.kernel.org/r/20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org

---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 45 ++++++++++++++++++++--------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 63 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++---------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 61 deletions(-)
---
base-commit: 9ad5de6d54f306b2bbf7ceb27e67a60c58a71224
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


