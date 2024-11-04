Return-Path: <linux-rtc+bounces-2446-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 300789BB7AE
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 15:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C065A1F24272
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C350178CDE;
	Mon,  4 Nov 2024 14:25:50 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6C4C62E;
	Mon,  4 Nov 2024 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730350; cv=none; b=XY+WlD2zejNJ/wwLvRqrPujPMhglvhUlGY4Rbu4R3ZrfKgME2Q2ryGxpra4cdYeoMSx0VNitPI6TGMbpiWyC/JM2Jjdd5LkvCFMfKfd8ro5kbcWgFKgHS5yeRCjjup+HDHbzL/vBAyHqEGa5IUeG4GoOgpkQbpYaSPqazrHVm8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730350; c=relaxed/simple;
	bh=z0y+HaDyaSIYhvh+RIMunRAMXQMC7d3KvGn6esiCkpk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gRR4samDV6vpILHc3uLXfXSIRv+jBQvYCT1WLdSdfFWYm9iYCbeoTTmlyhGvjgcJKn0tv7LG10hekWrG5gDP0U6ko85EDjcMj/m6c6rmLH1W67Ke+x6CMfNzU0YNlA6SNoWSOapVZa94uS5d22XHt4iGJ2/T7v+7xjfSQkyinYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 4A4EPXwM062393
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 4 Nov 2024 22:25:33 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 22:25:33 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>,
        <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <tim609@andestech.com>
Subject: [PATCH V3 0/1] rtc: atcrtc100: Add andes atcrtc100 RTC driver
Date: Mon, 4 Nov 2024 22:25:20 +0800
Message-ID: <20241104142521.1100437-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 4A4EPXwM062393

The atcrtc100 module includes a real time counter with alarm.
Add a RTC driver for this function.

CL Wang (1):
  rtc: atcrtc100: Add driver for atcrtc100 RTC

 MAINTAINERS                 |   5 +
 drivers/rtc/Kconfig         |  15 ++
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-atcrtc100.c | 479 ++++++++++++++++++++++++++++++++++++
 4 files changed, 500 insertions(+)
 create mode 100644 drivers/rtc/rtc-atcrtc100.c

-- 
2.34.1


