Return-Path: <linux-rtc+bounces-2872-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124EDA08CA9
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 10:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B4093AA4D2
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 09:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1174B20FA86;
	Fri, 10 Jan 2025 09:40:56 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4B20ADFF;
	Fri, 10 Jan 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502055; cv=none; b=dbguRzkdEGIY1eg9u3sCiUd7QE3W/oOX2wT+qnBvKA+3A2J9GyJySI+6yZ+8f/JZBBfvu0eeDwf8YtNvhahrPtYCrkGG1++1W+TE9Vor97BbdCrXFdqRNEZ0Rvcy8oP7V0mDNUl4ZVmB3Carhemwgnjb5b3BqZjCY4M3EJfmjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502055; c=relaxed/simple;
	bh=2rbs1zlM6XF0oe/JUguXhXIcrvk/vxx3JYfOg8HE/YQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSKqAq+9QyVdrS2PrBTxpbMbqaQ55rdZ8SYsKa5MFjzULFudnYHFkkMvG2PBE8rIfZR1UXYtbraQ5JlWboR9150i4vpUYmAkRbNq2jybOORUnarmr08MWI8tMU02jTL5fRk8pWCpABoB5HnPdJVbhrhb4lq2xw17gl4EyfOV5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 50A9Rlwo046145;
	Fri, 10 Jan 2025 17:27:47 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 50A9RQ9n045918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Jan 2025 17:27:26 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Jan
 2025 17:27:26 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>,
        <ycliang@andestech.com>
Subject: [PATCH V5 3/3] MAINTAINERS: Add entry for ATCRTC100 RTC driver
Date: Fri, 10 Jan 2025 17:27:02 +0800
Message-ID: <20250110092702.1146356-4-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110092702.1146356-1-cl634@andestech.com>
References: <20250110092702.1146356-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 50A9Rlwo046145

Add support entry for the Andes ATCRTC100 RTC driver in the MAINTAINERS file.

Signed-off-by: CL Wang <cl634@andestech.com>

---
Changes for v3:
 - Initial entry for the ATCRTC100 RTC driver.

Changes for v4:
 - No changes

Changes for v5:
 - Rebased onto the latest commit in rtc-next. No changes to the
   content itself.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..b1c4143a3366 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3588,6 +3588,12 @@ F:	drivers/power/reset/atc260x-poweroff.c
 F:	drivers/regulator/atc260x-regulator.c
 F:	include/linux/mfd/atc260x/*
 
+ATCRTC100 RTC DRIVER
+M:	CL Wang <cl634@andestech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/rtc/andestech,atcrtc100.yaml
+F:	drivers/rtc/rtc-atcrtc100.c
+
 ATHEROS 71XX/9XXX GPIO DRIVER
 M:	Alban Bedel <albeu@free.fr>
 S:	Maintained
-- 
2.34.1


