Return-Path: <linux-rtc+bounces-2870-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D2A08C89
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 10:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0773A959C
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 09:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AF20C010;
	Fri, 10 Jan 2025 09:40:45 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEDD209F26;
	Fri, 10 Jan 2025 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502045; cv=none; b=cY0o9Pnm3etu9mBM5WgDnN+BdlQzA3EjOSVCgOKY/bB5mh1TyTW6Puq6gk6/A38m0T2YR9fRwgc01FwvPIpckl7/j8dnRZXZgpmZiKmiltx8nwiBJTUurqk7xRu7Ib7UI2PXQxHGjhU+ec5V3NtJ1nRh+p3UEBXC5x9IDdfQeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502045; c=relaxed/simple;
	bh=4RfBH+/hDIwa6EG9/fVm+faAf8MVbRcqvwmzOHpPNAY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvQrAxh08kMuVDKu/UOWHUbVH1N1KBzJkdf/ZoGuIrfQDqujRXiesRT17EJNV32wavq1ThQOncM/my90Kdw2NWy0pUg7CQBXTqMXEUSiS+1FQLYJB5xmgaTJuMxizWkqlyeEJNUzEQ5gH2nZc7eY8Iqw3VtSen4iZ+4/kjnzr+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 50A9RhmT046113;
	Fri, 10 Jan 2025 17:27:43 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 50A9RAfD045797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Jan 2025 17:27:10 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 17:27:10 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        <ycliang@andestech.com>
Subject: [PATCH V5 0/3] rtc: atcrtc100: Add Andes ATCRTC100 RTC driver
Date: Fri, 10 Jan 2025 17:26:59 +0800
Message-ID: <20250110092702.1146356-1-cl634@andestech.com>
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
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 50A9RhmT046113

This patch series adds support for the Andes ATCRTC100 Real-Time Clock. 

The series is now based on the rtc-next branch from:
git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git.

This V5 patch series is built upon the V4 series and has been rebased
exclusively onto the latest commit in the rtc-next branch, which
corresponds to Linux 6.13-rc1."

For details of the change log, please refer to the commit log of each patch.

Please kindly review.

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


