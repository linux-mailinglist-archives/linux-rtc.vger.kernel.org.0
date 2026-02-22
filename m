Return-Path: <linux-rtc+bounces-6001-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM/QMPNcmmnxawMAu9opvQ
	(envelope-from <linux-rtc+bounces-6001-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 02:33:39 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D75E916E62D
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 02:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CAC23015143
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Feb 2026 01:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A42C286A7;
	Sun, 22 Feb 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NARpWJgm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB072770A;
	Sun, 22 Feb 2026 01:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771724014; cv=none; b=HEvmmqGomjmFKrVkZ7gIDkSVMoRNHszGv7OCM97U2oC8BHAvbe+Ynvs5deST3BVhnVxWLLNmDGRbv4Q3DAag0Gsa9M3ajHwYTLf8NyWZJugL7ZCINycLdvsIhxOXtb/Nd2l9hiueup2/YIfvfiKFuPcaVuJ6Q921eANC7Rb8zXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771724014; c=relaxed/simple;
	bh=PgMsUsk+Ewggq9glQtE3QATk9ugpYDGiFu9td9lbBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPw+FwxG7sIQqND+OIHpb64NK/c6AmysCiNjGrOnLaGC28HveJpFDpBSp5ToRAZsQuvwXAZEqAq1oEhkiiBEjru/2Xkobrl6VJ98LDhGdGa/ObWjb39pf7iuNhbhmJu/FB9AhAdiU/tK1KHSUe4LML9VyLz+Om2ID9/Tks2pQqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NARpWJgm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5389A1A10C9;
	Sun, 22 Feb 2026 01:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F23F45FB83;
	Sun, 22 Feb 2026 01:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91414103686F8;
	Sun, 22 Feb 2026 02:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771724008; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=ffySmP+0YskEb42LKsPYlHCfH9DSQO6FOL0ioZFF0Bs=;
	b=NARpWJgmIvsDW2WB2TzV2QkojRZxpzMdQZZBSPh1oF2gkVx3CpZFzIXUuYUyHFutk3u/LT
	ObZqOKeqoD17tUenjTGS6JgLqREv6ORSo/8PZk150YXaRVD82j28IfEGMVoEQ3AXuS0BKp
	ySt/mzRvqnaiZqufQ6zJeeOxt5wNXr/oZyGzGYsfHToE8X+25DuTroJgOQvNG+n5n+GHiO
	iEPzItFPZ3VYYffu6q+xlnk5gxTgDa/O0Qv+3PUu8/qY4GBpLBKn3jvHzC2hT0tCt7URqO
	CR+86/k3nDnQbuZ/sm+z3p/78HP96ybukSX+hgc4M/iusJKQqfLRSAy47IJ3/w==
Date: Sun, 22 Feb 2026 02:33:26 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 7.0
Message-ID: <202602220133264688bffa@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6001-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.local:mid]
X-Rspamd-Queue-Id: D75E916E62D
X-Rspamd-Action: no action

Hello Linus,

Here is the RTC subsystem pull request for 7.0. There are a few fixes
and improvement this cycle.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.0

for you to fetch changes up to 969c3cca0f3b88682cd833cee4cf01b0915629a3:

  rtc: ds1390: fix number of bytes read from RTC (2026-02-20 23:12:25 +0100)

----------------------------------------------------------------
RTC for 7.0

Drivers:
 - loongson: Loongson-2K0300 support
 - s35390a: nvmem support
 - zynqmp: rework calibration

----------------------------------------------------------------
Andreas Gabriel-Platschek (1):
      rtc: ds1390: fix number of bytes read from RTC

Anthony Pighin (Nokia) (1):
      rtc: interface: Alarm race handling should not discard preceding error

Binbin Zhou (3):
      dt-bindings: rtc: loongson: Correct Loongson-1C interrupts property
      dt-bindings: rtc: loongson: Document Loongson-2K0300 compatible
      rtc: loongson: Add Loongson-2K0300 support

Jinjie Ruan (1):
      rtc: class: Remove duplicate check for alarm

John Keeping (1):
      rtc: pcf8563: use correct of_node for output clock

Lorenz Brun (1):
      rtc: s35390a: implement nvmem support

Ovidiu Panait (1):
      dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2N support

Peter Robinson (1):
      rtc: nvvrs: Add ARCH_TEGRA to the NV VRS RTC driver

Randy Dunlap (1):
      rtc: max31335: use correct CONFIG symbol in IS_REACHABLE()

Rouven Czerwinski (1):
      rtc: optee: simplify OP-TEE context match

Sebastian Andrzej Siewior (1):
      rtc: amlogic-a4: Remove IRQF_ONESHOT

Svyatoslav Ryhel (1):
      dt-bindings: rtc: cpcap: convert to schema

Tomas Melin (5):
      rtc: zynqmp: correct frequency value
      rtc: zynqmp: check calibration max value
      rtc: zynqmp: rework read_offset
      rtc: zynqmp: rework set_offset
      rtc: zynqmp: use dynamic max and min offset ranges

 .../devicetree/bindings/rtc/cpcap-rtc.txt          | 18 ------
 .../devicetree/bindings/rtc/loongson,rtc.yaml      | 13 ++++
 .../bindings/rtc/motorola,cpcap-rtc.yaml           | 32 +++++++++
 .../devicetree/bindings/rtc/renesas,rz-rtca3.yaml  |  5 +-
 drivers/rtc/Kconfig                                |  1 +
 drivers/rtc/class.c                                |  2 +-
 drivers/rtc/interface.c                            |  2 +-
 drivers/rtc/rtc-amlogic-a4.c                       |  2 +-
 drivers/rtc/rtc-ds1390.c                           |  2 +-
 drivers/rtc/rtc-loongson.c                         | 71 +++++++++++++-------
 drivers/rtc/rtc-max31335.c                         |  6 +-
 drivers/rtc/rtc-optee.c                            |  5 +-
 drivers/rtc/rtc-pcf8563.c                          |  2 +-
 drivers/rtc/rtc-s35390a.c                          | 32 +++++++++
 drivers/rtc/rtc-zynqmp.c                           | 75 ++++++++++++----------
 15 files changed, 179 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

