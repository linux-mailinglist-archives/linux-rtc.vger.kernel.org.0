Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02C4139832C
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Jun 2021 09:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhFBHkt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 2 Jun 2021 03:40:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:6133 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231823AbhFBHko (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 2 Jun 2021 03:40:44 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fw16N2VMJzYmZS;
        Wed,  2 Jun 2021 15:35:56 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:40 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 15:38:40 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Joshua Kinard <kumba@gentoo.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc <linux-rtc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 0/8] rtc: use DEVICE_ATTR_* macro to simplify code
Date:   Wed, 2 Jun 2021 15:38:12 +0800
Message-ID: <20210602073820.11011-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DEVICE_ATTR_RO marks ReadOnly file, DEVICE_ATTR_RW marks ReadWrite file,
it's clearer than DEVICE_ATTR.

Zhen Lei (8):
  rtc: x1205: use DEVICE_ATTR_RO macro
  rtc: rx8025: use DEVICE_ATTR_RW macro
  rtc: rs5c372: use DEVICE_ATTR_RO macro
  rtc: isl1208: use DEVICE_ATTR_* macro
  rtc: ds1685: use DEVICE_ATTR_RO macro
  rtc: ds1343: use DEVICE_ATTR_* macro
  rtc: bq32k: use DEVICE_ATTR_RW macro
  rtc: ab8500: use DEVICE_ATTR_RW macro

 drivers/rtc/rtc-ab8500.c  | 14 ++++++--------
 drivers/rtc/rtc-bq32k.c   | 16 +++++++---------
 drivers/rtc/rtc-ds1343.c  | 19 +++++++++----------
 drivers/rtc/rtc-ds1685.c  | 27 ++++++++++++---------------
 drivers/rtc/rtc-isl1208.c | 29 ++++++++++++-----------------
 drivers/rtc/rtc-rs5c372.c | 12 ++++++------
 drivers/rtc/rtc-rx8025.c  | 16 +++++++---------
 drivers/rtc/rtc-x1205.c   | 12 ++++++------
 8 files changed, 65 insertions(+), 80 deletions(-)

-- 
2.26.0.106.g9fadedd


