Return-Path: <linux-rtc+bounces-2060-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA0984DB1
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Sep 2024 00:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D5D8B228D2
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Sep 2024 22:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82959143C5D;
	Tue, 24 Sep 2024 22:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FosBc4/W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191213C9D9;
	Tue, 24 Sep 2024 22:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216594; cv=none; b=TVnh6vcHV5DyOEEp/DWZI8t33twtTyopEDVnMegC24JN3zPpXw8C1Gda7GdL5GwgptNSRGEM1EUjobaY43n+Dk+EqaSQ0Kw8YP1XU9h0H1TCghdFGO8CEWM5Iv71Crp8mA4nEpRn6lnvqT1TP0Je+nKOCUZkwkUxyXFbh36TGBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216594; c=relaxed/simple;
	bh=Hbqs1p8/z9sPPoTiZFMA54QwwUIct896MPjic2uRnaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEr5vKwCIEgWnKsxf3aWxDemNUAXDLHSzs5LcV4zUEqE1BySDGYYS8JhRtwCuDV1c7J3G7UcwujL67zEvFt4heo7MsDPVZEwJhY5+tfTUUWIIhGCKcmaddqCkfdURb/EyA+xWJV0K99wr0lRFco74IAiKpOEC+X92DptNOjJzmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FosBc4/W; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EA8540003;
	Tue, 24 Sep 2024 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727216583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZjLYmiEfRGI0UzRP8pMZri5+kGLODZxfHXkp3GOn34I=;
	b=FosBc4/WhaHfk+qNMOLHRpeuMXBvYVEhz4PyzKYJj5hncXpPxQX8XjeStdrmnv7lvblSNf
	i8lboesXKzkmJDP8c3GtDK+OOsJtYeL69XG1eviO3tR4pEd7MPQVyPDGevRlERFlj1aBEk
	8MrBimq9Tg+/QqCK2EEupBmfiKoe0pYpKV5wvsLzYrm8Mh2HKzTvpd31XgD7owqbSPnPrt
	PRKZAMjrUBDTV6IUTz8SOqu+1HQqVzVYIrtfRfPSKU03TIGmbGs0eRhdEMpwsOypUsxL/L
	ezPDqxRWjRc7PuAykKjkU6VgBBziBo6FXOBn6s17uTg+L6dypEoa3QNNpHOqBQ==
Date: Wed, 25 Sep 2024 00:23:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.12
Message-ID: <20240924222302cc712db4@mail.local>
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

Here is the RTC subsystem pull request for 6.12. We get more conversions
of DT bindings to yaml. There is one new driver, for the DFRobot
SD2405AL and support for important features of the stm32 RTC.

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.12

for you to fetch changes up to 690286214916f32d75de2667ec0fcfa9c3f4eefb:

  rtc: rc5t619: use proper module tables (2024-09-22 01:17:35 +0200)

----------------------------------------------------------------
RTC for 6.12

New driver:
 - DFRobot SD2405AL

Drivers:
 - stm32: add alarm A out and LSCO support
 - sun6i: disable automatic clock input switching
 - m48t59: set range

----------------------------------------------------------------
Abhishek Tamboli (1):
      rtc: m48t59: Remove division condition with direct comparison

Alexandre Belloni (1):
      rtc: m48t59: set range

Andreas Kemnade (1):
      rtc: rc5t619: use proper module tables

Chen Ni (1):
      rtc: twl: convert comma to semicolon

Karthikeyan Krishnasamy (1):
      dt-bindings: rtc: microcrystal,rv3028: add #clock-cells property

Krzysztof Kozlowski (1):
      rtc: at91sam9: fix OF node leak in probe() error path

Michael Walle (1):
      rtc: sun6i: disable automatic clock input switching

Rob Herring (Arm) (2):
      rtc: s35390a: Drop vendorless compatible string from match table
      dt-bindings: rtc: Drop non-trivial duplicate compatibles

Stanislav Jakubek (1):
      dt-bindings: rtc: sprd,sc2731-rtc: convert to YAML

Tóth János (3):
      rtc: Add driver for SD2405AL
      dt-bindings: rtc: Add support for SD2405AL.
      dt-bindings: vendor-prefixes: Add DFRobot.

Valentin Caron (4):
      dt-bindings: rtc: stm32: describe pinmux nodes
      rtc: stm32: add pinctrl and pinmux interfaces
      rtc: stm32: add Low Speed Clock Output (LSCO) support
      rtc: stm32: add alarm A out feature

 .../bindings/rtc/microcrystal,rv3028.yaml          |   3 +
 .../devicetree/bindings/rtc/sprd,sc2731-rtc.yaml   |  49 ++++
 .../devicetree/bindings/rtc/sprd,sc27xx-rtc.txt    |  26 --
 .../devicetree/bindings/rtc/st,stm32-rtc.yaml      |  28 ++
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   9 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/rtc/Kconfig                                |  16 ++
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-at91sam9.c                         |   1 +
 drivers/rtc/rtc-m48t59.c                           |   4 +-
 drivers/rtc/rtc-rc5t619.c                          |  13 +-
 drivers/rtc/rtc-s35390a.c                          |   1 -
 drivers/rtc/rtc-sd2405al.c                         | 227 +++++++++++++++++
 drivers/rtc/rtc-stm32.c                            | 281 +++++++++++++++++++++
 drivers/rtc/rtc-sun6i.c                            |   1 +
 drivers/rtc/rtc-twl.c                              |   4 +-
 17 files changed, 633 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/sprd,sc2731-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/sprd,sc27xx-rtc.txt
 create mode 100644 drivers/rtc/rtc-sd2405al.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

