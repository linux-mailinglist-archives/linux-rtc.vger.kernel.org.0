Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02611DE3F1
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 07:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfJUFlX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 01:41:23 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:38844 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbfJUFlX (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 01:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QuDqXaB5yMdJbByEJxctBkera7YviQJ4W5OEqeucY5I=; b=g+viyxJEG913i16jhf40CEsNG1
        vtJMQtibGmrXC5Z3IUnVDBXzx6XpXpBcw0bf51pOb8p7tnwCAligJu8WLTZtVkaP49a01Bj8296Bm
        fJTmKGG+MjzbJkqp/z27yY+ZbqxrS0uR9dYMSyVWXCQfotyzEEY+3Br6gk6BXs7slboA=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRQ-0002go-Uu; Mon, 21 Oct 2019 07:41:17 +0200
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRP-0006oe-GK; Mon, 21 Oct 2019 07:41:15 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/5] Add rtc support for rn5t618 mfd
Date:   Mon, 21 Oct 2019 07:40:59 +0200
Message-Id: <20191021054104.26155-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the variant rc5t619 the mfd has a rtc. This patchset adds
support for it. To do so it adds the missing register defines in 
rn5t618.h and general irq handling for that.
Probably the irq definitions are the same except missing rtc + charger
but due to missing information about that I do not add them.
There might be some oddity about the charger irq which should be 
researched when adding the charger subdevice.

The rtc driver itself is based on 
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
but heavily reworked.

It was tested on the Kobo Clara HD.

Andreas Kemnade (5):
  mfd: rn5t618: prepare for irq handling
  mfd: rn5t618: add irq support
  mfd: rn5t618: add rtc related registers
  mfd: rn5t618: add more subdevices
  rtc: rtc-rc5t583: add ricoh rc5t619 RTC driver

 drivers/mfd/Kconfig                       |   1 +
 drivers/mfd/Makefile                      |   2 +
 drivers/mfd/{rn5t618.c => rn5t618-core.c} |  49 ++-
 drivers/mfd/rn5t618-irq.c                 |  92 ++++++
 drivers/rtc/Kconfig                       |  10 +
 drivers/rtc/Makefile                      |   1 +
 drivers/rtc/rtc-rc5t619.c                 | 476 ++++++++++++++++++++++++++++++
 include/linux/mfd/rn5t618.h               |  29 ++
 8 files changed, 658 insertions(+), 2 deletions(-)
 rename drivers/mfd/{rn5t618.c => rn5t618-core.c} (79%)
 create mode 100644 drivers/mfd/rn5t618-irq.c
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.11.0

