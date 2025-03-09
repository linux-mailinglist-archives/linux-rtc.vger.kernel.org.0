Return-Path: <linux-rtc+bounces-3437-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7258A58821
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 21:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AE553AA39F
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Mar 2025 20:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0207121A447;
	Sun,  9 Mar 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaEiATXQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E840160783;
	Sun,  9 Mar 2025 20:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741552006; cv=none; b=BmXCE8XpHFz9iN5KByoyQgz4qP/Mp7R6BzdRpxLlliIXk+GShn+SIy+3+gT8ESBMR6O5tgOwGPWlGwnwMAddJ6KQvaJPWjDII05wTYthm3pbyLl2Bv9cCiPiXU+IW2JxHpyQst+TH5JZDQzRyr58Xi3y7gz2MjFGPcEMYPjaLQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741552006; c=relaxed/simple;
	bh=e6f6FwB8+Da+oeApsP7aXsV/7WbfX1lqQUheMaHmi8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pW2Xkxxt0NG76q8kPwYeM8/0caICbhCByUSx63mEPlbKn2qf8QRsueqywRTsfIcH3iumEa7gOU5NgGAPT4OHnqC786iq0h8aVxPQ0uaGUjQN43+hdETeFyk7foqHNj9yaD2MBan03xHWYGsTa+8DMkWvRmRSPaUG5K+c1M2G33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaEiATXQ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4392713a12.1;
        Sun, 09 Mar 2025 13:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741552002; x=1742156802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liw16b1KD23GiAUtAaqgKFYJsvip4lft0wm9l86PGN4=;
        b=EaEiATXQgsq0g/Vsml7iFRMVLoeWINVOeyjzT0WrzHBgtJKgH/NjG1tJY9lXO95QPh
         1DGvviv05PYj9cU6eeSxH6Dd1jtkko01IYF7VYRRKbPahlSsLFUMoyLJ9lfdGucloYd/
         lu+40iZvvikNlt4OiJw7jV0BzHnW0cb5wLwLGgOMLsfT6kVpjlXq2Zz3uVEhELfag8BJ
         jZJgC/AFCAVKlvD8iLu2WzWWpKh3cyDJ8Nv1eA2mq0K6442VKW73Qzt5SaVD0c8mXh+i
         tpQduWR8J3P18rp4hpM+LRnhuPjjU9C8Y6WMusg8Kujrtnz5RyR/AMoJxF/Jkwqv9pK4
         wc7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741552002; x=1742156802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liw16b1KD23GiAUtAaqgKFYJsvip4lft0wm9l86PGN4=;
        b=J0QpKWk7HLjbj8BWSqU22P14WEBnBMKGc0WX2ybvTcVk0nu6ibLUu4Q2GGAtzwYzfB
         nDzcvzZNStk+2omd8qcSKtO/CF2/8chQc2C4x6AaH4PO89MttHy88zj0A1FexyjxSu+H
         HW2NUCDakASw53bppsYMBsxtXAxEXM+QH4MfmzKDqVbiPwOejYHinSLMb/+oRJs+OZkT
         XtgKA0Q56K2E9lZ9bpHLXIOWSCIPwjNRv+/x00cWumHypqAnuc1OlTkg7UrkgJ9BUHLB
         UDE5LMQdJio51UTbw18aJCRh6yojsCATj/0+fXS/lIP8K6pmofnO0Kla/hUElUUplV/A
         HB+g==
X-Forwarded-Encrypted: i=1; AJvYcCXYwAjirYO0/erplF9OSG55cob30VYlaBgT5uzTB7v5ii2rnmEsLnEfZkEqyC823ASu51c7iYkCeMPb5XxK@vger.kernel.org, AJvYcCXu7KcwrYojfpYE/pXL6SYsnjAJUpjPHDcLCe5yXUJJfdVzb4CjV5++1rEUI4rScnNtWX23Af0HOZDv@vger.kernel.org, AJvYcCXxzaqYyau02eJ1warnRvrBeURJZSOTirIlLrsnhknDdNquJcuJZzTE6LYAT6s/91d1riOPUvplQZyg@vger.kernel.org
X-Gm-Message-State: AOJu0YwKxmUGGJlA8He+8bWGVmS+K1KHQP4kIWndkdIoepkUC7Eiiej0
	bKHzHzbX7zuvDSRe3ZmQchfQgLNiTDMc8yUritsJ+7zQYIgo2za1
