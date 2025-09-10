Return-Path: <linux-rtc+bounces-4852-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB9FB51854
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 15:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81508560C1F
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Sep 2025 13:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6CA21D5BC;
	Wed, 10 Sep 2025 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="RNP6Tu6K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD0218AB9
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512351; cv=none; b=jIKhTF5eM1SGyEA7j2Y2K7ZzLOTv7X+w4ivWBv5d7RkxGvMqCouWljlxett6CPXaCmL91pn/GziqT8zTlpdZglmYNLJ7HhCRjAZMgB6EQ+HyeGcyB2ChnO3KvqBI+2mnqLF8cb0LOk6rNjvnoovaNtXO4H0/VQT5SZehmG/F3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512351; c=relaxed/simple;
	bh=2dbjA/3olzd+QMHYz4UiuHRdvT0/b5KhrTMMWsmdV6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oe4s0+INydWRSWBlJ+kkf04rw2PG3FI1ShKuwQ0K5aSm11eNthm4V6YSNcxd/b/rjgEnEshxcp04Yc8p2OASUt5ng6Y+9uCFhuqwBoM8+EYeZ1bYlancmF36V5+pXNdhsvdHyCKAsw7WHXJTwGVWXYwjvNMhT5PkyHxad1qKZS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=RNP6Tu6K; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id B1F821012CE0
	for <linux-rtc@vger.kernel.org>; Wed, 10 Sep 2025 19:22:16 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in B1F821012CE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1757512336; bh=2dbjA/3olzd+QMHYz4UiuHRdvT0/b5KhrTMMWsmdV6M=;
	h=Date:From:To:Cc:Subject:From;
	b=RNP6Tu6KZhzMC3LmubXRzsf7BAqMiNV956srT8YGgAiwoUSIVBTWgmvfDeIHzmRR9
	 ch5bgI0chLUlkdxrUMKMiZ3cHVYdx3A5WTt1PV9w7QR5nojZF5ySxWX4fCs/vZJWr9
	 iP13WbknkfCxcZGVSqwSadWbZDdrwJTPcyUsDeu0=
Received: (qmail 31463 invoked by uid 510); 10 Sep 2025 19:22:16 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 5.204798 secs; 10 Sep 2025 19:22:16 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 10 Sep 2025 19:22:11 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id B5281360036;
	Wed, 10 Sep 2025 19:22:10 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 836041E813E1;
	Wed, 10 Sep 2025 19:22:09 +0530 (IST)
Date: Wed, 10 Sep 2025 19:22:04 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v2 0/6] rtc: m41t93: add new features alarm, clock out,
 watchdog
Message-ID: <cover.1757510157.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch series adds following to m41t93 rtc driver.

Functionalities: 
- Alarm support (support to configure alarm 1)
- Square wave output support
- Watchdog support

Code improvements:
this series migrates existing driver to use standard regmap interface
for spi instead of direct spi calls and uses regmap for new features.

Device tree support:
Adds device tree support to the driver along with binding documentation.

Testing:
This patch series is validated on TI am62x board with m41t93 rtc chip
connected to spi0 bus.
regmap migration is additionally tested by observing spi transfers
with the help of logic analyzer. Short summary of test flow is added in
commit message of respective features.

Datasheet:
https://www.st.com/resource/en/datasheet/m41t93.pdf

patch 4 to 6 depend on patch 3 (regmap patch)

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
Changes in v2:
- Address DTS and bindings coding style feedback from Krzysztof
- Verify bindings using $ make dt_binding_check 
- Update example in binding documentation after testing.
- Analyze and Fix build warnings as suggested by kernel test robot.
- Drop patch 5 from series (device detect logic change).
  This will be taken separately. Focus on functionalities in this series.
- Update commit messages with short test steps for each feature.
- Link to v1: https://lore.kernel.org/lkml/cover.1756908788.git.akhilesh@ee.iitb.ac.in/
---
Akhilesh Patil (6):
  dt-bindings: rtc: Add ST m41t93
  rtc: m41t93: add device tree support
  rtc: m41t93: migrate to regmap api for register access
  rtc: m41t93: Add alarm support
  rtc: m41t93: Add square wave clock provider support
  rtc: m41t93: Add watchdog support

 .../devicetree/bindings/rtc/st,m41t93.yaml    |  50 ++
 drivers/rtc/rtc-m41t93.c                      | 488 ++++++++++++++++--
 2 files changed, 486 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml

-- 
2.34.1


