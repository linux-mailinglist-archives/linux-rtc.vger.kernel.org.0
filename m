Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFE833D168
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Mar 2021 11:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234296AbhCPKJB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Mar 2021 06:09:01 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:56693 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236479AbhCPKIx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 16 Mar 2021 06:08:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4F08Bn6X0bz1qsjw;
        Tue, 16 Mar 2021 11:08:49 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4F08Bn5QFsz1qql0;
        Tue, 16 Mar 2021 11:08:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id GvUvLZOwWlqc; Tue, 16 Mar 2021 11:08:48 +0100 (CET)
X-Auth-Info: ek4xd34+s2zMDMLnUW4kGKckmm1ivZrBp4w+T/fwzZw=
Received: from localhost (dslb-084-056-254-233.084.056.pools.vodafone-ip.de [84.56.254.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 16 Mar 2021 11:08:48 +0100 (CET)
From:   Claudius Heine <ch@denx.de>
To:     johannes hahn <johannes-hahn@siemens.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Cc:     werner zeh <werner.zeh@siemens.com>,
        henning schild <henning.schild@siemens.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        martin mantel <martin.mantel@siemens.com>,
        val krutov <val.krutov@erd.epson.com>,
        Claudius Heine <ch@denx.de>
Subject: [PATCH v3 0/1] add ACPI binding to RX6110 driver
Date:   Tue, 16 Mar 2021 11:08:04 +0100
Message-Id: <20210316100805.2630481-1-ch@denx.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
References: <AM0PR10MB25801B7DCB6C1856B5D4F2C09FE10@AM0PR10MB2580.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

it took some time, but now we got the official ACPI id for the RX6110 RTC driver
from Seiko Epson.

regards,
Claudius

Johannes Hahn (1):
  rtc: rx6110: add ACPI bindings to I2C

 drivers/rtc/rtc-rx6110.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.30.1

