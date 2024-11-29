Return-Path: <linux-rtc+bounces-2645-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517349DECCC
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2024 22:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8123CB218BD
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Nov 2024 21:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6491A262D;
	Fri, 29 Nov 2024 21:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YvtCVyzQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766B189BAD;
	Fri, 29 Nov 2024 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732914417; cv=none; b=jfPY08pF+O/fAAm/843k5xKnZUl8aVK8PdXmn5veNmNxFKO0TV+5SWMnhgNZsarAbiuB7vIK7l+EWSkwXMqduUtZjhG7BzfpbFkaWfPoz3XasQFBtKSZADLjnsr39UthYf7i762h637l1skAqdn0eeV79bI7mG5Ari5ipiA1Eic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732914417; c=relaxed/simple;
	bh=veQ3X4n8MmtJR6hxRB+YEgYWppQ0NXmcaNXSJMqMEQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZgZEVp+kKko0Pdu33tI4VPVyr9HsC3KnhotONsOVVVhjL9ojhx0MMZm/OrQ/GHXKneYZ1r270VX54vyGmBM+TzCOwGBpga60Y33Tun0TVBgRW07pAsquyOV+RnQ7GFERCBMnQN9w1ckOyH/fxmVoSZkT8xEB2UDjvMKcDSWQ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YvtCVyzQ; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7E2520002;
	Fri, 29 Nov 2024 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732914410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=inGX4oSsUZSk5rxKq3jTPtBjN1eTTGsbjd0y6rV+QbE=;
	b=YvtCVyzQ9e63Ei81w98CH8gjrVA4fMEcccb1h2frn53EE6GFSjvcOiH+9J1Dx4pZQDgnMt
	9YSb6jIvxxUxPm7TpJPY7fUvQNkWkZ22f9QLNrLugrjW+qIQ9lSs5vTOFKky1fsfHXQuP0
	srjZDR7p7TEz7NSksbxM9tPuCy/j2rzXg4qUCwmjTP7zynzsVqrw9fbqA5v37tVC8aen5V
	bBPoF8DU4visu2Qw7P8sEZuHtzMOv65pwKPOkNknFmmNMo/EN1Ghzj+sNivRUQ16NB0fnt
	YwzvYOpKIxRcnNkwqmOoiSlH8A+5axW1NwIGMNGBmC/kHyBHWkKobYv7V/J/0A==
Date: Fri, 29 Nov 2024 22:06:50 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.13
Message-ID: <2024112921065012cef1c8@mail.local>
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

Here is the RTC subsystem pull request for 6.12. There are 3 new drivers
this cycle which are the bulk of the additions. Alarm support for
isl12022 is also a fairly large change.

I'm carrying an m68k change that we decide was worth having in this
release alongside the corresponding m48t59 change. It introduces a
somewhat trivial conflict as code has been added after code the patch is
removing. It has been solved properly in linux-next.


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.13

for you to fetch changes up to e0779a0dcf41a6452ac0a169cd96863feb5787c7:

  rtc: ab-eoz9: don't fail temperature reads on undervoltage notification (2024-11-25 23:34:12 +0100)

----------------------------------------------------------------
RTC for 6.13

New drivers:
 - Amlogic A4 and A5 RTC
 - Marvell 88PM886 PMIC RTC
 - Renesas RTCA-3 for Renesas RZ/G3S

Drivers:
 - ab-eoz9: fix temperature and alarm support
 - cmos: improve locking behaviour
 - isl12022: add alarm support
 - m48t59: improve epoch handling
 - mt6359: add range
 - rzn1: fix BCD conversions and simplify driver

----------------------------------------------------------------
Alexandre Belloni (4):
      dt-bindings: rtc: mpfs-rtc: Properly name file
      rtc: amlogic-a4: drop error messages
      rtc: rv3028: fix RV3028_TS_COUNT type
      rtc: ab-eoz9: fix abeoz9_rtc_read_alarm

Andre Przywara (1):
      dt-bindings: rtc: sun6i: Add Allwinner A523 support

AngeloGioacchino Del Regno (2):
      rtc: mt6359: Add RTC hardware range and add support for start-year
      rtc: mt6359: Use RTC_TC_DOW hardware register for wday

