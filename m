Return-Path: <linux-rtc+bounces-5743-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5338D194BB
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 15:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7A2F3091479
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jan 2026 14:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05551392B75;
	Tue, 13 Jan 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiUNgOpC"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376934FF4A
	for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312996; cv=none; b=u604d1Z+smmkVPqE9Q9sss3tch4xLZS7UhFN7QJPy2qzNHy/ECPmwLiNkTjT4yqlRtlTW2rArmkO5m8RuYtZZWA8wGluR9MKYxaU8fWuWjpndPEq5NY3OJ0NCn+xLaIBOGzsMvgllFwHZoBb8BoEDFZ6aJbSVzikAoa+E1l/zWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312996; c=relaxed/simple;
	bh=wPLb1aLCPd5TGHr5HIZEGJ8SgaUpySf6qS4BDoLoKlI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IUrhXs5XObJBSjE9pahSa4jptudkm/aHgVUr+B3O3gpAjiKsjY4V0OIIT+hO56f14FLJUTvxpChbnrvkcyF4lkhXqosEwLP5tedLCdK4O4Wf7kvv0GZTQfCHpaICpqtZevGYg2j4bALe0ZPDryGm8N+RBnx88K8e9LsMWmXDOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiUNgOpC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso12461618a12.0
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jan 2026 06:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768312993; x=1768917793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZf//vkgf89Ct/JGZQeXjRY2VbiGXQB+dPJY25guf2w=;
        b=xiUNgOpCfEHP4b3BpklFaxv+y2odQ4o3cUftAU78DAE12/5PTH0G5cFCu3ZM4w+bla
         xCAzyQYhftKZ/6geC5qXabKbAz3GhB2GCPT/QTy7jTtv70QqCh35DQ2nNI4sfNfEFc74
         93GzM7HjuY7kHSsmBctO0Y1Luyc/ByHoz/JcMIyEU0Voel/n+N0oQdTvDcL0zqoE1v/3
         ws40Hq/WdazNaOrtg0PHlW+7qK++d3tYWAKD0/EVmjG0aNTJTPeVrRYJYYW/P5uZIhLZ
         hWsLa8DmF3oX+25niuzWtPyXMQJglY5rMoYL1ehvhxD+HZnpe4tI0oyNqlR9NnlVoA4i
         RKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768312993; x=1768917793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZf//vkgf89Ct/JGZQeXjRY2VbiGXQB+dPJY25guf2w=;
        b=nfaxZx86QKsy/yfhdhmnSHskv54p4ofT59nD0uD1RDCUa2o5/j2q9B49zbAtcvivGP
         Chj6reeWDax8NIisu5TCx17MOrOl5n1ZA/dMSCiwyWVSqars9MVr9mJ4tJbUPIFdtq/z
         ylv/KByp3w6PK6X8cqYhF62kb0/xnTQ7SOuf03b9did8D4y5yRHI6FWTHqYmAzlh/96L
         2Hzs5G3KBtYLpeZNzgEOIYgeTEZAGC/3gcsEMh2g8GjD4huZ5AYNg6AomP9b7Z9I1P5v
         wYB5XbsU2p5gdbZfJ2eOWmb1PcDRS+pHisf9xJIrkcmlJA2AiNYehf/KcXThkvzM7a88
         u5ow==
X-Forwarded-Encrypted: i=1; AJvYcCVD1aEmq821JD/9YQpqz1sIq8Ed0Plkhilec0v8IdyPA4ss35v5TWCiNMHkgsYjHxmmfep+FoMopcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzohA58eMbjAABnhZXqe4LJScUcp+D8NRlhrmnwcQ3i+FXcs1SM
	ZGN1yPJd4wwaGFa9BV96BZFYFcKKJT8mzyf/18U6v7tv23U7l5sfr00sgy0l0TdyRdc=
X-Gm-Gg: AY/fxX5J8PviccT/squAp+MM7JhqQxmKELHDOSvkw6GlxtNztm3r+vGxuWr4cyRC2NI
	RTEycbFSouwzV89ZqJ4hHJxy8EMwfTPuOlPxLV13tdzmPtqslwKH/qpu6XefUFLVjsPHspNl6EV
	K0jopqmDGUXEUk1ohjorfaFWxOKQuOxqo1sQQoAvcKZ1RQILgazAKpc9HgLwD2pdEO4ukE+KeNJ
	GoCyTGvKaQbsuaTquC22v9/D3ysixKIbB6OhmwnNjPFhleLahDcVqmtrWQqEzNbLI6KrgXBZHsI
	dmG4Opwd/KpZr5GXCPibqROAE5RWa96gmG5XotIfswyrXv8IDOEhaALG3cDdzfFyBs9u0mbbsod
	FcpbV9Ge88L9BgkJZ8JwwtUDUC69cDj7qryvdbOaSLV0KB4jzCoK9uf06BUfrujXfO+STPWAUjf
	ZDsFyEfICHD40G2XlzbzAvVFqhooqwWx2pdbI6zmU7bGVte6wLu+Zh/jWLJ48nw0vHI2TYSqYOg
	pEgSA==
X-Google-Smtp-Source: AGHT+IEnGCmSrXFEV/cSN/oOjISMTBPxQg/D5OTkcrfWtfVESeMgdR7qSVrl/Yz2LDGcQ2HtN46jCA==
X-Received: by 2002:a05:6402:1e8c:b0:64d:f49:52aa with SMTP id 4fb4d7f45d1cf-65097dc6439mr20138601a12.3.1768312993447;
        Tue, 13 Jan 2026 06:03:13 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65c07sm20139157a12.23.2026.01.13.06.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 06:03:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Date: Tue, 13 Jan 2026 14:03:10 +0000
Message-Id: <20260113-s5m-alarm-v3-0-855a19db1277@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ9QZmkC/22MQQ6CMBBFr0K6tqbTWoyuvIdx0ZYBJgFqpqbRE
 O5uYYWJy/fz35tFQiZM4lrNgjFTojgVMIdKhN5NHUpqCguttAWAk0x2lG5wPErT4FlZdNYEFOX
 /ZGzpvbXuj8I9pVfkz5bOsK7/KhmkkuHijUfvsLbtbaDJcTxG7sSayXqnarVX9aoGsK1Co6GGH
 3VZli/Po8iU3gAAAA==
X-Change-ID: 20251114-s5m-alarm-3de705ea53ce
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
Changes in v3:
- make s2mpg1x_add_chained_irq_chip() specific to PMIC irq chip (Lee),
  and rename to s2mpg1x_add_chained_pmic() (Andre)
- Link to v2: https://lore.kernel.org/r/20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org

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
 drivers/mfd/sec-irq.c            | 64 ++++++++++++++++++----------------------
 drivers/rtc/rtc-s5m.c            | 21 +++++--------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 71 insertions(+), 62 deletions(-)
---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


