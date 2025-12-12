Return-Path: <linux-rtc+bounces-5532-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DF8CB9FBE
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Dec 2025 23:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9833051618
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Dec 2025 22:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D37285CA9;
	Fri, 12 Dec 2025 22:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lCYoYFVh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87E3B8D4B;
	Fri, 12 Dec 2025 22:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765579724; cv=none; b=uLzu7b1CCetXYLEUSKK1CnRoQakf0D+L6R/Obp1ZHNV1fpj0jRyEiVHLh7t6Vn1khUdOhR9gt9BoYObSUrB1xqrAwFBMNNOEuTXDNz2b5TJzvFnoJAC6JXFcSe7sgMYNeNhvvgK3yvtTwv5khx4IfkuWhXi0ylhoQCW7Us6anw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765579724; c=relaxed/simple;
	bh=7h2u0dz0pzpb+zjOZgqVF+mUN3l2ic2vK4N5YV26ZvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQlvjaY8h+p06CqehixjfuCaTk6OR1v4eAWLvCeqmmq+CgKRi79QsC6C867HhbdWpjLrOVtHCatl5snQgk1+BYivbtO2PyY5vLK69hKugUnxStFDDq4PoH7dsAu8a3gZ8L40rJE8OvCc07VArQnUmJTEkhWA3L3RR/yeH8re9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lCYoYFVh; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 840A04E41BBC;
	Fri, 12 Dec 2025 22:48:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45EEF606DF;
	Fri, 12 Dec 2025 22:48:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE8C103C8D89;
	Fri, 12 Dec 2025 23:48:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765579715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=4aSaq2ADXZWgZhyL4JngaC7MC3SGOA6Hc01oMQ0WmPY=;
	b=lCYoYFVh1VB8xhNQp8EEB9/g+eyu2GQzWncsxEqX56vIwHTRzg6hWFIsnXt75UntpS9exu
	vKklWbsgKHrJd+dfiK0gPLC7UyNkhP7c51s+hVfvaW4B6bT72BFH3Q32G3CIofGI3p8ynG
	oeYDKUnBFygH7ORXbmh20dFqLvKlDOE/2ea1i4HHFwJNbJXJprxWqstX81CDnvbGdG38DG
	pZRrZtQf3u/MvOPVIlp3D3RaltrEFlnCinor/+PanspAg9zAGXjTI85UmlxNKph4se3YvQ
	HZDXOEFjy7Ax4rd3BtW9lttmP8ozbuzC5v+01qFO0ghWv9wjvZk4nH915iQtCg==
Date: Fri, 12 Dec 2025 23:48:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 6.19
Message-ID: <2025121222483455e77b38@mail.local>
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

Here is the RTC subsystem pull request for 6.19. We have three new
drivers this cycle, they account for the majority of the added lines.
I may send you a few fixes after the merge windows as I still need to
review them.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.19

for you to fetch changes up to 16bd954c93360145bc77cc601e350913fc28182d:

  rtc: spacemit: MFD_SPACEMIT_P1 as dependencies (2025-12-08 23:02:10 +0100)

----------------------------------------------------------------
RTC for 6.19

Subsystem:
 - stop setting max_user_freq from the individual drivers as this has not been
   hardware related for a while

New drivers:
 - Andes ATCRTC100
 - Apple SMC
 - Nvidia VRS

Drivers:
 - renesas-rtca3: add RZ/V2H support
 - tegra: add ACPI support

----------------------------------------------------------------
Akhilesh Patil (1):
      rtc: isl12026: Add id_table

Akiyoshi Kurita (1):
      Documentation: ABI: testing: Fix "upto" typo in rtc-cdev

Alexander Kurz (1):
      rtc: Kconfig: add MC34708 to mc13xxx help text

Alexandre Belloni (12):
      rtc: amlogic-a4: simplify probe
      rtc: sa1100: stop setting max_user_freq
      rtc: ds1685: stop setting max_user_freq
      rtc: pic32: stop setting max_user_freq
      rtc: renesas-rtca3: stop setting max_user_freq
      rtc: rv3028: stop setting max_user_freq
      rtc: rv3032: stop setting max_user_freq
      rtc: rv8803: stop setting max_user_freq
      rtc: rx6110: stop setting max_user_freq
      rtc: rx8010: stop setting max_user_freq
      rtc: rx8025: stop setting max_user_freq
      rtc: sh: stop setting max_user_freq

