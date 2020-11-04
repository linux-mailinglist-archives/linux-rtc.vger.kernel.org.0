Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7B32A618E
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Nov 2020 11:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgKDK2K (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Nov 2020 05:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbgKDK1F (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Nov 2020 05:27:05 -0500
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324CCC0613D3;
        Wed,  4 Nov 2020 02:27:05 -0800 (PST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4CR2rj5mCbz1rvm9;
        Wed,  4 Nov 2020 11:27:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4CR2rj3Nvpz1qql3;
        Wed,  4 Nov 2020 11:27:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id gRVeKdWkegUo; Wed,  4 Nov 2020 11:27:00 +0100 (CET)
X-Auth-Info: Lj8SqlRiGTBPCGQxCibwOes6WJ2XrS8TFi/lhKUSFz0=
Received: from localhost (dslb-088-074-220-167.088.074.pools.vodafone-ip.de [88.74.220.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed,  4 Nov 2020 11:27:00 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Henning Schild <henning.schild@siemens.com>,
        Johannes Hahn <johannes-hahn@siemens.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH 0/2]  Adding I2C support to RX6110 RTC
Date:   Wed,  4 Nov 2020 11:26:27 +0100
Message-Id: <20201104102629.3422048-1-ch@denx.de>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

this patch introduces I2C support to the RX6110 RTC driver and also adds
an ACPI identifier to it.

Since we are also pushing the coreboot changes for the ACPI table
upstream in parallel, we are free to name this ACPI entry however we
like it seems. So any feedback on that would be welcome ;)

kind regards,
Claudius

Claudius Heine (1):
  rtc: rx6110: add i2c support

Johannes Hahn (1):
  rtc: rx6110: add ACPI bindings to I2C

 drivers/rtc/Kconfig      |  20 ++---
 drivers/rtc/rtc-rx6110.c | 155 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 158 insertions(+), 17 deletions(-)

-- 
2.20.1

