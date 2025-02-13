Return-Path: <linux-rtc+bounces-3188-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0D6A34DF2
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 19:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B3457A1FC3
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 18:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5CC24A053;
	Thu, 13 Feb 2025 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3eYG3Wx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF89245B1F;
	Thu, 13 Feb 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739472389; cv=none; b=JQwdzg8P5xaeO/v0whrAzxbj8IN9WWkvp7XPm/Lkx5jk9acqlWv6/sCFQ4ETRINmUvt3UDR4N2EgdUe4sRIsl0k59Dr/CLOCb9LRC6dJVFoK+WHLp/NkVTyHyBq49ctw5CsKrD/9ORiPM6Q9sjBZDpANastlw5q8EHnUel8CaBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739472389; c=relaxed/simple;
	bh=amTtrLAurKKgY2OMwf2io9Cjutnt1tzgel0rAC7bkOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XXs0SRgiBN7eXX1CF4cC137g2RVNUEN2H65+oG6DNpweCX1Q3yH4t4xPwSZM8BnC9Ne+RrOfzdPazf8FneBpqhqiRwCuLngBQtKXWNn1vhlE9Qd9Mbg/scFqCDzyQMyiZVdloS8GC+KjCSmPmkMPENeBSaRgCTycTC4shA2as8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3eYG3Wx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so203295866b.2;
        Thu, 13 Feb 2025 10:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739472386; x=1740077186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aukWBb3CU/4AhOxfmtAmwLpbw3wl3GfTDAoU9wk32Bk=;
        b=l3eYG3WxKSMAlBB+FlpaJnDTLtjR5NP9kAeFkYTIR1ku2w+BuIGF38+/mGtpXwxvhf
         rp9ibbYr8x3QnL9JQZUwCBxlfndXu0K20AO4lsR0E0x02gBBqh3uQ7QHq22q2EWe4qNc
         5GKnTRLnAXgJpVXMfS8QBV7chnRz9TzZJZVKBx4wvrtzuelS+zoD7vrrKptsWJRuX9Rr
         vsyboIZ95Apm69GilyFmKsPjJcB9Lp3vU1PWaGY7afXJkgEB68MRZOwm8jLye9MAISrp
         Q8X/KGEtMgzDXs6kzjONN8hLdBIsU1zSkkxpS4Uod8byPXqGC/+2xQzA1LY2B9/mvegI
         UGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739472386; x=1740077186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aukWBb3CU/4AhOxfmtAmwLpbw3wl3GfTDAoU9wk32Bk=;
        b=Rjds519po0GH0wJJCz0BE9HeXppkW0T9y63/A7BSO8G9EfjspO2zsaVjwcGbsgskml
         LkKxqY0CER7RU/GUIQEMRxWlKZoJ3dMp/VySQgF+BRuKi9sXiX1wEdxEfhnD8Q9TvHwv
         idSUXEhaH2ijalhurcPuIgsj1adu0xcBo4aGpc4c6FRpJmyecjIx/oDYeHFCLvTL60yR
         6Ff1Wi92wyzAx1Dfh2IMaTiJmd5UmR3VYyP7vOhcj4mrEVQlVYTENAn5FULfSF+4ZUVW
         JfVnApv7MTiNFA/MLTBGeBIV19LTXpeaEThyx26uxgPVE4iSaHxmMQ32HPavnK/SotAI
         UqBA==
X-Forwarded-Encrypted: i=1; AJvYcCVKt4XKwTeeq03xrIrNlwGva+dFLXhkvHKzBjWBFvMmGBJTuTp6P54cqXoDvEjXbz/IVMsfLAVNfaggFgA=@vger.kernel.org, AJvYcCVPYWultxBOQT0GBk7q3u7fK1r9t4sFL4/gBvR/zs6IwMjXEdf/K8vbl0iYfwtj/WZjfnogcQPwNGry@vger.kernel.org
X-Gm-Message-State: AOJu0YyLYRFJ2PBlkgVemKCQHbHEU+7MsMvq0vcwUZExbjD60MZeTuev
	x5oC42okCjFTaDYvsa8nzE0aXnuwCySZMKvFuphiDa0Dxo/GHdzhdeX9iJKD
X-Gm-Gg: ASbGnctpcKCR2isPm307fuWIxpSsSnOom1Z+n9RujQURm5Jzz+gSKftA8SC9rOw1741
	gFuZcAxS6eO0BdqjBTWO14tJ9ItbvEcITPMKSSGFKw+wpI0OG5VkuTy/S9uLUrJ/sZ0Eplf9Si9
	qYhozdw7hcyqFi36/VjkmCmrUMNYiLutPEq1+LJdAU6xcDz0WLHj5EDNOqrbSD26wiz1LveRZ2j
	WafdAp6WXO+84M2JSuhbwYF77kjjk6MwZOt2W/5CEXsQdRJQXgEr6YwYUBzhm/ILDd1Bc0VInTG
	+KGFBde/cVYoIpShfex5u0r0yJnI
