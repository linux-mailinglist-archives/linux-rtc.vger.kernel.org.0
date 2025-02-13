Return-Path: <linux-rtc+bounces-3193-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A489A350BF
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 22:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983A03A73E1
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Feb 2025 21:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D023269822;
	Thu, 13 Feb 2025 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhLnIRMg"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37611245AF6;
	Thu, 13 Feb 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739483826; cv=none; b=i2yogb/rTWnpLlOsEfSbRR+VJ1rWWAYlHb+pWPcIdbB924YmMpOLD1t67CD0YJx02shr27JuJ8dBbfywjSNWlbWbTBYJ1x4LcoXTI/saBuOQdUfJBBVZ01PqGeRzRyzaR1/zpXOcOAgTxFccwUZT5esI1MneoCBwy2eZMXwQblE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739483826; c=relaxed/simple;
	bh=fgj0shuMufr7wTndkCWRL/JXLBXmF7UOuG9EsBz7HPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZV0YGW37zCZziFJJgjN3/e/wWPOGsM7KnZeAYFIVt5sB6q33y8SLT51daHuzRpQwGQ6LJZcRyZLq4kCul0p6P9F+lmDrUU0yQXPbs6GO02p3bFR1HWy7/fBE+UKkgzEmh54RUbhWJq75WHU2L2zagVfqPfJRM7GACmu9noGKtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhLnIRMg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso2778675a12.0;
        Thu, 13 Feb 2025 13:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483822; x=1740088622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+t6B+jgVmtMaFtzPH7+S0a4yoIONQBzjfTCZovjoAU=;
        b=FhLnIRMgFCvsC3YSZxm7282Z9SZDKvsO1ESnWXY6aZFFAS7gOZsfXo2drxNrYmCPkT
         Fg4UeqPt/0vxJG/WPWBTLhZgt8EzytcaNsrP6mUrrmG4VfLNGI7fkrMrnK/LpwfheEFw
         165vKggyC+CQncfqZFpZpF0hVZj4vHXU7zzjrCtuxObDIqRN93k3YJn5oLhsKV2kJKRG
         SX8EhMnwyeSJ4bJztWgLtkc3zCoLLz91HfeFGCF60Rn2F94+8aPW1Wm/wsyUyJbWYsCC
         E4H0LJx7FQHYwS/Hn4xWEXNGFU3sgbwdaPsuBhAicsFKXm3sRHTEYwFCrp8p60QTcsG/
         MQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483822; x=1740088622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+t6B+jgVmtMaFtzPH7+S0a4yoIONQBzjfTCZovjoAU=;
        b=Wm2QecY7EZbFqp3+jAPfsXWJ0MjzXOH8y1wH6pGR0yabo3X0zjZ2jlJfaJQP4nH/z3
         ZqJIGgSUUZAm8tpAUWMIwaL/uqkyGYJIqDqYN5wiqaOqDMZ7MOWjgmnfQ+2wefyvB2vk
         LrMP3+Lml7t8zgXe7gov/fWZRbRvZjMUWKCbmFkT7nGtyIqzcPE3T+KwpUmqLIMLf6h2
         FAtigZwEXvlpMs+b3P67o7gFFnjDeCTzO2MZNTZwdYK/3wnEU0c1YxSuXAMy97I9lJst
         C95jzrSESlD6X+d52b9D7dw9faMQi5DvYyorXjNRS/Odz2noI1mBs358zwlaImot4MG2
         FLww==
X-Forwarded-Encrypted: i=1; AJvYcCV7LVGWTFy3c/Egd1ZLzFeH6u7bBJ/deGu8pPgT9fssleOa3zXlbuCi5qkIDN8pk5cBteaPD10Q41bg@vger.kernel.org, AJvYcCX+Q1haAbrMqqlCERb5S/eP4PCg48qGR4iwWQFI6tBubkd809iQPWvhMjnIzBRc4+74sHN5V4PNcv0H0ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RwDuepbA6W3q6oqlhMPUpQYjK0Bv3GUyxzcvSp13bucxI+0w
	DFsOiLBjaMKRUCAqUN9OKVSY/2FRgVWK20kiQZUWR/zQQnlRiwzr+5z8tmwV
X-Gm-Gg: ASbGncuffG3B0aukvbrpWU2Us2nC20nLLDCSgQ0b2QqObE4+3ebUe83tsq+1JvAGp0d
	SmrXdlgcQfTnbpbyEJYs/Sf/s/p+jaFBVhWw0R9qifUIYi9Q4+40NQgI6IrWbU5ZobT9GheKrCB
	T11kZL9CX0RXg00ERIolOZy7QFjfHILaAzDiwmVe9slt6b68Jdk23R/bgYyuuGJKzjGi5oLL/6q
	vv26eCZfe5PomlnOF+SxRakc7ZXmi0husZ9rn/5OrGGgV1RzNzlAgC+wybUt2UNkLUgozkD3E/o
	+WKproDSb5GBf5CrIFvgXmoQPF1r
X-Google-Smtp-Source: AGHT+IFbUWokaBSyVOOLzgLUlMVYFf5zz41axl3e6IJ6OWk1r3JOQRJ5oLgxY2Nm8yuJxa4uuyLdiQ==
X-Received: by 2002:a17:906:dc91:b0:ab7:c4db:a044 with SMTP id a640c23a62f3a-ab7f3714983mr925567766b.8.1739483822129;
        Thu, 13 Feb 2025 13:57:02 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:01 -0800 (PST)
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
Subject: [PATCH v11 0/3] riscv: rtc: sophgo: add rtc support for CV1800
Date: Thu, 13 Feb 2025 22:56:44 +0100
Message-ID: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
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

Changes since v10:
- only start RTC on set_time;
- add machine restart handler (as separate patch 3/3);

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

Alexander Sverdlin (1):
  rtc: sophgo: cv18xx: Add restart handler

Jingbao Qiu (2):
  dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../bindings/rtc/sophgo,cv1800-rtc.yaml       |  53 ++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 277 ++++++++++++++++++
 4 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c

-- 
2.48.1


