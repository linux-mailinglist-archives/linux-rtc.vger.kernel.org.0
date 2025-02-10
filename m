Return-Path: <linux-rtc+bounces-3132-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0BDA2E3D9
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 06:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28180166B18
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Feb 2025 05:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA08192D8E;
	Mon, 10 Feb 2025 05:58:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A452F2E;
	Mon, 10 Feb 2025 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167092; cv=none; b=RNlB4qdwT4M2GSOWbVVHiTl+LZ8MFiSRUH+OJPxUCBCXTmYbVTtbwkz2Mz2/tDV5AmQqIHIsiyOKOwcPOo300o1aF2V2/0uucc0LgqRO//xuIHbRtw+xZeeMvi/JKB4CSe5tI0fNzhneIP+JB+pvzSbf+dcsSIlirg8/u5U8pYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167092; c=relaxed/simple;
	bh=mYQpXpjd6kZrME3gOjeK3nOc934+7JaIwRMeHNF5irA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hBs+VgrrIXI2qfiFulB9fWiboCM18ymVIGF7tc75+PeHaeAL6gC4uhNAEfTBAKwciKAzAL4t/QVXn0zkdZN84M8fYAb/ULBuw36mF1IAorrsBbACJGaFpWaYE8MdTA7eRighLa7rjy84r0Bft5s4CJkQX73RDDbHxEkmkGWfoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Yrv2x0TnMzrT3N;
	Mon, 10 Feb 2025 13:56:25 +0800 (CST)
Received: from dggemv704-chm.china.huawei.com (unknown [10.3.19.47])
	by mail.maildlp.com (Postfix) with ESMTPS id 5545818010B;
	Mon, 10 Feb 2025 13:58:00 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Feb 2025 13:58:00 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 10 Feb 2025 13:57:59 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <alexandre.belloni@bootlin.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v2 0/2] Use HWMON_CHANNEL_INFO macro to simplify code
Date: Mon, 10 Feb 2025 13:45:44 +0800
Message-ID: <20250210054546.10785-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn100009.china.huawei.com (7.202.194.112)

The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code
for rtc subsystem.

Note: These patches do not depend on each other. Put them togeter just for
belonging to the same subsystem.

---
 -v2:
  * detach these patches from the series[1]

[1] https://lore.kernel.org/lkml/20250124022635.16647-3-lihuisong@huawei.com/T/

Huisong Li (2):
  rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
  rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code

 drivers/rtc/rtc-ab-eoz9.c | 24 ++----------------------
 drivers/rtc/rtc-ds3232.c  | 24 ++----------------------
 2 files changed, 4 insertions(+), 44 deletions(-)

-- 
2.22.0


