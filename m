Return-Path: <linux-rtc+bounces-3029-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5AAA1AE93
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 03:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65B493ACD5A
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jan 2025 02:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28B81D5CC4;
	Fri, 24 Jan 2025 02:38:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0AE28F5;
	Fri, 24 Jan 2025 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737686322; cv=none; b=uMl+t1EwBDTy+pIdkWWXA90bUy8bLnEBG5LXsn0G1vpnGoGsBJ6RPuz0Sei3prX0AeaHgJpu4misvDV6T0HJXblaUfl0nQLfpjuMUs3h+XVmEZWXWp/kq+Xm1TcB21b5WKaaqfqPln7SoSTde9Ya6NnGM98gfBQDE9uswrBIUiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737686322; c=relaxed/simple;
	bh=kGN30M+YSBMSyMPG9zmSOMmsR2GvpPzjcCFNmUX3blk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mapac4iTMUVW+0z/OXNE8q/ytfbCMeCOB4JU8NYg6faz9pw3nefInn5/zv5JNbDR2+6XgP02Tcv1c8HyWBzPzuFziSdgl9gKry/pPv09ykIyWoeX+wiod6n04ql0QM3/gejZCeowJEHwb6E72dtbXLn6Jd5THWjIvdr0thRXV+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YfMNg6p31z1l04J;
	Fri, 24 Jan 2025 10:35:15 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 1AE051A0188;
	Fri, 24 Jan 2025 10:38:37 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:36 +0800
Received: from localhost.localdomain (10.28.79.22) by
 kwepemn100009.china.huawei.com (7.202.194.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 24 Jan 2025 10:38:35 +0800
From: Huisong Li <lihuisong@huawei.com>
To: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>
CC: <oss-drivers@corigine.com>, <matt@ranostay.sg>, <mchehab@kernel.org>,
	<irusskikh@marvell.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<louis.peens@corigine.com>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
	<kabel@kernel.org>, <alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>,
	<liuyonglong@huawei.com>, <lihuisong@huawei.com>
Subject: [PATCH v1 0/9] Use HWMON_CHANNEL_INFO macro to simplify code
Date: Fri, 24 Jan 2025 10:26:26 +0800
Message-ID: <20250124022635.16647-1-lihuisong@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemn100009.china.huawei.com (7.202.194.112)

The HWMON_CHANNEL_INFO macro is provided by hwmon.h and used widely by many
other drivers. This series use HWMON_CHANNEL_INFO macro to simplify code.

Huisong Li (9):
  media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
  net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
  net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
  rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
  rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
  w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
  net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code

 drivers/media/i2c/video-i2c.c                 | 12 +-----
 .../ethernet/aquantia/atlantic/aq_drvinfo.c   | 14 +------
 .../net/ethernet/netronome/nfp/nfp_hwmon.c    | 40 +++----------------
 drivers/net/phy/aquantia/aquantia_hwmon.c     | 32 +++------------
 drivers/net/phy/marvell.c                     | 24 +----------
 drivers/net/phy/marvell10g.c                  | 24 +----------
 drivers/rtc/rtc-ab-eoz9.c                     | 24 +----------
 drivers/rtc/rtc-ds3232.c                      | 24 +----------
 drivers/w1/slaves/w1_therm.c                  | 12 +-----
 9 files changed, 23 insertions(+), 183 deletions(-)

-- 
2.22.0


