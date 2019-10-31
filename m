Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2033EB918
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 22:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfJaVin (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 17:38:43 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:48410 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727580AbfJaVin (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 31 Oct 2019 17:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y9qK11MhdNCSgFUMKP4rI4sOIYBSqgShLdNJLpJ5cGE=; b=CvMZwjj2OCPQu4OQIeA9VkDQ1n
        mQEvea4ISaXFYrb6N9gT/y7ga9lxrXoOofv0bbDr0DgOsGXAUnvgH9qPQJdCjDVqFXeSo9hv5u9YT
        fFz/ma79Lto12I7r9p+AoyAxHYvFuYMNSEpQgWXLD8Ns+4D8Dqkplyet9/4HAnZCXQTI=;
Received: from p200300ccff0b24001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9O-0005l2-8B; Thu, 31 Oct 2019 22:38:38 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9N-000301-OY; Thu, 31 Oct 2019 22:38:37 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/5] Add rtc support for rn5t618 mfd
Date:   Thu, 31 Oct 2019 22:38:30 +0100
Message-Id: <20191031213835.11390-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes in v2:
- no dead code in irq code
- various improvements and cleanups in rtc driver itself

Andreas Kemnade (5):
  mfd: rn5t618: prepare for irq handling
  mfd: rn5t618: add irq support
  mfd: rn5t618: add rtc related registers
  mfd: rn5t618: add more subdevices
  rtc: rtc-rc5t619: add ricoh rc5t619 RTC driver

 drivers/mfd/Kconfig                       |   1 +
 drivers/mfd/Makefile                      |   2 +
 drivers/mfd/{rn5t618.c => rn5t618-core.c} |  49 ++-
 drivers/mfd/rn5t618-irq.c                 |  85 ++++
 drivers/rtc/Kconfig                       |  10 +
 drivers/rtc/Makefile                      |   1 +
 drivers/rtc/rtc-rc5t619.c                 | 488 ++++++++++++++++++++++
 include/linux/mfd/rn5t618.h               |  27 ++
 8 files changed, 661 insertions(+), 2 deletions(-)
 rename drivers/mfd/{rn5t618.c => rn5t618-core.c} (79%)
 create mode 100644 drivers/mfd/rn5t618-irq.c
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
2.20.1

