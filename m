Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A838433DDF
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Jun 2019 06:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbfFDEX6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jun 2019 00:23:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfFDEXr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:23:47 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C498D24CA4;
        Tue,  4 Jun 2019 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559622226;
        bh=gLtAailyS6IJm8z2V2PeInJ4Zh8RQw5AhexkL1edZlQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Cam4pLTngHKbpei8gF74EopX7nX49t8VOukQeGIYWDwfJxCUpn/HHzpXC/6yv3Lbi
         mD9+WZgi6RoCqqxVoYLpJTJxAwCO6UQqV89tXiAwC6xD/1tDPHs0ghtyCHW8ha9Kzn
         ENTn73F6Rk+QP+lOB42/QBxsDkFAKrCPa5JpXW2A=
Received: by wens.tw (Postfix, from userid 1000)
        id 6A0A35FCDF; Tue,  4 Jun 2019 12:23:43 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
Date:   Tue,  4 Jun 2019 12:23:34 +0800
Message-Id: <20190604042337.26129-1-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

While bringing up my Pine H64, I encountered an interrupt storm from the
pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
was not properly added to the device tree. Also, the driver was using an
trigger method incompatible with the PMIC, preventing the interrupt line
from being shared. Last, the driver only clears and masks the alarm
interrupt, while leaving the timer interrupt untouched. This is a
problem if previous systems left the timer interrupt enabled, and there
was an interrupt pending.

This patch set fixes all three issues, one per patch.

Please have a look.

Chen-Yu Tsai (3):
  rtc: pcf8563: Fix interrupt trigger method
  rtc: pcf8563: Clear event flags and disable interrupts before
    requesting irq
  arm64: dts: allwinner: h6: Pine H64: Add interrupt line for RTC

 .../arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts |  2 ++
 drivers/rtc/rtc-pcf8563.c                           | 13 ++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.20.1

