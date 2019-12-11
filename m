Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41F5711BF80
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Dec 2019 22:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfLKVye (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 Dec 2019 16:54:34 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:36682 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbfLKVyd (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 11 Dec 2019 16:54:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6yDIvGoEIdyIxWF4uOpwl8SQIQb1Tz6fEiyEFR/vABg=; b=btsGbM8jl3/83x2vaz+Bu9vkPR
        oncI5rXnHyzJHeeQG4CCOneCvIO9dpFec6j6+bvJQGjUfznYKnEEK4O7LdAFeYerGMSWh4bFHK3YG
        YpypQ31UjiTHMg6pfxgOmaDhZgyx7y2XAAsOEFHWPZSoN+/J8WstATNPi04+nJ26OWb4=;
Received: from p5dcc331a.dip0.t-ipconnect.de ([93.204.51.26] helo=eeepc)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1if9w9-0002EV-Up; Wed, 11 Dec 2019 22:54:26 +0100
Received: from andi by eeepc with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1if9w5-00005W-CD; Wed, 11 Dec 2019 22:54:21 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, stefan@agner.ch, b.galvani@gmail.com,
        phh@phh.me, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v4 0/5] Add rtc support for rn5t618 mfd 
Date:   Wed, 11 Dec 2019 22:54:04 +0100
Message-Id: <20191211215409.32764-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In the variant RC5T619 the mfd has an RTC. This patchset adds
support for it. To do so it adds the missing register defines in 
rn5t618.h and general irq handling for that.
It seems that the irq definitions are the same except missing RTC
but due to missing ability to test that I do not add them here.

The rtc driver itself is based on 
https://github.com/kobolabs/Kobo-Reader/blob/master/hw/imx6sll-clara/kernel.tar.bz2
but heavily reworked.

It was tested on the Kobo Clara HD.

Changes in v4:
- use macros for IRQ definitions
- merge rn5t618-core.c and rn5t618-irq.c

Changes in v3:
- alignment cleanup
- output cleanup, remove useless toggling of alarm flag in rtc probe
- updated bindings description, so patch 1/5 becomes 2/6 and so on

Changes in v2:
- no dead code in irq code
- various improvements and cleanups in rtc driver itself

Andreas Kemnade (5):
  dt-bindings: mfd: rn5t618: Document optional property interrupts
  mfd: rn5t618: add IRQ support
  mfd: rn5t618: add RTC related registers
  mfd: rn5t618: add more subdevices
  rtc: rc5t619: add ricoh rc5t619 RTC driver

 Documentation/devicetree/bindings/mfd/rn5t618.txt |   4 +
 drivers/mfd/Kconfig                               |   1 +
 drivers/mfd/rn5t618.c                             | 106 +++++-
 drivers/rtc/Kconfig                               |  10 +
 drivers/rtc/Makefile                              |   1 +
 drivers/rtc/rtc-rc5t619.c                         | 444 ++++++++++++++++++++++
 include/linux/mfd/rn5t618.h                       |  26 ++
 7 files changed, 590 insertions(+), 2 deletions(-)
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.11.0

