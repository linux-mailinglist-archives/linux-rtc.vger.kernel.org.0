Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FBF30DA03
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Feb 2021 13:44:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhBCMnp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Feb 2021 07:43:45 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:12409 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhBCMnK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 Feb 2021 07:43:10 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DW1Wh06gwzjHFL;
        Wed,  3 Feb 2021 20:41:20 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Feb 2021 20:42:17 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC:     Xiaofei Tan <tanxiaofei@huawei.com>, <linux-rtc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>
Subject: [PATCH 0/6] spin lock usage optimization for RTC drivers
Date:   Wed, 3 Feb 2021 20:39:35 +0800
Message-ID: <1612355981-6764-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Replace spin_lock_irqsave with spin_lock in hard IRQ of RTC drivers.
There is no function changes, but may speed up if interrupt happen
too often.

Xiaofei Tan (6):
  rtc: cmos: Replace spin_lock_irqsave with spin_lock in hard IRQ
  rtc: pm8xxx: Replace spin_lock_irqsave with spin_lock in hard IRQ
  rtc: r7301: Replace spin_lock_irqsave with spin_lock in hard IRQ
  rtc: tegra: Replace spin_lock_irqsave with spin_lock in hard IRQ
  rtc: mxc: Replace spin_lock_irqsave with spin_lock in hard IRQ
  rtc: mxc_v2: Replace spin_lock_irqsave with spin_lock in hard IRQ

 drivers/rtc/rtc-cmos.c   | 5 ++---
 drivers/rtc/rtc-mxc.c    | 5 ++---
 drivers/rtc/rtc-mxc_v2.c | 7 +++----
 drivers/rtc/rtc-pm8xxx.c | 9 ++++-----
 drivers/rtc/rtc-r7301.c  | 5 ++---
 drivers/rtc/rtc-tegra.c  | 6 +++---
 6 files changed, 16 insertions(+), 21 deletions(-)

-- 
2.8.1

