Return-Path: <linux-rtc+bounces-4232-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34606ACECBF
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Jun 2025 11:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4EF53AB411
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Jun 2025 09:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B35C2063FD;
	Thu,  5 Jun 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eSn7E3NM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D86566A;
	Thu,  5 Jun 2025 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115446; cv=none; b=ax6h6LvisgFTyEQo7ZaCE/GPv34Of46LT0keXx7Vwtd62RO2GGHJ+WQGuDP7rAnoQ7dz1D0MCJ/FhJAtegKoqmWIeq/bByp3Q33kanoa2ZtkOn4/6QnmPCbFi7gOAanKBjm4G6/BwRpoc+YuRmOJlVqB2jkoB7Ga0J1LRk3PJ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115446; c=relaxed/simple;
	bh=BiRN5nBnZIp/sJcuRCoUB4GHMYYC58pEDXWvQczJNsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s+b7xWAuOppDVoVDkjtXx0G1478YC0Q2POTKvk5txdXPxeYqPV8HVoZDq23NwJoKnBvbAnCj6YEQLAKpmMQ0WR3822Ac31cIjz347n2uDlphBjVJ6aeiYwZhs8kLg9H9iZmR6cIRlPEfzm2u5VV/+9Yo8FZaYUL/BzgDiBXzyU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eSn7E3NM; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C00F43ACE;
	Thu,  5 Jun 2025 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749115442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hMtQCtS8IpJTkp97fNAgEE15+YSM+ATUwrgLcxt4Rdk=;
	b=eSn7E3NM2/a1XL2QCHZ51w/xSFAL+iEZEQboby9jHTs+K7Nvdupz/F7tlxFjA4SZ0+t6Yk
	IaS1HH4qimcQlrUnTscjr8wXLrDa5llZxxO/uhnsiEMZP/+GB8UnaOmTI/JUhnwlH3boNe
	e6EugCFOKAu+aLoZCV685Ow7tj908BPs7BIycS44sR/0FFSmiaSGv7TztQiVgAmhCmMRZ4
	upJ/cQU5kcDPefZJCzPEaXHwRb+M0/uwBsWnKLWQt7bdczxgCObraYqlVcLhTt4Aac/9kv
	Ul5XZNYHabuX/WaaO+gt8hbFbOX7Do55Ol4WHd8Q2wgmWMdKFAaln7JfUSgHjA==
Date: Thu, 5 Jun 2025 11:24:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.16
Message-ID: <202506050924004af15615@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefgeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggugfesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueffgfdvhefggefgieehffeikefhfeffudelvdetheffheefffelhfelgefhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.16. There are two new drivers this
cycle. There is also support for a negative offset for RTCs that have been
shipped with a date set using an epoch that is before 1970. This unfortunately
happens with some products that ship with a vendor kernel and an out of tree
driver.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16

for you to fetch changes up to 3d8b44b104fb5f93a853ae34fbcf8d840e4482f5:

  rtc: mt6359: Add mt6357 support (2025-06-02 00:25:32 +0200)

----------------------------------------------------------------
RTC for 6.16

Core:
 - support negative offsets for RTCs that have shipped with an epoch earlier
   than 1970

New drivers:
 - NXP S32G2/S32G3
 - Sophgo CV1800

Drivers:
 - loongson: fix missing alarm notifications for ACPI
 - m41t80: kickstart ocillator upon failure
 - mt6359: mt6357 support
 - pcf8563: fix wrong alarm register
 - sh: cleanups

----------------------------------------------------------------
A. Niyas Ahamed Mydeen (1):
      rtc: m41t80: kickstart ocillator upon failure

Alexandre Belloni (2):
      rtc: interface: silence KMSAN warning
      rtc: m41t80: reduce verbosity

Alexandre Mergnat (3):
      rtc: Make rtc_time64_to_tm() support dates before 1970
      rtc: Fix offset calculation for .start_secs < 0
      rtc: mt6359: Add mt6357 support

Ciprian Marian Costea (2):
      dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
      rtc: s32g: add NXP S32G2/S32G3 SoC support

Jingbao Qiu (1):
      rtc: sophgo: add rtc support for Sophgo CV1800 SoC

Johan Hovold (9):
      dt-bindings: rtc: qcom-pm8xxx: add uefi-variable offset
      rtc: pm8xxx: fix uefi offset lookup
      rtc: at91rm9200: drop unused module alias
      rtc: cpcap: drop unused module alias
      rtc: da9063: drop unused module alias
      rtc: jz4740: drop unused module alias
      rtc: pm8xxx: drop unused module alias
      rtc: s3c: drop unused module alias
      rtc: stm32: drop unused module alias

Krzysztof Kozlowski (1):
      rtc: amlogic: Do not enable by default during compile testing

Liu Dalin (1):
      rtc: loongson: Add missing alarm notifications for ACPI RTC events

Ryan Wanner (2):
      dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
      dt-bindings: at91rm9260-rtt: add microchip,sama7d65-rtt

Troy Mitchell (1):
      rtc: pcf8563: fix wrong alarm register

Uwe Kleine-König (3):
      rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
      rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
      rtc: test: Test date conversion for dates starting in 1900

Wolfram Sang (13):
      rtc: sh: assign correct interrupts with DT
      rtc: sh: remove update interrupt handling
      rtc: sh: only disable carry interrupts in probe()
      rtc: sh: remove periodic interrupt handling
      rtc: sh: simplify irq setup after refactoring
      rtc: sh: remove useless wrapper function
      rtc: sh: use local variables in probe() for mapping IO
      rtc: sh: minor fixes to adhere to coding style
      rtc: rzn1: clear interrupts on remove
      rtc: da9063: simplify irq management
      dt-bindings: rtc: rzn1: add optional second clock
      rtc: rzn1: Disable controller before initialization
      rtc: rzn1: support input frequencies other than 32768Hz

 .../bindings/rtc/atmel,at91rm9200-rtc.yaml         |   4 +-
 .../bindings/rtc/atmel,at91sam9260-rtt.yaml        |   1 +
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml      |  72 ++++
 .../devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml   |   6 +
 .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml  |   8 +-
 drivers/rtc/Kconfig                                |  25 +-
 drivers/rtc/Makefile                               |   2 +
 drivers/rtc/class.c                                |   2 +-
 drivers/rtc/interface.c                            |   2 +-
 drivers/rtc/lib.c                                  |  24 +-
 drivers/rtc/lib_test.c                             |  27 +-
 drivers/rtc/rtc-at91rm9200.c                       |   1 -
 drivers/rtc/rtc-cpcap.c                            |   1 -
 drivers/rtc/rtc-cv1800.c                           | 218 ++++++++++++
 drivers/rtc/rtc-da9063.c                           |  31 +-
 drivers/rtc/rtc-jz4740.c                           |   1 -
 drivers/rtc/rtc-loongson.c                         |   8 +
 drivers/rtc/rtc-m41t80.c                           |  78 +++--
 drivers/rtc/rtc-mt6397.c                           |   1 +
 drivers/rtc/rtc-pcf8563.c                          |   2 +-
 drivers/rtc/rtc-pm8xxx.c                           |  18 +-
 drivers/rtc/rtc-rzn1.c                             |  71 +++-
 drivers/rtc/rtc-s32g.c                             | 385 +++++++++++++++++++++
 drivers/rtc/rtc-s3c.c                              |   1 -
 drivers/rtc/rtc-sh.c                               | 285 +++------------
 drivers/rtc/rtc-stm32.c                            |   1 -
 26 files changed, 946 insertions(+), 329 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800.c
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

