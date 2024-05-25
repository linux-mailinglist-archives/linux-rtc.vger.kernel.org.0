Return-Path: <linux-rtc+bounces-1211-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F168CEE35
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2024 10:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44A291C203B3
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2024 08:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5103AD5D;
	Sat, 25 May 2024 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dnlgNffI"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16CF1A2C04;
	Sat, 25 May 2024 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716624319; cv=none; b=T7JA7p0IYO8YVQ2B8O6+HNn3Bd3YVOg7RrHvzObm8ohpMx4ploIwpLNqlvhHs2a28CtrikdDYb34HLrdT8d/g8kqzr5gyL5tF8/mGBxXvzuFO6ap8OvPNIE0QXVp8vtpfiroSTfH4ruMKhuEzTSAfF1J7KWuFej2ShckoqPFJOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716624319; c=relaxed/simple;
	bh=XFRj5TCULhWq86bFk6J4yhXXsMAeEN0C7KSXregkaR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUOzhPpFDWyenIWgIsF+Yws/8HMegFBgQjUcrSXV/6i5B8AkYIPF4kDtU7L5PcZ6APhz7GbpSg9B3PlNRmeAQO8CYyrU60bayc90MWZff9Ltm1kl/RgckLjMGsOgs41X22omIsX8qAWHJP9nVxFvHgej6ewdFHIl898kIpNTwe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dnlgNffI; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4886740005;
	Sat, 25 May 2024 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716624309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Z94hMcVlk/fpwLtIXF599KO23cpZCPef4ro3NUWxpjg=;
	b=dnlgNffISVyF3DqoqNKlyenOUuHgkolh2m3PWZDa/NCmxVxDA7Gp/hCzmcXvtk9Kdr45jL
	efi4oQKGbhVyWcP9EAgsNR/fm/ypo+ClteubmjkYZtNF/bQ+iCKnnE4qAOOm9F/UZfY/SI
	Mym6Rlh3o54/SAmtaUHp6Xw0fQ21vVml1Ikf9yvF2OnrBRP6yaRHH3vRvdunKCnf2n95Au
	0Ld28VT0yQWI0dAobS1iHaJPeoN+UpLobaO0CfP0J2TD6qNLHBgCO2z8ThP2U1szMutLTC
	3C17/0vpbQRLUDr+zZeat/1emZRFETKgCM/cP78VVz6zvgxy2A6qtYGZyu0aFg==
Date: Sat, 25 May 2024 10:05:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.10
Message-ID: <20240525080509a438f063@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the RTC subsystem pull request for 6.10. There is one new driver
and then most of the changes are the device tree bindings conversions to
yaml.

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.10

for you to fetch changes up to 4c9a91b94c126d6585fbf185807b26dca5166209:

  pcf8563: add wakeup-source support (2024-05-07 23:40:46 +0200)

----------------------------------------------------------------
RTC for 6.10

New driver:
 - Epson RX8111

Drivers:
 - Many Device Tree bindings conversions to dtschema
 - pcf8563: wakeup-source support

----------------------------------------------------------------
Alexandre Belloni (3):
      rtc: rx8111: demote warnings to debug level
      rtc: rx8111: handle VLOW flag
      pcf8563: add wakeup-source support

Christophe JAILLET (1):
      rtc: rx6110: Constify struct regmap_config

Guenter Roeck (1):
      rtc: test: Split rtc unit test into slow and normal speed test

Javier Carrasco (7):
      dt-bindings: rtc: armada-380-rtc: convert to dtschema
      dt-bindings: rtc: alphascale,asm9260-rtc: convert to dtschema
      dt-bindings: rtc: digicolor-rtc: move to trivial-rtc
      dt-bindings: rtc: nxp,lpc1788-rtc: convert to dtschema
      dt-bindings: rtc: pxa-rtc: convert to dtschema
      dt-bindings: rtc: stmp3xxx-rtc: convert to dtschema
      dt-bindings: rtc: convert trivial devices into dtschema

Krzysztof Kozlowski (1):
      rtc: mcp795: drop unneeded MODULE_ALIAS

Mia Lin (1):
      rtc: nuvoton: Modify part number value

Tzung-Bi Shih (1):
      rtc: cros-ec: provide ID table for avoiding fallback match

Waqar Hameed (2):
      dt-bindings: rtc: Add Epson RX8111
      rtc: Add driver for Epson RX8111

 .../bindings/rtc/alphascale,asm9260-rtc.txt        |  19 --
 .../bindings/rtc/alphascale,asm9260-rtc.yaml       |  50 +++
 .../devicetree/bindings/rtc/armada-380-rtc.txt     |  24 --
 .../devicetree/bindings/rtc/digicolor-rtc.txt      |  17 -
 .../devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml  |  51 +++
 .../bindings/rtc/google,goldfish-rtc.txt           |  17 -
 .../devicetree/bindings/rtc/lpc32xx-rtc.txt        |  15 -
 .../bindings/rtc/marvell,armada-380-rtc.yaml       |  51 +++
 .../devicetree/bindings/rtc/marvell,pxa-rtc.yaml   |  40 +++
 .../devicetree/bindings/rtc/maxim,ds1742.txt       |  12 -
 .../devicetree/bindings/rtc/nxp,lpc1788-rtc.txt    |  21 --
 .../devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml   |  58 ++++
 .../devicetree/bindings/rtc/orion-rtc.txt          |  18 -
 Documentation/devicetree/bindings/rtc/pxa-rtc.txt  |  14 -
 .../devicetree/bindings/rtc/rtc-aspeed.txt         |  22 --
 .../devicetree/bindings/rtc/spear-rtc.txt          |  15 -
 .../devicetree/bindings/rtc/stmp3xxx-rtc.txt       |  21 --
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  21 ++
 .../devicetree/bindings/rtc/via,vt8500-rtc.txt     |  15 -
 MAINTAINERS                                        |   1 -
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/lib_test.c                             |  33 +-
 drivers/rtc/rtc-cros-ec.c                          |   9 +-
 drivers/rtc/rtc-mcp795.c                           |   1 -
 drivers/rtc/rtc-nct3018y.c                         |  15 +-
 drivers/rtc/rtc-pcf8563.c                          |   9 +-
 drivers/rtc/rtc-rx6110.c                           |   4 +-
 drivers/rtc/rtc-rx8111.c                           | 368 +++++++++++++++++++++
 29 files changed, 702 insertions(+), 250 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/armada-380-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/digicolor-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/fsl,stmp3xxx-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/lpc32xx-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/marvell,armada-380-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/marvell,pxa-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,lpc1788-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/orion-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/pxa-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-aspeed.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/spear-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/stmp3xxx-rtc.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/via,vt8500-rtc.txt
 create mode 100644 drivers/rtc/rtc-rx8111.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