Claudiu Beznea (3):
      dt-bindings: rtc: renesas,rzg3s-rtc: Document the Renesas RTCA-3 IP
      rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC
      rtc: renesas-rtca3: Fix compilation error on RISC-V

Conor Dooley (1):
      dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers

Dmitry Torokhov (1):
      rtc: cmos: avoid taking rtc_lock for extended period of time

Esben Haabendal (3):
      rtc: isl12022: Prepare for extending rtc device drvdata
      rtc: isl12022: Add alarm support
      rtc: isl12022: Replace uint8_t types with u8

Finn Thain (2):
      rtc: m48t59: Use platform_data struct for year offset value
      m68k: mvme147, mvme16x: Adopt rtc-m48t59 platform driver

Jinjie Ruan (1):
      rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()

Karel Balej (1):
      rtc: add driver for Marvell 88PM886 PMIC RTC

Maxime Chevallier (1):
      rtc: ab-eoz9: don't fail temperature reads on undervoltage notification

Nobuhiro Iwamatsu (4):
      rtc: rtc-mc146818-lib: Use is_leap_year instead of calculate leap years
      rtc: abx80x: Fix WDT bit position of the status register
      rtc: pcf8563: Sort headers alphabetically
      rtc: pcf8563: Switch to regmap

Peng Fan (1):
      rtc: bbnsm: add remove hook

Pierre-Henry Moussay (1):
      dt-bindings: rtc: mpfs-rtc: Add PIC64GX compatibility

Tóth János (1):
      rtc: Makefile: Replace spaces with tab.

Uwe Kleine-König (1):
      rtc: Switch back to struct platform_driver::remove()

Wolfram Sang (5):
      rtc: rzn1: fix BCD to rtc_time conversion errors
      rtc: rzn1: update Michel's email
      rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
      rtc: rzn1: drop superfluous wday calculation
      rtc: rzn1: reduce register access

Xianwei Zhao (1):
      rtc: amlogic-a4: fix compile error

Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

