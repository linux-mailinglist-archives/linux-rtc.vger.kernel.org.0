Return-Path: <linux-rtc+bounces-4903-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CAB56EC3
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 05:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D371896D5D
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 03:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBA32E0928;
	Mon, 15 Sep 2025 03:15:32 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5ADE2877EE;
	Mon, 15 Sep 2025 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757906132; cv=none; b=hW7hb29OT6Zd6+dRgJ/eRv9SFcvJHjOPOV3Cqlls+7wt5znKJYYRdIX0sC0fm+Sl2kFm9Z6R4rCPh9EnhaB33bdGXSjs238WHCgd1jaYbgfnz+kn613EvjFBp9Zw5TNCCroB6Z/1Nryt8a4pvVFt/yazu0Bl0KPxYvDmlNUf2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757906132; c=relaxed/simple;
	bh=XtoOO9aaJxCxtPLFE9BM6dvfKOszGAPZ3NXBKmn0yt4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CGurW1zZubB7lLcH8i1SUQrHbQb4xm8dseTxxRcp5QEe4XhNsuqKnldJfSMFvtqn/K1qEgiIPqCzygrbvzyFSVdyOXiXbdUrJdZW+8E9PMONsiY4eV9zAKlLBwr7I70fKvGxbE1epqtQDYiprqMjY3udkLWCin1TYkCZJfTWGyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 58F3F35Q054594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 15 Sep 2025 11:15:03 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Sep
 2025 11:15:03 +0800
From: CL Wang <cl634@andestech.com>
To: <cl634@andestech.com>, <alexandre.belloni@bootlin.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <tim609@andestech.com>
Subject: [PATCH V6 2/3] MAINTAINERS: Add entry for ATCRTC100 RTC driver
Date: Mon, 15 Sep 2025 11:14:38 +0800
Message-ID: <20250915031439.2680364-3-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915031439.2680364-1-cl634@andestech.com>
References: <20250915031439.2680364-1-cl634@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 58F3F35Q054594

Add support entry for the Andes ATCRTC100 RTC driver in the
MAINTAINERS file.

Signed-off-by: CL Wang <cl634@andestech.com>

---
Changes for v6:
 - No changes

Changes for v5:
 - No changes

Changes for v4:
 - No changes

Changes for v3:
 - Initial entry for the ATCRTC100 RTC driver.
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 536befd32be8..55d809aa7f15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3810,6 +3810,12 @@ F:	drivers/power/reset/atc260x-poweroff.c
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


