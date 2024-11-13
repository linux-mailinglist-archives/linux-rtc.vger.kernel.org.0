Return-Path: <linux-rtc+bounces-2553-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4A9C785C
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 17:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DBDAB45C26
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Nov 2024 15:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B001984D13;
	Wed, 13 Nov 2024 15:41:25 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECE77C0BE;
	Wed, 13 Nov 2024 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512485; cv=none; b=SgiegWXbhZp//9467DzSbOOKt+5E+eSLBcprl6YtYkEIb2DyG7utJgcmcIpl8DkNFrJHO92HB+8rpQCGWSZIdMRGE/ePNorOPqqisOgpUMg+G9nYJE6HprfZ4wVmFYq9xyIh2I6iG+3BShlRf/ywlhwHjwnnELPFsGh6E7qNVUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512485; c=relaxed/simple;
	bh=aCyWqRR7Z4mcUqj/A8Y4MyXMkwJKWTVPKB+KRVX8c8s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HihAhxnfLRZW20QR0KzOACXbFgCyW3DHe/N5RuseIM7LKLGtKPO4VDDYHqRSrLCS0IJ+HKSjnrT2XkR+bi/WRi/5DgxvM13DUSuPu8oskvSu3ozlI7uCpqfmNrVIwKEIsmte+OzBww0GPs5pc4k+usUlNSGw6GFtcUif5hSdKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 4ADF85Yw090418;
	Wed, 13 Nov 2024 23:08:05 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4ADF7akd090250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 13 Nov 2024 23:07:36 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 23:07:37 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH V4 0/3] rtc: atcrtc100: Add Andes ATCRTC100 RTC driver
Date: Wed, 13 Nov 2024 23:06:50 +0800
Message-ID: <20241113150653.1793123-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 4ADF85Yw090418

The Andes ATCRTC100 module includes a real time counter with alarm.
Add a RTC driver for this function.

CL Wang (3):
  rtc: atcrtc100: Add ATCRTC100 RTC driver
  dt-bindings: rtc: Add support for ATCRTC100 RTC
  MAINTAINERS: Add entry for ATCRTC100 RTC driver

 .../bindings/rtc/andestech,atcrtc100.yaml     |  43 ++
 MAINTAINERS                                   |   6 +
 drivers/rtc/Kconfig                           |  15 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-atcrtc100.c                   | 524 ++++++++++++++++++
 5 files changed, 589 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

-- 
2.34.1


