Return-Path: <linux-rtc+bounces-1336-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3888990A8A3
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 10:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF5A1F21D19
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Jun 2024 08:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C320519048E;
	Mon, 17 Jun 2024 08:38:53 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9319048B
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 08:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718613533; cv=none; b=XOZqjQrVdkUg9lXVTxBzwhKUajqlFFCY1aNlUEGPbZPyvsuK1BFOi36vcKJmhPZAxlkqFzvUCawgorMgJxmytl1/NWxalD6KRpXjCgLqH0eDFlPLdSFLPXc0bRdUF9BMqPRUGGo3ujxgHfb0vP2e2GRfWBFFSJ1smG8K9MSV7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718613533; c=relaxed/simple;
	bh=ZDCLbmn3b/L6Hrzdy1JQU2n72TNOVOItwY0Wpp9htug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VqWVEJcq11eCI4hwSV2qwoMloB6K61YcKpmSoWcbaKi/b3PXTSMCCCvjOz12SQcuN3H+2I/roRmpllld85m1StNynLow5fjjcOm+edNraRY9kD+IpWqhPhpYARuG2aZmtp0U1wCpMWGLAzNvxFaUnUem6k8QmmDnyf+FdVWuHmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 45H8Pgqu079768
	for <linux-rtc@vger.kernel.org>; Mon, 17 Jun 2024 16:25:42 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTP id 45H8PDau079681;
	Mon, 17 Jun 2024 16:25:13 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 16:25:14 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
        <linux-rtc@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V2 0/2] Add andes atcrtc100 RTC driver
Date: Mon, 17 Jun 2024 16:25:05 +0800
Message-ID: <20240617082507.3968910-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 45H8Pgqu079768

CL Wang (2):
  dt-bindings: rtc: atcrtc100: Add atcrtc100 bindings
  rtc: atcrtc100: Add andes atcrtc100 RTC driver

Notes:
    Change from v1 to v2
    - Use devm_xxx to allocate system resources instead of some old functions like ioremap.
    - Use regmap_xxx to access RTC hardware registers instead of ioread32 and iowrite32.
    - Remove the atc_rtc_remove function as it is no longer needed.
    - Update the module author and remove MODULE_ALIAS.

 .../bindings/rtc/andes,atcrtc100-rtc.yaml     |  39 ++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-atcrtc100.c                   | 457 ++++++++++++++++++
 4 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/andes,atcrtc100-rtc.yaml
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

-- 
2.34.1


