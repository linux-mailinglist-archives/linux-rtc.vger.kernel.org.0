Return-Path: <linux-rtc+bounces-4809-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A4B423B9
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812351BC12BB
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59EE1482E8;
	Wed,  3 Sep 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="E5Zro3jM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C771A288
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909834; cv=none; b=UTVFfezLxAWHMdVsxRNoLjxrtXNij76rHQTsKs5GKyYckMQS+quCDnn21qeacr5mwMulWKp/xpCfBDM9OF9njzNEIbszZ1Mt63K607r9HP+68Zg9swSBKZ3ScabWgBRMTMw8c3taddMiMZJO+UVTECkoWweGBmI0LdTaXV96Dw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909834; c=relaxed/simple;
	bh=8W3N0rduFyxn66fNF2DYTMrnkR7Rdkbspz+xyu5B9l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRqb9iU0Kfab4AmIKVv4QvJcm2AOTGZIbnQJ5nNnndSfDYFcp6nehKKGp2WSP8WU0LqFZSREoUffwnZSEcz2KENd9C9uSXKBKN7gNv7gaclCYSWJGn+BzyGD8hhHOmShwouBvi8YYns7jFRjTgp5VTC1HcarSrPytr1iqY69nW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=E5Zro3jM; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 95BFE1015C69
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:54:00 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 95BFE1015C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909440; bh=8W3N0rduFyxn66fNF2DYTMrnkR7Rdkbspz+xyu5B9l0=;
	h=Date:From:To:Cc:Subject:From;
	b=E5Zro3jM2Lc3UVGB2qxb1S7U+eictojxl1doJXJ/uXAsO45XM3nMSeMsoC4d1gIKp
	 iQUypBSQAapsIBgFnBHx4ULhSr2ezixTU0COBdhF2SlyX8Qnbb4E9r6sz+VP5f+BR8
	 FKMMw81a63ZN+UKtDb6bgKpA4QLZjg/iUwZj5H2w=
Received: (qmail 20211 invoked by uid 510); 3 Sep 2025 19:54:00 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.206997 secs; 03 Sep 2025 19:54:00 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 3 Sep 2025 19:53:57 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id B0CDF360036;
	Wed,  3 Sep 2025 19:53:56 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 1A9531E8143E;
	Wed,  3 Sep 2025 19:53:56 +0530 (IST)
Date: Wed, 3 Sep 2025 19:53:49 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 0/7] rtc: m41t93: add new features alarm, clock out, watchdog
Message-ID: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
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

Bug fix: 
Fixes device probe issue after power-on due to incorrect assumptions of
reset values of the registers.

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

patch 4 to 7 depend on patch 3 (regmap patch)

Regards,
Akhilesh

Akhilesh Patil (7):
  rtc: m41t93: add device tree support
  dt-bindings: rtc: add bindings for m41t93
  rtc: m41t93: migrate to regmap api for register access
  rtc: m41t93: Add alarm support
  rtc: m41t93: fix device connection/detection logic during probe
  rtc: m41t93: Add square wave clock provider support
  rtc: m41t93: Add watchdog support

 .../devicetree/bindings/rtc/st,m41t93.yaml    |  43 ++
 drivers/rtc/rtc-m41t93.c                      | 489 ++++++++++++++++--
 2 files changed, 479 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/st,m41t93.yaml

-- 
2.34.1


