Return-Path: <linux-rtc+bounces-4902-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CBB56EC2
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 05:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ABE917772C
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 03:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C8B2DF135;
	Mon, 15 Sep 2025 03:15:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F3285C99;
	Mon, 15 Sep 2025 03:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757906131; cv=none; b=PKBFrNoJfjuhsWp0T/Vanre81CEf68/ZIekrqEvTXUeglPVDr78o5FYKDCVn5/PTEioUIUPi7Ari8tC/4zPTm+4hhglqWYuu1I+bpnfwIxmJ6Wg777jjv7y853CWBqFTZwZpexvd/KjVH9jlI5wIcW/qmHwMu2mLmSwB4G5VBGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757906131; c=relaxed/simple;
	bh=Iu2l6KdXmnNDPuPcxq3As3iWuBU1Ubo+LZ7uBVAGcEU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rSM6R3RY4eeCBV/cgBUPmVBYG2eXiCUcA8hg5cWaZlWjv1QSWqsp4x3xWuMMWUQYJW95x4Mdknjebk/iKElDVWCe6U5xInnogt1gCfTbuuZ+jSM6ctk8ejICuo1danH8LtpDWMa6oiUOVfxYxKsQfoW4mCJwHwASQpPq5Q6rXTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 58F3Em4Y054290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 15 Sep 2025 11:14:48 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Sep
 2025 11:14:48 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH V6 0/3] rtc: atcrtc100: Add Andes ATCRTC100 RTC driver
Date: Mon, 15 Sep 2025 11:14:36 +0800
Message-ID: <20250915031439.2680364-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 58F3Em4Y054290

This patch series adds support for the Andes ATCRTC100 Real-Time Clock. 

The series is now based on the rtc-next branch from:
git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git.

This V6 patch series is built upon the V5 series and has been rebased
exclusively onto the latest commit in the rtc-next branch, which
corresponds to rtc-6.17."

For details of the change log, please refer to the commit log of each
patch.

Please kindly review.

CL Wang (3):
  dt-bindings: rtc: Add support for ATCRTC100 RTC
  MAINTAINERS: Add entry for ATCRTC100 RTC driver
  rtc: atcrtc100: Add ATCRTC100 RTC driver

 .../bindings/rtc/andestech,atcrtc100.yaml     |  43 ++
 MAINTAINERS                                   |   6 +
 drivers/rtc/Kconfig                           |  15 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-atcrtc100.c                   | 379 ++++++++++++++++++
 5 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

-- 
2.34.1