X-Gm-Gg: ASbGncvjR2mN7lRDbXj8EqQecNT93wzGPqNqlrYnGG610QcNQ2zL7pRgEuOVl3XDG69
	WfvycFCXXLVTw7JEcjkchtOndeQKPzcdjbOPSFhq/duemG4Q/AklX4W4qR7wQvf2oZOnC11puVT
	bWUWwMcD1Rs8u7RkPlyiKjaNlIaAOLNiKvNp+34o0AUZrNfTn0rWtmnvg3spf32Fb7UDr8DOW/A
	ohxkpI50PmUTuDEzS0Rgm7WHUN/Sxu151+p5lowgH2kcM7nNMAt78ZY7h75iqjI1U/3OuDY4ctb
	3cR30J3Pxy3KgAFuzXst0LfZDSITxOo8F4GSshPw8kjXUD2g9deyBHDn0w==
X-Google-Smtp-Source: AGHT+IECkRLoAD9m1S2lkKo+odvYuBgwUnE/shsxtqNAyxitlMH9qJO8yNmfUhNDUN5Avy1Oh54QSQ==
X-Received: by 2002:a17:906:d283:b0:ac2:7dee:cb15 with SMTP id a640c23a62f3a-ac27deed088mr571861866b.33.1741552002053;
        Sun, 09 Mar 2025 13:26:42 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27c7e29bbsm281833966b.92.2025.03.09.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 13:26:41 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangyu Chen <cyy@cyyself.name>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 0/3] rtc: sophgo: add rtc support for CV1800
Date: Sun,  9 Mar 2025 21:26:22 +0100
Message-ID: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Real Time Clock (RTC) is an independently powered module within the chip,
which includes a 32KHz oscillator and a Power On Reset/POR submodule. It
can be used for time display and timed alarm generation.

This series aims to provide complete DT bindings, but the drivers are only
focusing on RTC implementation. Possible Power Management and remoteproc
can be implemented later (hence the RTC driver is using syscon, because
MMIO space is really interleaved among different functions).

Series is tested on Milk-V Duo Module 01 EVB (SG2000 SoC).

Changes since v12:
- Moved bindings and stub driver from MFD into SOC subsystem

Changes since v11:
- dropped restart handling (will be implemented in PSCI)
- split RTC driver into MFD stub and a platform RTC driver
- dropped Reviewed-by: Krzysztof Kozlowski from bindings, they've got a
  rework
- changed bindings maintainer from Jingbao Qiu <qiujingbao.dlmu@gmail.com>
  to sophgo@lists.linux.dev
- added link to TRM into bindings description
- bindings: mentioned 8051 core in the description
- bindings are now MFD, not RTC
- bindings: added "syscon" compatible
- bindings: added "interrupt-names", "clock-names" (because of added
  PM/remoteproc)
- bindings: main compatible "sophgo,cv1800-rtc" -> "sophgo,cv1800b-rtc"
- new patch "mfd: sophgo: cv1800: rtcsys: New driver (handling RTC only)"
- added both MFD and RTC drivers into MAINTAINERS file (N: K: entries
  didn't apply)
- RTC: depends on cv1800-rtcsys MFD driver
- RTC: use syscon for regmap
- RTC: get named clock from parent MFD
Changes since v10:
- only start RTC on set_time;
Changes since v9:
- further simplified bitmask macros;
- unconditional RTC start (rtc_enable_sec_counter()), otherwise
didn't start on SG2000;
- dropped ANA_CALIB modification (has been forgotten in v8 with
the drop of SW calibration to switch to HW calibration);
- successfully tested on SG2000;

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
  soc: sophgo: cv1800: rtcsys: New driver (handling RTC only)

Jingbao Qiu (2):
  dt-bindings: soc: sophgo: add RTC support for Sophgo CV1800 series
  rtc: sophgo: add rtc support for Sophgo CV1800 SoC

 .../soc/sophgo/sophgo,cv1800b-rtc.yaml        |  86 +++++++
 MAINTAINERS                                   |   2 +
 drivers/rtc/Kconfig                           |  12 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800.c                      | 218 ++++++++++++++++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/sophgo/Kconfig                    |  24 ++
 drivers/soc/sophgo/Makefile                   |   3 +
 drivers/soc/sophgo/cv1800-rtcsys.c            |  63 +++++
 10 files changed, 411 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c
 create mode 100644 drivers/soc/sophgo/Kconfig
 create mode 100644 drivers/soc/sophgo/Makefile
 create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c

-- 
2.48.1


