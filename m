Return-Path: <linux-rtc+bounces-4638-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDE1B19A52
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 05:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850111701F2
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 03:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A85784A35;
	Mon,  4 Aug 2025 03:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yde1X/Np"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455A4C8F;
	Mon,  4 Aug 2025 03:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754276468; cv=none; b=jfgHdf3970/EM43RDuR8L5e/XNt4g0WyfZ0cfBXNOxSbJWhKBuvY1HjL5xZfuC5y4mb9/7iIZCWvOZrGBXc2k0s/enrOrA5X1auSmjw+YUTMwSyTTQim7VNzv7uG0IN+p9jjw8glphUsFlww6ExCof3ACuXtKVfy8lCq6adpmwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754276468; c=relaxed/simple;
	bh=KbXuGp+o3iQV1KR2nynvGwT1ah0FjEzcmCIzypka7Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TO6s1C/zSWIZ/1ipkkdx4yF07Z1itvZB3zYyJ7VRXTz9jLLutPXBFnPFIzBFNUMDDajxGxd3u/SrVwsPKb3Bj+u5GKcaKG2tfWZYiBWPKRyUrShNMKLu2NSnUwvRfoXjp46nfe4gUcm5Wg71PoAl4fen1Z9G4QbPhEm5sOPTtok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yde1X/Np; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 611CD41D02;
	Mon,  4 Aug 2025 03:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754276454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XuoBJZWqqGbWfAbO/dHUfksA0fqwsbTP5ag7248b4Ck=;
	b=Yde1X/NpBQfMgIO33WbsyH41HKsO3qPnPm8anpU7EfchFJ1cTCWx0sV3i1y1sCwSOiOEN0
	XNIOC6LK1Q89ic9oAxAFk6vnuKV4sreSd62mn4exiQMrrg7wU2v9VSuUOPNI/BBw1vB/H+
	DAvC7L8iR2QVxeJ2ittX0/Ho6xBCdU419wULr1x9FWDNLzKtYRT3loohzeNAIa9wCqvd68
	7eHfOEWLlLvj3oLwE40tmJD3NdneJvvaWCZKOJazOPEw0XxqJnfopZxtCmoO+5BIcP0LK5
	X5VDQ9LwcQ6qoxcSSMnCgNWEDmedbHw9zvb6Tw3h/rohgP/n2FdTAMr9mbSA6g==
Date: Mon, 4 Aug 2025 05:00:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.17
Message-ID: <20250804030054453a11b9@mail.local>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggugfesthekredttddtudenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueffgfdvhefggefgieehffeikefhfeffudelvdetheffheefffelhfelgefhkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhhttgesvhhgvghrrdhkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.17. This time, we get
support for a new RTC in an existing driver and all the drivers exposing
clocks using the common clock framework have been converted to
determine_rate().

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.17

for you to fetch changes up to bb5b0b4317c9516bdc5e9a4235e3b5f1a73b7e48:

  rtc: ds1685: Update Joshua Kinard's email address. (2025-08-03 03:28:52 +0200)

----------------------------------------------------------------
RTC for 6.17

Subsystem:
 - Convert drivers exposing a clock from round_rate() to determine_rate()

Drivers:
 - ds1307: oscillator stop flag handling for ds1341
 - pcf85063: add support for RV8063

----------------------------------------------------------------
Alexander Shiyan (1):
      rtc: m41t80: remove HT feature for m41t65

Alexandre Belloni (1):
      rtc: pcf85063: scope pcf85063_config structures

Andy Shevchenko (3):
      rtc: sysfs: Use sysfs_emit() to instead of s*printf()
      rtc: sysfs: Bail out earlier if no new groups provided
      rtc: sysfs: use __ATTRIBUTE_GROUPS()

Antoni Pokusinski (3):
      dt-bindings: rtc: pcf85063: add binding for RV8063
      rtc: pcf85063: create pcf85063_i2c_probe
      rtc: pcf85063: add support for RV8063

