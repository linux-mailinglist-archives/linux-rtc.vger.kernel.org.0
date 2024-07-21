Return-Path: <linux-rtc+bounces-1562-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B652938640
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Jul 2024 23:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B041C2091E
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Jul 2024 21:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD416848F;
	Sun, 21 Jul 2024 21:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C85MwJd8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5CE1CF96;
	Sun, 21 Jul 2024 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721599071; cv=none; b=l93IOXz57jUQRptXloLKYBX9UmzULffbvv62lFuv0eaO3EBnOpDJgtv1HV+bwLchen+jYrteC66cJYvN+koLakrVoWWiiXJQTjMiIBz2YppnACBtYSVjVrPa2UMy3by0FSEoS5GPrgbxa+hQ5Q/VJVW/R6o2p97+0iadA80wbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721599071; c=relaxed/simple;
	bh=e/UjiOQIam2H+2A729n1P0NfdM9iC/Xca2dOMiWLYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pv30yzIyEm8moEhgEmv/Ic9RrXMbR7k0juSPloi7j46H/xIYnn14Z0FnLLruF5DueXN9z+GeFMBp7D7bazPO4pNQLz1NesZjZ6JX2PcSS0UTLHFlwRc4a0J6sJ1PILCiNGvZmk9X3uuO1QAFFqlW62PKTpCBTr4ylIprswpOoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C85MwJd8; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28051240004;
	Sun, 21 Jul 2024 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721599061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jrzeia8oxdyyFlAcMGFtS/pH0bBhMavrxrVfg45OkHM=;
	b=C85MwJd8UkuoDydPKdfJ1sJ880GdP472oqyog+0b4/EiiA75r6/Lyf0HrhanrUUtPDOPKI
	V8fZ9boiwrBerbSHcPSPTwjFTDKUNg4TQA5pe2auzNgS9juf0MSTew3Qrk235XiILXVCEN
	mnKbKvay3agsCo6MerDgYPr29clLx2kE1t6Uii6PLdC04nJJ0yk6yR1W0WA26suMh1lyuD
	nlgGm/P7sH8Lda5e4e0Y382Rt/LAlBPdiv93TtTTjzLWVouUWG9Ae0mMhSyTruLKza06to
	tleFpDdeHElYOkobbxzMJDz9GXL+3bhUMCWfk0NisIu7TRIG0wllmoG85ihaqA==
Date: Sun, 21 Jul 2024 23:57:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.11
Message-ID: <2024072121574018084eea@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.11. There are mstly small
fixes this cycle. The alarm offset that is getting fixed doesn't affect
many RTCs as most of them have a complete set of datetime registers.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.11

for you to fetch changes up to efa9c5be2caecae7dfa4f29c6ab3d4a2f341eb15:

  rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF configuration (2024-07-10 17:15:33 +0200)

----------------------------------------------------------------
RTC for 6.11

Subsystem:
 - add missing MODULE_DESCRIPTION() macro
 - fix offset addition for alarms

Drivers:
 - isl1208: alarm clearing fixes
 - mcp794xx: oscillator failure detection
 - stm32: stm32mp25 support
 - tps6594: power management support

----------------------------------------------------------------
Biju Das (2):
      rtc: isl1208: Add a delay for clearing alarm
      rtc: isl1208: Update correct procedure for clearing alarm

Csókás, Bence (3):
      rtc: ds1307: Detect oscillator fail on mcp794xx
      rtc: ds1307: Clamp year to valid BCD (0-99) in `set_time()`
      rtc: interface: Add RTC offset to alarm after fix-up

Frank Li (1):
      dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to yaml format

Jeff Johnson (1):
      rtc: add missing MODULE_DESCRIPTION() macro

Joy Chakraborty (3):
      rtc: isl1208: Fix return value of nvmem callbacks
      rtc: cmos: Fix return value of nvmem callbacks
      rtc: abx80x: Fix return value of nvmem callback on read

Richard Genoud (3):
      rtc: tps6594: Fix memleak in probe
      rtc: tps6594: introduce private structure as drvdata
      rtc: tps6594: Add power management support

Uwe Kleine-König (1):
      rtc: Drop explicit initialization of struct i2c_device_id::driver_data to 0

Valentin Caron (2):
      dt-bindings: rtc: stm32: introduce new st,stm32mp25-rtc compatible
      rtc: stm32: add new st,stm32mp25-rtc compatible and check RIF configuration

 .../devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml  | 73 ++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  | 36 ----------
 .../devicetree/bindings/rtc/st,stm32-rtc.yaml      |  5 +-
 drivers/rtc/interface.c                            |  9 +--
 drivers/rtc/lib_test.c                             |  1 +
 drivers/rtc/rtc-ab-b5ze-s3.c                       |  2 +-
 drivers/rtc/rtc-ab-eoz9.c                          |  2 +-
 drivers/rtc/rtc-abx80x.c                           | 12 ++--
 drivers/rtc/rtc-bq32k.c                            |  2 +-
 drivers/rtc/rtc-cmos.c                             | 10 ++-
 drivers/rtc/rtc-ds1307.c                           |  7 +-
 drivers/rtc/rtc-ds1374.c                           |  2 +-
 drivers/rtc/rtc-ds1672.c                           |  2 +-
 drivers/rtc/rtc-ds3232.c                           |  2 +-
 drivers/rtc/rtc-em3027.c                           |  2 +-
 drivers/rtc/rtc-fm3130.c                           |  2 +-
 drivers/rtc/rtc-goldfish.c                         |  1 +
 drivers/rtc/rtc-hym8563.c                          |  4 +-
 drivers/rtc/rtc-isl12022.c                         |  2 +-
 drivers/rtc/rtc-isl1208.c                          | 36 ++++++----
 drivers/rtc/rtc-max31335.c                         |  2 +-
 drivers/rtc/rtc-max6900.c                          |  2 +-
 drivers/rtc/rtc-mpc5121.c                          |  1 +
 drivers/rtc/rtc-nct3018y.c                         |  2 +-
 drivers/rtc/rtc-omap.c                             |  1 +
 drivers/rtc/rtc-pcf8523.c                          |  2 +-
 drivers/rtc/rtc-pcf8563.c                          |  6 +-
 drivers/rtc/rtc-pcf8583.c                          |  2 +-
 drivers/rtc/rtc-rc5t583.c                          |  1 +
 drivers/rtc/rtc-rv3029c2.c                         |  4 +-
 drivers/rtc/rtc-rx6110.c                           |  2 +-
 drivers/rtc/rtc-rx8010.c                           |  2 +-
 drivers/rtc/rtc-rx8581.c                           |  2 +-
 drivers/rtc/rtc-s35390a.c                          |  2 +-
 drivers/rtc/rtc-sd3078.c                           |  2 +-
 drivers/rtc/rtc-stm32.c                            | 78 ++++++++++++++++++++++
 drivers/rtc/rtc-tps65910.c                         |  1 +
 drivers/rtc/rtc-tps6594.c                          | 75 +++++++++++++++++----
 drivers/rtc/rtc-twl.c                              |  1 +
 drivers/rtc/rtc-x1205.c                            |  2 +-
 40 files changed, 299 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

