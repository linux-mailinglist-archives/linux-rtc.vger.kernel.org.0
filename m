Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B5EA9ADD
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Sep 2019 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731012AbfIEGqX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Sep 2019 02:46:23 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:35676 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726097AbfIEGqX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 5 Sep 2019 02:46:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 9F244DBF19FA7DA58829;
        Thu,  5 Sep 2019 14:46:21 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Sep 2019 14:46:10 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <tony@atomide.com>, <udeep.dutt@intel.com>,
        <ashutosh.dixit@intel.com>, <gregkh@linuxfoundation.org>,
        <kishon@ti.com>, <jonathanh@nvidia.com>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>
CC:     <zhongjiang@huawei.com>, <linux-kernel@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <arnd@arndb.de>,
        <lorenzo.pieralisi@arm.com>
Subject: [PATCH 0/4] Use PTR_ERR_OR_ZERO directly
Date:   Thu, 5 Sep 2019 14:43:11 +0800
Message-ID: <1567665795-5901-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

With the help of ptr_ret.cocci, I find some place to use
PTR_ERR_OR_ZERO directly.

zhong jiang (4):
  bus: ti-sysc: Use PTR_ERR_OR_ZERO rather than its implementation
  misc: mic: Use PTR_ERR_OR_ZERO rather than its implementation
  phy: tegra: Use PTR_ERR_OR_ZERO rather than its implementation
  rtc: ds1347: Use PTR_ERR_OR_ZERO rather than its implementation

 drivers/bus/ti-sysc.c                | 4 +---
 drivers/misc/mic/scif/scif_epd.h     | 5 ++---
 drivers/phy/tegra/phy-tegra194-p2u.c | 4 +---
 drivers/rtc/rtc-ds1347.c             | 5 +----
 4 files changed, 5 insertions(+), 13 deletions(-)

-- 
1.7.12.4