Brian Masney (15):
      rtc: ds1307: fix incorrect maximum clock rate handling
      rtc: hym8563: fix incorrect maximum clock rate handling
      rtc: nct3018y: fix incorrect maximum clock rate handling
      rtc: pcf85063: fix incorrect maximum clock rate handling
      rtc: pcf8563: fix incorrect maximum clock rate handling
      rtc: rv3028: fix incorrect maximum clock rate handling
      rtc: ds1307: convert from round_rate() to determine_rate()
      rtc: hym8563: convert from round_rate() to determine_rate()
      rtc: m41t80: convert from round_rate() to determine_rate()
      rtc: max31335: convert from round_rate() to determine_rate()
      rtc: nct3018y: convert from round_rate() to determine_rate()
      rtc: pcf85063: convert from round_rate() to determine_rate()
      rtc: pcf8563: convert from round_rate() to determine_rate()
      rtc: rv3028: convert from round_rate() to determine_rate()
      rtc: rv3032: convert from round_rate() to determine_rate()

Frank Li (2):
      dt-bindings: rtc: move nxp,lpc3220-rtc to separated file from trivial-rtc.yaml
      dt-bindings: rtc: nxp,lpc1788-rtc: add compatible string nxp,lpc1850-rtc

Geert Uytterhoeven (2):
      rtc: Rename lib_test to test_rtc_lib
      rtc: sh: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

Joshua Kinard (1):
      rtc: ds1685: Update Joshua Kinard's email address.

Krzysztof Kozlowski (1):
      rtc: s3c: Put 'const' just after 'static' keyword for data

Meagan Lloyd (2):
      rtc: ds1307: remove clear of oscillator stop flag (OSF) in probe
      rtc: ds1307: handle oscillator stop flag (OSF) for ds1341

Rob Herring (Arm) (1):
      dt-bindings: Move sophgo,cv1800b-rtc to rtc directory

Uwe Kleine-König (1):
      rtc: Optimize calculations in rtc_time64_to_tm()

Xianwei Zhao (1):
      dt-bindings: rtc: amlogic,a4-rtc: Add compatible string for C3

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  11 +-
 .../devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml   |   7 +-
 .../devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml   |  49 +++
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml      |  33 +-
 .../{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml    |   2 +-
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 -
 MAINTAINERS                                        |   2 +-
 drivers/rtc/Kconfig                                |  21 +-
 drivers/rtc/Makefile                               |   2 +-
 drivers/rtc/lib.c                                  |  40 ++-
 drivers/rtc/rtc-ds1307.c                           |  30 +-
 drivers/rtc/rtc-ds1685.c                           |   4 +-
 drivers/rtc/rtc-hym8563.c                          |  15 +-
 drivers/rtc/rtc-m41t80.c                           |  25 +-
 drivers/rtc/rtc-max31335.c                         |  12 +-
 drivers/rtc/rtc-nct3018y.c                         |  15 +-
 drivers/rtc/rtc-pcf85063.c                         | 351 ++++++++++++++-------
 drivers/rtc/rtc-pcf8563.c                          |  15 +-
 drivers/rtc/rtc-rv3028.c                           |  15 +-
 drivers/rtc/rtc-rv3032.c                           |  21 +-
 drivers/rtc/rtc-s3c.c                              |   8 +-
 drivers/rtc/rtc-sh.c                               |   8 +-
 drivers/rtc/sysfs.c                                |  64 ++--
 drivers/rtc/{lib_test.c => test_rtc_lib.c}         |   0
 include/linux/rtc/ds1685.h                         |   2 +-
 25 files changed, 507 insertions(+), 247 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc3220-rtc.yaml
 rename Documentation/devicetree/bindings/{soc/sophgo => rtc}/sophgo,cv1800b-rtc.yaml (96%)
 rename drivers/rtc/{lib_test.c => test_rtc_lib.c} (100%)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

