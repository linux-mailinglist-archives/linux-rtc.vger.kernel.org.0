Return-Path: <linux-rtc+bounces-4661-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D62B20187
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 10:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 001C91717BC
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005BC2DAFC0;
	Mon, 11 Aug 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g1/++lYL"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969AB217F24;
	Mon, 11 Aug 2025 08:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900184; cv=none; b=o2YgnWHjiUE8zvqnLUx9JRumQHHa7feecxiU7HAnJ0T+m42A2azjplvPx8nwo4JqK2PZ0wLRUpCNVhmd93ROonNogXMUx0tlAKgr+HvtYw464lQ6fc5hQUbkAsMbsy4KxMd4dTmlcWetvqI3b/tTKUBQSieLi3k4vrTeX4sUo7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900184; c=relaxed/simple;
	bh=n7CH/yu8a6YC3VFATMACJXJ8l67gHGodj6pyuiJFpps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jF9viUy46kfE/kj/99ttTmsanDL4wHe/9o6N5Qr0a9iPYO9U/4NPHLlQU9tPMjvnpgc90LLoFqsIJaBgrjcRZgrtv+hFEEQte4DtzDkROI8r4qhvI1JjK4cLcrExLzQGdhW5LV2zQuMb66bPw3Pe8qiBPFSqy3RGi7iedv7WiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g1/++lYL; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6bd8d038768b11f0b33aeb1e7f16c2b6-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a7Dr6EHXZb1zZv1XZgN30AHSOXgaHs9rJ38l2ZynADk=;
	b=g1/++lYLKYzRew9XOFMgGCDfBxHOScAqVNTsRfYA7EZ4jmFW99/QcIrVyGBLtJWriK9hwm9XeQCVT51uqcTpU2H+BDxQ/ppmiidBzI6eEgIHX0opVerX+Gy0NPZw3rr6V3Eu7raXBnayMTJ8qZj17rSe6GneHcuaFrMwMrae3Kw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:0bd8d0f1-8fc6-4d3f-aa57-e76c7ca7292a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:dda74da1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6bd8d038768b11f0b33aeb1e7f16c2b6-20250811
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1586326287; Mon, 11 Aug 2025 16:16:03 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:15:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:55 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU register
Date: Mon, 11 Aug 2025 16:15:33 +0800
Message-ID: <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

This patch adds new bit definitions for the RTC_BBPU register in the
mt6397 RTC header file. The following bit definitions are introduced:

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 include/linux/mfd/mt6397/rtc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 27883af44f87..001cef6b7302 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -15,8 +15,11 @@
 #include <linux/rtc.h>
 
 #define RTC_BBPU               0x0000
+#define RTC_BBPU_PWREN         BIT(0)
+#define RTC_BBPU_CLR           BIT(1)
+#define RTC_BBPU_RESET_AL      BIT(3)
 #define RTC_BBPU_CBUSY         BIT(6)
-#define RTC_BBPU_KEY            (0x43 << 8)
+#define RTC_BBPU_KEY           (0x43 << 8)
 
 #define RTC_WRTGR_MT6358       0x003a
 #define RTC_WRTGR_MT6397       0x003c
-- 
2.46.0


