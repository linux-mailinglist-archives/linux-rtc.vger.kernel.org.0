Return-Path: <linux-rtc+bounces-213-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5D7E17C9
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Nov 2023 00:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76F9DB20D1E
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Nov 2023 23:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E907171DC;
	Sun,  5 Nov 2023 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kuC2NAnz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEC6AD6
	for <linux-rtc@vger.kernel.org>; Sun,  5 Nov 2023 23:02:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E625FFA;
	Sun,  5 Nov 2023 15:02:20 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A2EFFF80D;
	Sun,  5 Nov 2023 23:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699225339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1JCMRwcjDpjDvwz9frVp0hofBEEnufrEJXSlfGmnyCc=;
	b=kuC2NAnzsLipggxKgZnI3kNfAjCBcEwbdTiBfP8ILOS+oFJspo2SSKlvQH3+OVapXagdiA
	oldpK01IgsFingWWiyUc38yuz3gsfj2lbMdRx/jUFLLnn+8jeoNweYM3mhrFDXbhczjmbk
	WiyQWPqLm0hAqOABJ+AHUoAKrUckeRjhAJTDKA6Lbfdj4tQGzC1K02ZPGRCHvIY8I7N3Zr
	B0puNxc4rClKRWYh/Zh8OcNJd0uh679ISVPc1xklu39UjCEDv4/G3UQp1BT999RmGWjuUV
	rpGeRglOMDWp67+4NQyxNRLy1tWlwhISKtPTT10HNetgA7+UHQcSHh4KhLX4lA==
Date: Mon, 6 Nov 2023 00:02:18 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.7
Message-ID: <20231105230218a45aa668@mail.local>
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

Here is the RTC subsystem pull request for 6.7. There is a new driver
for the RTC of the Mstar SSD202D SoC. The rtc7301 driver gains support
for byte addresses to support the USRobotics USR8200. Then we have many
non user visible changes and typo fixes.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.7

for you to fetch changes up to cfb67623ce281e045ec11e3eddb1b68b879b53a1:

  dt-bindings: rtc: Add Mstar SSD202D RTC (2023-10-16 16:54:26 +0200)

----------------------------------------------------------------
RTC for 6.7

Subsytem:
 - convert platform drivers to remove_new
 - prevent modpost warnings for unremovable platform drivers

New driver:
 - Mstar SSD202D

Drivers:
 - brcmstb-waketimer: support level alarm_irq
 - ep93xx: add DT support
 - rtc7301: support byte-addressed IO

----------------------------------------------------------------
Alexandre Belloni (2):
      rtc: sh: silence warning
      rtc: at91rm9200: annotate at91_rtc_remove with __exit again

Doug Berger (1):
      rtc: brcmstb-waketimer: support level alarm_irq

Fabio Estevam (1):
      dt-bindings: rtc: pcf8523: Convert to YAML

Javier Carrasco (3):
      rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call
      dt-bindings: rtc: pcf2123: convert to YAML
      dt-bindings: rtc: mcp795: move to trivial-rtc

Linus Walleij (2):
      rtc: rtc7301: Rewrite bindings in schema
      rtc: rtc7301: Support byte-addressed IO

Marek Vasut (1):
      dt-bindings: rtc: microcrystal,rv3032: Document wakeup-source property

Maxim Korotkov (1):
      rtc: efi: fixed typo in efi_procfs()

Nikita Shubin (2):
      dt-bindings: rtc: Add Cirrus EP93xx
      rtc: ep93xx: add DT support for Cirrus EP93xx

Rob Herring (1):
      rtc: omap: Use device_get_match_data()

Romain Perier (2):
      rtc: Add support for the SSD202D RTC
      dt-bindings: rtc: Add Mstar SSD202D RTC

Uwe Kleine-König (12):
      rtc: imxdi: Soften dependencies for improved compile coverage
      rtc: at91rm9200: Mark driver struct with __refdata to prevent section mismatch warning
      rtc: imxdi: Mark driver struct with __refdata to prevent section mismatch warning
      rtc: mv: Mark driver struct with __refdata to prevent section mismatch warning
      rtc: pxa: Mark driver struct with __refdata to prevent section mismatch warning
      rtc: sh: Mark driver struct with __refdata to prevent section mismatch warning
      rtc: pcap: Drop no-op remove function
      rtc: at91rm9200: Convert to platform remove callback returning void
      rtc: imxdi: Convert to platform remove callback returning void
      rtc: mv: Convert to platform remove callback returning void
      rtc: pxa: Convert to platform remove callback returning void
      rtc: sh: Convert to platform remove callback returning void

 .../devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml |  42 ++++
 .../devicetree/bindings/rtc/epson,rtc7301.txt      |  16 --
 .../devicetree/bindings/rtc/epson,rtc7301.yaml     |  51 +++++
 .../devicetree/bindings/rtc/maxim,mcp795.txt       |  11 -
 .../bindings/rtc/microcrystal,rv3032.yaml          |   2 +
 .../devicetree/bindings/rtc/mstar,ssd202d-rtc.yaml |  35 +++
 .../devicetree/bindings/rtc/nxp,pcf2123.yaml       |  47 ++++
 .../devicetree/bindings/rtc/nxp,pcf8523.txt        |  18 --
 .../devicetree/bindings/rtc/nxp,pcf8523.yaml       |  45 ++++
 .../devicetree/bindings/rtc/nxp,rtc-2123.txt       |  17 --
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   2 +
 drivers/rtc/Kconfig                                |  13 +-
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-at91rm9200.c                       |  14 +-
 drivers/rtc/rtc-brcmstb-waketimer.c                |  47 +++-
 drivers/rtc/rtc-efi.c                              |   2 +-
 drivers/rtc/rtc-ep93xx.c                           |   8 +
 drivers/rtc/rtc-imxdi.c                            |  14 +-
 drivers/rtc/rtc-mv.c                               |  14 +-
 drivers/rtc/rtc-omap.c                             |   8 +-
 drivers/rtc/rtc-pcap.c                             |   6 -
 drivers/rtc/rtc-pcf85363.c                         |   2 +-
 drivers/rtc/rtc-pxa.c                              |  13 +-
 drivers/rtc/rtc-r7301.c                            |  35 ++-
 drivers/rtc/rtc-sh.c                               |  16 +-
 drivers/rtc/rtc-ssd202d.c                          | 249 +++++++++++++++++++++
 26 files changed, 620 insertions(+), 108 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/epson,rtc7301.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/epson,rtc7301.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/maxim,mcp795.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/mstar,ssd202d-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2123.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8523.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8523.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
 create mode 100644 drivers/rtc/rtc-ssd202d.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

