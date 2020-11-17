Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6392B5EFB
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 13:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgKQMSh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 07:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgKQMSg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 07:18:36 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65882C0613CF;
        Tue, 17 Nov 2020 04:18:36 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Cb4jP3HW9z1rxY6;
        Tue, 17 Nov 2020 13:18:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Cb4jP1q3Tz1qvgf;
        Tue, 17 Nov 2020 13:18:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id u3XrPKpAHP6C; Tue, 17 Nov 2020 13:18:32 +0100 (CET)
X-Auth-Info: oYQqwkth/zyd/eo2Jiby/5RnRCkMyClN4crdrNFuVpk=
Received: from localhost (dslb-084-056-254-185.084.056.pools.vodafone-ip.de [84.56.254.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 17 Nov 2020 13:18:32 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Werner Zeh <werner.zeh@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v3 0/2] Adding I2C support to RX6110 RTC
Date:   Tue, 17 Nov 2020 13:18:15 +0100
Message-Id: <20201117121817.953924-1-ch@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

based on the last feedback round we decided to remove the ACPI patch from this
patchset for now until we have the correct one. I have also moved the typo fix
to the front, so it can be applied independently.

best regards,
Claudius

Changes from v2:
- removed unused variables
- reordered patches for easy partial application
- removed ACPI patch, because we are investigating ACPI name change

Changes from v1:
- moved common probing code into its own function `rx6110_probe`
- added a small patch to fix a type in the Kconfig

Claudius Heine (2):
  rtc: Kconfig: Fix typo in help message of rx 6110
  rtc: rx6110: add i2c support

 drivers/rtc/Kconfig      |  20 ++---
 drivers/rtc/rtc-rx6110.c | 165 +++++++++++++++++++++++++++++++++------
 2 files changed, 153 insertions(+), 32 deletions(-)

-- 
2.20.1