CL Wang (3):
      dt-bindings: rtc: Add support for ATCRTC100 RTC
      MAINTAINERS: Add entry for ATCRTC100 RTC driver
      rtc: atcrtc100: Add ATCRTC100 RTC driver

Dan Carpenter (1):
      rtc: atcrtc100: Fix signedness bug in probe()

Haotian Zhang (2):
      rtc: amlogic-a4: fix double free caused by devm
      rtc: gamecube: Check the return value of ioremap()

Hector Martin (1):
      rtc: Add new rtc-macsmc driver for Apple Silicon Macs

Kartik Rajput (3):
      rtc: tegra: Use devm_clk_get_enabled() in probe
      rtc: tegra: Add ACPI support
      rtc: tegra: Replace deprecated SIMPLE_DEV_PM_OPS

Lukas Bulwahn (1):
      MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER

Nick Huang (1):
      rtc: s35390a: use u8 instead of char for register buffer

Nuno Sá (1):
      rtc: max31335: Fix ignored return value in set_alarm

Ovidiu Panait (2):
      dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
      rtc: renesas-rtca3: Add support for multiple reset lines

Shubhi Garg (2):
      dt-bindings: rtc: Document NVIDIA VRS RTC
      rtc: nvvrs: add NVIDIA VRS RTC device driver

Sven Peter (1):
      dt-bindings: rtc: Add Apple SMC RTC

Troy Mitchell (1):
      rtc: spacemit: MFD_SPACEMIT_P1 as dependencies

 Documentation/ABI/testing/rtc-cdev                 |   2 +-
 .../devicetree/bindings/mfd/apple,smc.yaml         |   9 +
 .../bindings/rtc/andestech,atcrtc100.yaml          |  43 ++
 .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 ++
 .../devicetree/bindings/rtc/nvidia,vrs-10.yaml     |  59 +++
 .../devicetree/bindings/rtc/renesas,rz-rtca3.yaml  |  46 +-
 MAINTAINERS                                        |  15 +
 drivers/rtc/Kconfig                                |  41 +-
 drivers/rtc/Makefile                               |   3 +
 drivers/rtc/rtc-amlogic-a4.c                       |  32 +-
 drivers/rtc/rtc-atcrtc100.c                        | 381 +++++++++++++++
 drivers/rtc/rtc-ds1685.c                           |   3 -
 drivers/rtc/rtc-gamecube.c                         |   4 +
 drivers/rtc/rtc-isl12026.c                         |   7 +
 drivers/rtc/rtc-macsmc.c                           | 140 ++++++
 drivers/rtc/rtc-max31335.c                         |   6 +-
 drivers/rtc/rtc-nvidia-vrs10.c                     | 542 +++++++++++++++++++++
 drivers/rtc/rtc-pic32.c                            |   2 -
 drivers/rtc/rtc-renesas-rtca3.c                    |   3 +-
 drivers/rtc/rtc-rv3028.c                           |   2 -
 drivers/rtc/rtc-rv3032.c                           |   2 -
 drivers/rtc/rtc-rv8803.c                           |   2 -
 drivers/rtc/rtc-rx6110.c                           |   2 -
 drivers/rtc/rtc-rx8010.c                           |   1 -
 drivers/rtc/rtc-rx8025.c                           |   2 -
 drivers/rtc/rtc-s35390a.c                          |  18 +-
 drivers/rtc/rtc-sa1100.c                           |   3 -
 drivers/rtc/rtc-sh.c                               |   1 -
 drivers/rtc/rtc-tegra.c                            |  45 +-
 include/linux/rtc/ds1685.h                         |   1 -
 30 files changed, 1352 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
 create mode 100644 drivers/rtc/rtc-atcrtc100.c
 create mode 100644 drivers/rtc/rtc-macsmc.c
 create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

