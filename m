Return-Path: <linux-rtc+bounces-2763-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 521449FC811
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Dec 2024 06:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E402D162718
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Dec 2024 05:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992E114D2A7;
	Thu, 26 Dec 2024 05:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="ptsMgJ2H"
X-Original-To: linux-rtc@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44A7711F
	for <linux-rtc@vger.kernel.org>; Thu, 26 Dec 2024 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735189716; cv=none; b=bZh8Hy1fwi2+nQKVNI41GtWAl/5hLjXMfHrjUyqv6NvUZRnXcE+v5Xv9KRiUrCaSccS/u/j8ShdytqXkBUiUmUq7pnSxIL70//haIxfbPBvGQigDrLFo5+dNvLUQgO5jI1jokuZtzhTRK3IAKghCxoM+fSDekaPkRZnOHsLt5Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735189716; c=relaxed/simple;
	bh=3pqWiSOia8Cc3ev7ia/z6zK39Ju/1V3A0Lfr4mMekmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHvkgx8SNbfEfbyxTwJ5xh53xjLwjIaXz9UOv4+FU6vwrJCPYy8zfzinO19SUHbUMMvOeLlrE7oJvAbPurpyhzGfGt3E1UmRVRGWz9osz+0522bNXDIDJf69iYcf/nJNeZhXOJaL/lZsAJ6DbkO7vq5EIhi4K7N26oaF3arh78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=ptsMgJ2H; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735189711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1+Pw0Duk2ffkzOZeLZ/8MRbYDhOihMi4oOjlzS/3yps=;
	b=ptsMgJ2H46eD27TfaBfqI+4cUOz5vLA6QzK/27mp8ADqFsZ1CmUslrIWbwKt3H932VxT28
	nDTIQTyD7SxYjuA/ll7SgJQUWXkitKKx30BvmlAhWnCv+iGu4eQc8unN2ChI1NQVi2BWfh
	uTHNc2e3Ezvd+JHJeVb/XSwIcxMQPhXR16MaK1umzxtDAUDgtz3kuZIpVWJ/fqFd+ZYur5
	83RMZiPrCdSHsFlajpnAqfBrUKCsYGkr3Lj0uk5kgyCs3XKLyblKce8dqyoCXMJtRjgsVm
	1SPx6owqt5PeQmpOTNlFXBis5hwywfH2i8iwNYnf28S7Jg2DOoiM9/J7fcOTUQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 0/9] mt6397: Add support for the MT6392 PMIC
Date: Thu, 26 Dec 2024 01:58:00 -0300
Message-ID: <20241226050205.30241-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The MediaTek MT6392 PMIC is usually found on devices powered by
the MT8516/MT8167 SoC, and is yet another MT6397 variant.

This series is mostly based around patches submitted a couple
years ago by Fabien Parent and not merged, and includes extra
cleanups, fixes, and a new dtsi file similar to ones that exist
for other PMICs.

This series only enables three functions: regulators, keys, and RTC.
All that was tested on a lenovo,tb7304f tablet (basic DTS coming
right after this, promise).

Fabien Parent (5):
  dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
  dt-bindings: regulator: add support for MT6392
  dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
  mfd: mt6397: Add support for MT6392 pmic
  regulator: mt6392: Add support for MT6392 regulator

Val Packett (4):
  soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
  input: keyboard: mtk-pmic-keys: add MT6392 support
  rtc: mt6397: add compatible for MT6392 PMIC
  arm64: dts: mt6392: add mt6392 PMIC dtsi

 .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
 .../bindings/mfd/mediatek,mt6397.yaml         |   3 +
 arch/arm64/boot/dts/mediatek/mt6392.dtsi      | 232 +++++++++
 drivers/input/keyboard/mtk-pmic-keys.c        |  15 +
 drivers/mfd/mt6397-core.c                     |  43 ++
 drivers/mfd/mt6397-irq.c                      |   8 +
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/mt6392-regulator.c          | 484 +++++++++++++++++
 drivers/rtc/rtc-mt6397.c                      |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          |   1 +
 include/linux/mfd/mt6392/core.h               |  42 ++
 include/linux/mfd/mt6392/registers.h          | 487 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   1 +
 include/linux/regulator/mt6392-regulator.h    |  40 ++
 15 files changed, 1368 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
 create mode 100644 drivers/regulator/mt6392-regulator.c
 create mode 100644 include/linux/mfd/mt6392/core.h
 create mode 100644 include/linux/mfd/mt6392/registers.h
 create mode 100644 include/linux/regulator/mt6392-regulator.h

-- 
2.47.1


