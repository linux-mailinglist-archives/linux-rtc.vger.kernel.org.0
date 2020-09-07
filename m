Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A90E25FF49
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Sep 2020 18:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgIGQaJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Sep 2020 12:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729862AbgIGO2b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Sep 2020 10:28:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80A9C061573
        for <linux-rtc@vger.kernel.org>; Mon,  7 Sep 2020 07:27:45 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <bst@pengutronix.de>)
        id 1kFI7T-0003nx-U4; Mon, 07 Sep 2020 16:27:43 +0200
From:   Bastian Krause <bst@pengutronix.de>
To:     linux-rtc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
        Bastian Krause <bst@pengutronix.de>
Subject: [PATCH 0/8] rtc: expand charge support, implement rx8130 charging
Date:   Mon,  7 Sep 2020 16:27:19 +0200
Message-Id: <20200907142727.26472-1-bst@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

In order to preserve previous RTC charging behavior while allowing to
add new charging configurations this series adds the dt property
aux-voltage-chargeable as a uint enum. It supersedes the
trickle-diode-disable flag.

Then the ds1307 driver's charging infrastructure is generalized:

- support charging on 'aux-voltage-chargeable = <1>'
- keep the previous charge default per chip
- make trickle-resistor-ohms optional for charging
- apply DS13XX_TRICKLE_CHARGER_MAGIC only conditionally

This preparatory work allows to enable Epson's RX8130 backup
battery and make it chargeable when 'aux-voltage-chargeable = <1>' is
given.

I decided to create a new series for this as the patches of previous
efforts changed drastically:

- https://lore.kernel.org/linux-rtc/20190628002151.4925-1-marex@denx.de/
- https://lore.kernel.org/linux-rtc/20190905130336.10651-1-marex@denx.de/
- https://lore.kernel.org/linux-rtc/98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de/T/

Regards,
Bastian

Bastian Krause (8):
  dt-bindings: rtc: let aux-voltage-chargeable supersede
    trickle-diode-disable
  dt-bindings: rtc: ds1307: let aux-voltage-chargeable supersede
    trickle-diode-disable
  dt-bindings: rtc: ds1307: add rx8130 aux-voltage-chargeable support
  rtc: ds1307: apply DS13XX_TRICKLE_CHARGER_MAGIC only conditionally
  rtc: ds1307: introduce requires_trickle_resistor per chip
  rtc: ds1307: store previous charge default per chip
  rtc: ds1307: consider aux-voltage-chargeable
  rtc: ds1307: enable rx8130's backup battery, make it chargeable
    optionally

 .../devicetree/bindings/rtc/rtc-ds1307.txt    |  9 ++-
 .../devicetree/bindings/rtc/rtc.yaml          | 10 ++++
 drivers/rtc/rtc-ds1307.c                      | 58 +++++++++++++++++--
 3 files changed, 71 insertions(+), 6 deletions(-)

-- 
2.28.0

