Return-Path: <linux-rtc+bounces-4995-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD62B8CAD9
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 17:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497C718969AB
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 15:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB421E1DF0;
	Sat, 20 Sep 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="aVizHqSz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F32BCF45
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758380466; cv=none; b=RwyFLiZNc/c7vy+LBhQMlTm9VTGER2zLaxImk+KOqmy0lFT0PCK9WxOT8exDwUR0N5NIj4MA7HAyPmn6e0D721xXWZ0Yq9bsTMzz6v10dQXtv8pHRLkGVI1ZSAND9gQuMha9dndMem3Om2LOj1pTGB7rFa6N6qn5x40V4QIi6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758380466; c=relaxed/simple;
	bh=VVnZVrjIfoL5fI97WzsCCEDJrZ+vbxnfi0I1HLSYLH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s5LHaQYXY5NeAnhlGoJTKUyROQFxUghPB1JGehuKgDPw/Km1eT+7EN0UqBI1B7QYPyBJf0k3LzkeddWk6kPXh+ZAfGQ4RAfZ6bD5mx57T/cHWHOkuAYlTDcemjiMHM1rVs/P5Uqk1kERnbK0C1J+rdafqlV3MHvOK+8PduMGr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=aVizHqSz; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id AEDE01080222
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 20:30:59 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in AEDE01080222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1758380459; bh=VVnZVrjIfoL5fI97WzsCCEDJrZ+vbxnfi0I1HLSYLH4=;
	h=Date:From:To:Cc:Subject:From;
	b=aVizHqSzSoM8isjtdWFdYH1H4tt3wBNohZTtnisgJRJlt/6jm0OszS4ormLRu2bZe
	 QaEN/xzD16GNhcNaVjr4RAoxSf2aTno/NqYS3zoGWZEW+ZKtcZmW7rVJVErhdbjmbv
	 qiDAYx0ByGvjqhsQMKQtmQ3QoiZ3v0qi83/Kw6Ms=
Received: (qmail 19121 invoked by uid 510); 20 Sep 2025 20:30:59 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.605369 secs; 20 Sep 2025 20:30:59 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 20 Sep 2025 20:30:54 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 5ABA63414E7;
	Sat, 20 Sep 2025 20:30:54 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id A479F1E814BD;
	Sat, 20 Sep 2025 20:30:53 +0530 (IST)
Date: Sat, 20 Sep 2025 20:30:48 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v3 0/6] rtc: m41t93: add new features alarm, clock out,
 watchdog
Message-ID: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
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
Changes in v3:
- Address comments on bindings from Krzysztof and add myself
as a maintainer.
- Re-validation/testing on top of v6.17-rc6
- Link to v2: https://lore.kernel.org/lkml/cover.1757510157.git.akhilesh@ee.iitb.ac.in/

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


