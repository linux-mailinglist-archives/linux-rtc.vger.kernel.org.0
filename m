Return-Path: <linux-rtc+bounces-5086-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BDBCF835
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 18:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0D4D5344324
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 16:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18E927A46A;
	Sat, 11 Oct 2025 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A6l6cloo"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927F61DED63
	for <linux-rtc@vger.kernel.org>; Sat, 11 Oct 2025 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760199620; cv=none; b=o0aVY1MAbo11YrI2osIv+CmsA4ZMYA9Zj1e/RvLYJwm8atO+laZ26JgJRMW0JJHqgTzRMxazwr8nxl2aUTd9eYt8+Zqs2ezDaTbixwtpy0yjtxkl1BdCY2mYU9CU4qiVH5H3UOj4gL57uWFsDm3nfWfCD95ogvv+IuhGRenUGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760199620; c=relaxed/simple;
	bh=m5UaqEZSlsrbFSHb4wV5OkBFZgiJZer1+Gi5aKfEKgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TyuNS0PxV4MVE3Kpb0r0ipPsug0PVgtEgs62/J48yfCsa+Kt4A686wY2oLrR76AxN0LSSgwdZiKMqx/+XJshqEXq6YGNuZBm1tHGfNhydNTFKYkERrxmp8bZbZDo+CwVS3TY8EQlnFW1jiV1hEsF8gppWIIZzJH3ZZ+84B0RyNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A6l6cloo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 662A64E40FFB;
	Sat, 11 Oct 2025 16:20:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25F4C606EC;
	Sat, 11 Oct 2025 16:20:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68A2B102F222F;
	Sat, 11 Oct 2025 18:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760199612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nubkwtTG7pjDKHkybyKQcu+6G/5ppcH3oFzBNuGVk6U=;
	b=A6l6cloo8YWDvn6t3RlYSIWH6qAbNr150SPFzWAkuvsMGd0JaeEohF/EpFqj3JEpYSGS8r
	rGm2WsxpvYm8gaAYXZ4JqfRoeUhWZZW1FjOVBEMkVDErvf0A8uWdH+ZYcdf5xNjsjECb4l
	RALl8IZw2lKcPOpBeqFzt2RBqdTiYtXAr8nf/yQ5JMPEEsCpVqH5k+pkdzA29WiWme0zZ4
	fPGg1QHKVPBk89n4Uq7yWLAdQf78Qy+jmldod3K8Wl8ZLvf4uy6ktH1Vlyhij5uT4i0aoU
	AVns91lQsMpKo8/pYtR/5nc9ymcmUbZQ6rCpdp5tIwRrhna1eA63UrC+2UXxeA==
Date: Sat, 11 Oct 2025 18:20:09 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.18
Message-ID: <20251011162009a4f6040d@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Linus,

Here is the RTC subsystem pull request for 6.18. This cycle, we have a
new RTC driver, for the SpacemiT P1. The optee driver gets alarm
support. We also get a fix for a race condition that was fairly rare
unless while stress testing the alarms.

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18

for you to fetch changes up to 9db26d5855d0374d4652487bfb5aacf40821c469:

  rtc: interface: Ensure alarm irq is enabled when UIE is enabled (2025-10-09 23:34:52 +0200)

----------------------------------------------------------------
RTC for 6.18

Subsystem:
 - Fix race when setting alarm
 - Ensure alarm irq is enabled when UIE is enabled
 - remove unneeded 'fast_io' parameter in regmap_config

New driver:
 - SpacemiT P1 RTC

Drivers:
 - efi: Remove wakeup functionality
 - optee: add alarms support
 - s3c: Drop support for S3C2410
 - zynqmp: Restore alarm functionality after kexec transition

----------------------------------------------------------------
Alex Elder (1):
      rtc: spacemit: support the SpacemiT P1 RTC

Alexandre Belloni (2):
      rtc: optee: make optee_rtc_pm_ops static
      rtc: Kconfig: move symbols to proper section

Ard Biesheuvel (1):
      rtc: efi: Remove wakeup functionality

Bruno Thomsen (1):
      rtc: pcf2127: fix watchdog interrupt mask on pcf2131

Clément Le Goffic (3):
      rtc: optee: fix memory leak on driver removal
      rtc: optee: remove unnecessary memory operations
      rtc: optee: add alarm related rtc ops to optee rtc driver

Dan Carpenter (2):
      rtc: optee: fix error code in probe()
      rtc: optee: Fix error code in optee_rtc_read_alarm()

Esben Haabendal (5):
      rtc: interface: Fix long-standing race when setting alarm
      rtc: isl12022: Fix initial enable_irq/disable_irq balance
      rtc: cpcap: Fix initial enable_irq/disable_irq balance
      rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      rtc: interface: Ensure alarm irq is enabled when UIE is enabled

Frank Li (2):
      dt-bindings: rtc: pcf85063: remove quartz-load-femtofarads restriction for nxp,pcf85063
      dt-bindings: rtc: trivial-rtc: add dallas,m41t00

Harini T (1):
      rtc: zynqmp: Restore alarm functionality after kexec transition

Josua Mayer (1):
      rtc: pcf2127: clear minute/second interrupt

Krzysztof Kozlowski (3):
      rtc: s3c: Drop unused defines
      rtc: s3c: Drop support for S3C2410
      dt-bindings: rtc: s3c: Drop S3C2410

Rob Herring (Arm) (4):
      dt-bindings: rtc: Drop isil,isl12057.txt
      dt-bindings: rtc: Fix Xicor X1205 vendor prefix
      rtc: x1205: Fix Xicor X1205 vendor prefix
      dt-bindings: rtc: Convert apm,xgene-rtc to DT schema

Tóth János (1):
      rtc: sd2405al: Add I2C address.

Wolfram Sang (1):
      rtc: remove unneeded 'fast_io' parameter in regmap_config

Xianwei Zhao (1):
      rtc: amlogic-a4: Optimize global variables

 .../devicetree/bindings/rtc/apm,xgene-rtc.yaml     |  45 ++
 .../devicetree/bindings/rtc/isil,isl12057.txt      |  74 ----
 .../devicetree/bindings/rtc/nxp,pcf85063.yaml      |  10 -
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml |  40 +-
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |   6 +-
 .../devicetree/bindings/rtc/xgene-rtc.txt          |  28 --
 drivers/rtc/Kconfig                                |  38 +-
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/interface.c                            |  27 ++
 drivers/rtc/rtc-amlogic-a4.c                       |  14 +-
 drivers/rtc/rtc-cpcap.c                            |   1 +
 drivers/rtc/rtc-efi.c                              |  76 +---
 drivers/rtc/rtc-isl12022.c                         |   1 +
 drivers/rtc/rtc-meson.c                            |   1 -
 drivers/rtc/rtc-optee.c                            | 465 +++++++++++++++++++--
 drivers/rtc/rtc-pcf2127.c                          |  19 +-
 drivers/rtc/rtc-s3c.c                              |  49 +--
 drivers/rtc/rtc-s3c.h                              |  19 -
 drivers/rtc/rtc-sd2405al.c                         |   4 +-
 drivers/rtc/rtc-spacemit-p1.c                      | 167 ++++++++
 drivers/rtc/rtc-tps6586x.c                         |   1 +
 drivers/rtc/rtc-x1205.c                            |   2 +-
 drivers/rtc/rtc-zynqmp.c                           |  19 +
 23 files changed, 753 insertions(+), 354 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/apm,xgene-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12057.txt
 delete mode 100644 Documentation/devicetree/bindings/rtc/xgene-rtc.txt
 create mode 100644 drivers/rtc/rtc-spacemit-p1.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

