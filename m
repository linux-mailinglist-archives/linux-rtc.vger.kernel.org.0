Return-Path: <linux-rtc+bounces-4659-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D821B20183
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 10:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0968616100B
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Aug 2025 08:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DC526A1C4;
	Mon, 11 Aug 2025 08:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YRZLRaVk"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD9817DFE7;
	Mon, 11 Aug 2025 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900159; cv=none; b=D79TQN1hvsMpiRbeULNyqJPMLxiSJ2BAyInBQBRCXO166dBLEb6b3/4yAyNlQriNxkE7bmDY+0BzPuPZ/AicmBsEY5LYebZM515ehiWF03q3UeQf2Ny4OFi6mJPngTuFSINS96xSzPKfTyuhlrJtHxg6Y3G4MbFqrdFWiQVGRgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900159; c=relaxed/simple;
	bh=ql/YL0DP9otxbiBXSIvjCc/vrBIS+Tx9UF+Y6ciLShs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q+WB19rCtT16n6OBemhumnUcp4lIs5waOBGETZEowemY5Orjv40R01nfMt5ggUGQWznJxHeT75C9v9Y6C829gvipNyA73iEIVOuC0S+AXAoBsa6UOHbasWHxwdH/Fc4B+YXY/bxO1VISo1yVU9BsTZpAdW3Bvu9V8fvi96kETDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YRZLRaVk; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 637b8e9e768b11f08729452bf625a8b4-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P1bfhK0tMIfmTp+5QuGosThnSwzj5jHg/brpDeboWLI=;
	b=YRZLRaVkQxRhMqvXhwmkrj9VbnezfBroWyWP2Lv4iIftzOTzCmGbUIQGDPFxpD/kD0fOxIVUdz0/PiUVUK8U4f3rMGOhhdjG8/awmdZ1pR3zrCFGc/m+2eDrUkpoJjECPmV0xDxJRwj4YVwEWWeG8KICUN3RWmAzRnZ5aF9QPHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:e89bf790-3998-439c-afcc-897c9b96bdad,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:186f47ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 637b8e9e768b11f08729452bf625a8b4-20250811
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2115338471; Mon, 11 Aug 2025 16:15:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:15:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:41 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 0/2] rtc: Enhance RTC driver with BBPU bit definitions and shutdown handling
Date: Mon, 11 Aug 2025 16:15:32 +0800
Message-ID: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

(1) Add new bits definitions for RTC_BBPU register, 
(2) Add new functions to reset the BBPU alarm status in mt6397 RTC driver
(3) Add mtk_rtc_shutdown function to handle RTC shutdown events.

Shunxi Zhang (2):
  mfd: mt6397: Add new bit definitions for RTC_BBPU register
  rtc: mt6397: Add BBPU alarm status reset and shutdown handling

 drivers/rtc/rtc-mt6397.c       | 37 ++++++++++++++++++++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  3 +++
 2 files changed, 40 insertions(+)

-- 
2.45.2


