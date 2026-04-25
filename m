Return-Path: <linux-rtc+bounces-6423-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AwGLDEK7WkEegAAu9opvQ
	(envelope-from <linux-rtc+bounces-6423-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 20:38:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06028467659
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 20:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E1D302E937
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 18:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84582374E59;
	Sat, 25 Apr 2026 18:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JWB/P219"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754DD378818
	for <linux-rtc@vger.kernel.org>; Sat, 25 Apr 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777142029; cv=none; b=pOMb/GKKzFn6d5ouQnkYCr3nG4hxfPb9TvhObLRYmENr83LvYSTsBOKK0O66PmjcXtVfroaDMghaEGCKXePeCsXXIvFgwh7o2YAIDRbABMCDamNxtxBBA4Ub+k6ip2CCGiJ3OuVUw33yLIC+R2dxCPVj6a3ka+OQqx5VyV6EOjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777142029; c=relaxed/simple;
	bh=3DT6syRUY81Xs9zbobclMMtv/BbkJiDi3sZympPFikc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NkH0eBMoGLQ4dfb8OY3W871itZiNcrMdIv4Gb+jVYUQIUShk6nO6isDgDrrMXWh2slotKoLLlCKnHlXK+JH2Iy4kUbXHML8HfYhQSWXpawFy8M9lXMnVAH/1W2i2NX+IAR1wS7dKeB4srd7UzNaVW977E31CJbOCVefxvEuS/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JWB/P219; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E154C1A3398
	for <linux-rtc@vger.kernel.org>; Sat, 25 Apr 2026 18:33:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C93860535;
	Sat, 25 Apr 2026 18:33:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 600D910720E6D;
	Sat, 25 Apr 2026 20:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777142017; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KsN82+eyAlBB08NGis4UWGxX+HqbpmXwfbOQVVNASAA=;
	b=JWB/P219hP40akXeqvpdbJjNkf5jx3EjQVZB2o+cBsnEHtzdlzawN3x8hkMdQW3YVmnEwB
	wvakskn+IYqnyMh196adLohDmpjxhKm+LaZrLHpvFIi9vdSfzA+DildApkokeychpbrqSo
	FyKGa2VFF0gxxZ3IyX3cUSgaHQUtmN6s5B/mDRCSAy2wxGKq/NciVk1vhfs2VYQv7rOVGF
	lYtL0t/J6trZbrrPb2lJutAAzxoW+faiQerk6PQ5G63vBSU6x7gA1M8EeAlk+/OKls+W7A
	KC3CUOPyl8DNMvxK0DKTXRJA52D4AV6wxV7Ps9aZXkHc5WViAb/n55KFqt0kmw==
Date: Sat, 25 Apr 2026 20:33:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC for 7.1
Message-ID: <20260425183335392f3a5c@mail.local>
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
X-Rspamd-Queue-Id: 06028467659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6423-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url]

Hello Linus,

Here is the RTC subsystem pull request for 7.1. It is super late, I
hoped I could squeeze a few more patches in but I didn't have the time.
It is quite small and half of the changes are in device tree bindings.

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.1

for you to fetch changes up to 0fedce7244e4b85c049ce579c87e298a1b0b811d:

  rtc: abx80x: Disable alarm feature if no interrupt attached (2026-04-13 00:02:59 +0200)

----------------------------------------------------------------
RTC for 7.1

Subsystem:
 - add data_race() in rtc_dev_poll()

Drivers:
 - remove i2c_match_id usage
 - abx80x: Disable alarm feature if no interrupt attached
 - ti-k3: support resuming from IO DDR low power mode

----------------------------------------------------------------
Akashdeep Kaur (1):
      rtc: ti-k3: Add support to resume from IO DDR low power mode

Andrew Davis (6):
      rtc: abx80x: Remove use of i2c_match_id()
      rtc: m41t80: Remove use of i2c_match_id()
      rtc: pcf2127: Remove use of i2c_match_id()
      rtc: rs5c372: Remove use of i2c_match_id()
      rtc: rv8803: Remove use of i2c_match_id()
      rtc: rx8025: Remove use of i2c_match_id()

Anthony Pighin (Nokia) (1):
      rtc: abx80x: Disable alarm feature if no interrupt attached

Anushka Badhe (1):
      dt-bindings: rtc: add olpc,xo1-rtc to trivial-rtc

Brian Masney (1):
      rtc: pic32: allow driver to be compiled with COMPILE_TEST

Conor Dooley (1):
      dt-bindings: rtc: mpfs-rtc: permit resets

Frieder Schrempf (1):
      dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply

Johan Hovold (1):
      rtc: ntxec: fix OF node reference imbalance

Mauricio Faria de Oliveira (1):
      rtc: add data_race() in rtc_dev_poll()

Otto Pflüger (1):
      dt-bindings: rtc: sc2731: Add compatible for SC2730

Piyush Patle (1):
      dt-bindings: rtc: isl12026: convert to YAML schema

Rafael J. Wysocki (1):
      rtc: cmos: Use platform_get_irq_optional() in cmos_platform_probe()

Rosen Penev (1):
      rtc: armada38x: zalloc + calloc to single allocation

Svyatoslav Ryhel (1):
      rtc: max77686: convert to i2c_new_ancillary_device

 .../devicetree/bindings/rtc/isil,isl12026.txt      | 28 ----------
 .../devicetree/bindings/rtc/isil,isl12026.yaml     | 59 ++++++++++++++++++++++
 .../bindings/rtc/microchip,mpfs-rtc.yaml           |  3 ++
 .../bindings/rtc/microcrystal,rv3028.yaml          |  2 +
 .../devicetree/bindings/rtc/olpc-xo1-rtc.txt       |  5 --
 .../devicetree/bindings/rtc/sprd,sc2731-rtc.yaml   |  7 ++-
 .../devicetree/bindings/rtc/trivial-rtc.yaml       |  2 +
 drivers/rtc/Kconfig                                |  2 +-
 drivers/rtc/dev.c                                  | 11 +++-
 drivers/rtc/rtc-abx80x.c                           |  5 +-
 drivers/rtc/rtc-armada38x.c                        |  9 +---
 drivers/rtc/rtc-cmos.c                             | 13 ++++-
 drivers/rtc/rtc-m41t80.c                           |  8 +--
 drivers/rtc/rtc-max77686.c                         | 14 ++++-
 drivers/rtc/rtc-ntxec.c                            |  2 +-
 drivers/rtc/rtc-pcf2127.c                          | 23 +++------
 drivers/rtc/rtc-rs5c372.c                          |  7 +--
 drivers/rtc/rtc-rv8803.c                           |  8 +--
 drivers/rtc/rtc-rx8025.c                           |  4 +-
 drivers/rtc/rtc-ti-k3.c                            | 10 +++-
 20 files changed, 132 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12026.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/isil,isl12026.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