X-Google-Smtp-Source: AGHT+IFLxTwk4ShOCgoBhzCNNIaUWJTERo/NRFQCgSQeLdKFCXmw2TOixkwTdZg2oz22qRZqY5E3Vw==
X-Received: by 2002:a17:907:da5:b0:ab7:dec1:b34d with SMTP id a640c23a62f3a-ab7f34ac9c2mr820599666b.47.1739472385487;
        Thu, 13 Feb 2025 10:46:25 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba533998e2sm181360466b.134.2025.02.13.10.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:46:25 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 0/2] riscv: rtc: sophgo: add rtc support for CV1800
Date: Thu, 13 Feb 2025 19:46:13 +0100
Message-ID: <20250213184622.2099324-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Real Time Clock (RTC) is an independently powered module
within the chip, which includes a 32KHz oscillator and
a Power On Reset/POR submodule. It can be used for time
display and timed alarm generation.

Changes since v9:
- picked up orphaned series;
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter());
- dropped ANA_CALIB modification;
- successfully tested on SG2000;

v9: https://lore.kernel.org/linux-riscv/20240428060848.706573-1-qiujingbao.dlmu@gmail.com/

Changes since v8:
- delete unused macros
- using 0/1 instead of the DISABLE/ENABLE macro
- pass in the correct pointer when applying for IRQ
- convert the incoming pointer into an appropriate
  structure pointer in the irq handler

v8: https://lore.kernel.org/all/20240204044143.415915-1-qiujingbao.dlmu@gmail.com/

Changes since v7:
- pass checkpatch.pl --strict
- using u32 replace uint32
- using devm_kzalloc(*) replace
  devm_kzalloc(sizeof())
- sort header files alphabetically
- delete unnecessary header files
- fix wrap error
- drop dependent description
- using hardware automatic calibration replace
  software calibration. see documentation 197 page

v7: https://lore.kernel.org/all/20240122080500.2621-1-qiujingbao.dlmu@gmail.com/
documentation: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf

Changes since v6:
- completely delete POR dt node
- remove syscon tag
- use devm_regmap_init_mmio() replace
  syscon_node_to_regmap

v6: https://lore.kernel.org/all/20240115160600.5444-1-qiujingbao.dlmu@gmail.com/

Changes since v5:
- remove unnecessary lock
- fix cv1800_rtc_alarm_irq_enable()
- remove duplicate checks
- using alrm->enabled instead of unconditionally
  enabling
- remove disable alarms on probe
- using rtc_update_irq() replace mess of alarm
- remove leak clk
- useing devm_rtc_allocate_device() and
  devm_rtc_register_device() instead old way
- add judgment for rtc_enable_sec_counter()
- add POR nodes in DTS. This POR device shares
  the register region with the RTC device

v5: https://lore.kernel.org/all/20240108072253.30183-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- remove POR dt-bindings because it empty
- remove MFD dt-bindings because SoC does
  not have MFDs
- add syscon attribute to share registers
  with POR

v4: https://lore.kernel.org/all/20231229090643.116575-1-qiujingbao.dlmu@gmail.com/

Changes since v3:
- temporarily not submitting RTC driver code
  waiting for communication with IC designer
- add MFD dt-bindings
- add POR dt-bindings

v3: https://lore.kernel.org/all/20231226100431.331616-1-qiujingbao.dlmu@gmail.com/

Changes since v2:
- add mfd support for CV1800
- add rtc to mfd
- using regmap replace iomap
- merge register address in dts

v2: https://lore.kernel.org/lkml/20231217110952.78784-1-qiujingbao.dlmu@gmail.com/

Changes since v1
- fix duplicate names in subject
- using RTC replace RTC controller
- improve the properties of dt-bindings
- using `unevaluatedProperties` replace `additionalProperties`
- dt-bindings passed the test
- using `devm_platform_ioremap_resource()` replace
  `platform_get_resource()` and `devm_ioremap_resource()`
- fix random order of the code
- fix wrong wrapping of the `devm_request_irq()` and map the flag with dts
- using devm_clk_get_enabled replace `devm_clk_get()` and
  `clk_prepare_enable()`
- fix return style
- add rtc clock calibration function
- use spinlock when write register on read/set time

v1: https://lore.kernel.org/lkml/20231121094642.2973795-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 +++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 223 ++++++++++++++++++
 4 files changed, 287 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1