Yongliang Gao (1):
      rtc: check if __rtc_read_time was successful in rtc_timer_do_work()

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   4 +-
 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  63 ++
 ...ochip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml} |  10 +-
 .../devicetree/bindings/rtc/renesas,rz-rtca3.yaml  |  84 ++
 MAINTAINERS                                        |  17 +
 arch/m68k/configs/multi_defconfig                  |   1 +
 arch/m68k/configs/mvme147_defconfig                |   1 +
 arch/m68k/configs/mvme16x_defconfig                |   1 +
 arch/m68k/include/asm/mvme147hw.h                  |  19 +-
 arch/m68k/include/asm/mvme16xhw.h                  |  18 +-
 arch/m68k/mvme147/config.c                         |  54 +-
 arch/m68k/mvme16x/Makefile                         |   2 +-
 arch/m68k/mvme16x/config.c                         |  57 +-
 arch/m68k/mvme16x/rtc.c                            | 165 ----
 arch/sparc/kernel/time_32.c                        |   1 +
 arch/sparc/kernel/time_64.c                        |   1 +
 drivers/rtc/Kconfig                                |  33 +
 drivers/rtc/Makefile                               |   5 +-
 drivers/rtc/interface.c                            |   7 +-
 drivers/rtc/rtc-88pm80x.c                          |   2 +-
 drivers/rtc/rtc-88pm860x.c                         |   2 +-
 drivers/rtc/rtc-88pm886.c                          |  97 +++
 drivers/rtc/rtc-ab-eoz9.c                          |  11 +-
 drivers/rtc/rtc-ab8500.c                           |   2 +-
 drivers/rtc/rtc-abx80x.c                           |   2 +-
 drivers/rtc/rtc-ac100.c                            |   2 +-
 drivers/rtc/rtc-amlogic-a4.c                       | 465 +++++++++++
 drivers/rtc/rtc-asm9260.c                          |   2 +-
 drivers/rtc/rtc-at91rm9200.c                       |   2 +-
 drivers/rtc/rtc-at91sam9.c                         |   2 +-
 drivers/rtc/rtc-brcmstb-waketimer.c                |   3 +-
 drivers/rtc/rtc-cadence.c                          |   2 +-
 drivers/rtc/rtc-cmos.c                             |  39 +-
 drivers/rtc/rtc-cros-ec.c                          |   2 +-
 drivers/rtc/rtc-ds1685.c                           |   2 +-
 drivers/rtc/rtc-ftrtc010.c                         |   2 +-
 drivers/rtc/rtc-hid-sensor-time.c                  |   2 +-
 drivers/rtc/rtc-imxdi.c                            |   2 +-
 drivers/rtc/rtc-isl12022.c                         | 271 ++++++-
 drivers/rtc/rtc-loongson.c                         |   2 +-
 drivers/rtc/rtc-lpc24xx.c                          |   2 +-
 drivers/rtc/rtc-m48t59.c                           |  26 +-
 drivers/rtc/rtc-max77686.c                         |   2 +-
 drivers/rtc/rtc-mc13xxx.c                          |   2 +-
 drivers/rtc/rtc-mc146818-lib.c                     |   6 +-
 drivers/rtc/rtc-mpc5121.c                          |   2 +-
 drivers/rtc/rtc-mpfs.c                             |   2 +-
 drivers/rtc/rtc-mt6397.c                           |  29 +-
 drivers/rtc/rtc-mt7622.c                           |   2 +-
 drivers/rtc/rtc-mv.c                               |   2 +-
 drivers/rtc/rtc-mxc_v2.c                           |   2 +-
 drivers/rtc/rtc-nxp-bbnsm.c                        |  20 +-
 drivers/rtc/rtc-omap.c                             |   2 +-
 drivers/rtc/rtc-palmas.c                           |   2 +-
 drivers/rtc/rtc-pcf50633.c                         |   2 +-
 drivers/rtc/rtc-pcf8563.c                          | 214 ++---
 drivers/rtc/rtc-pic32.c                            |   2 +-
 drivers/rtc/rtc-pm8xxx.c                           |   2 +-
 drivers/rtc/rtc-pxa.c                              |   2 +-
 drivers/rtc/rtc-rc5t583.c                          |   2 +-
 drivers/rtc/rtc-renesas-rtca3.c                    | 900 +++++++++++++++++++++
 drivers/rtc/rtc-rtd119x.c                          |   2 +-
 drivers/rtc/rtc-rv3028.c                           |   6 +-
 drivers/rtc/rtc-rzn1.c                             |  92 +--
 drivers/rtc/rtc-s3c.c                              |   2 +-
 drivers/rtc/rtc-sa1100.c                           |   2 +-
 drivers/rtc/rtc-sh.c                               |   2 +-
 drivers/rtc/rtc-spear.c                            |   2 +-
 drivers/rtc/rtc-st-lpc.c                           |   5 +-
 drivers/rtc/rtc-stm32.c                            |   2 +-
 drivers/rtc/rtc-stmp3xxx.c                         |   2 +-
 drivers/rtc/rtc-sunplus.c                          |   2 +-
 drivers/rtc/rtc-tegra.c                            |   2 +-
 drivers/rtc/rtc-tps6586x.c                         |   2 +-
 drivers/rtc/rtc-twl.c                              |   2 +-
 drivers/rtc/rtc-vt8500.c                           |   2 +-
 drivers/rtc/rtc-wm8350.c                           |   2 +-
 drivers/rtc/rtc-xgene.c                            |   2 +-
 drivers/rtc/rtc-zynqmp.c                           |   2 +-
 include/linux/mfd/88pm886.h                        |   9 +
 include/linux/rtc/m48t59.h                         |   3 +
 81 files changed, 2226 insertions(+), 603 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
 rename Documentation/devicetree/bindings/rtc/{microchip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml} (87%)
 create mode 100644 Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
 delete mode 100644 arch/m68k/mvme16x/rtc.c
 create mode 100644 drivers/rtc/rtc-88pm886.c
 create mode 100644 drivers/rtc/rtc-amlogic-a4.c
 create mode 100644 drivers/rtc/rtc-renesas-rtca3.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

