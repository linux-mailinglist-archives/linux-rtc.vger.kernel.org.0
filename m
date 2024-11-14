Return-Path: <linux-rtc+bounces-2558-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AE9C8C05
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 14:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 742E128A8D2
	for <lists+linux-rtc@lfdr.de>; Thu, 14 Nov 2024 13:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C437514A82;
	Thu, 14 Nov 2024 13:43:17 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04838370;
	Thu, 14 Nov 2024 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731591797; cv=none; b=KfLt6qjRiRBYIYtllx2TiZh6vt0t7Q94Kvo5xXDYTPMUBDnlIXXCCY1SPkN1I9xDgOnIiSW2yCg4XJweFU6cpq2nbh+b9b4QWZaNOqF1TF1tJhIusJ8SmRu/rR6wrIQWfKGzCZbPUmTK7LgNMfv0Sb9jDl2IYi1WjOFBoIFXgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731591797; c=relaxed/simple;
	bh=fBExKkfXjIOLlZH6DejtfOKoFw4BgWgmxhVwPFcEdBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AaA3SmQN1Jaw6VodTvEh3+EtlYVWTcPPg91DxKWc1b2VFGguO/mgUWOpLj11bMjjF0hvS5b7sYWT9vl2T29e46y8CXdYu8JJelJ2yhjCosCq4TT5LkNXZwsnfLnaHe/JWAHgfgpY5hBC5HjehWwuXu3WBXDabbc10Ja+jE7nj8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4AEDh073028508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 14 Nov 2024 21:43:00 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Nov
 2024 21:43:01 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <tim609@andestech.com>
Subject: [PATCH V4 RESEND 0/3] rtc: atcrtc100: Add Andes ATCRTC100 RTC driver
Date: Thu, 14 Nov 2024 21:42:51 +0800
Message-ID: <20241114134254.3500102-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 4AEDh073028508

The Andes ATCRTC100 module includes a real time counter with alarm.
Add a RTC driver for this module.

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


