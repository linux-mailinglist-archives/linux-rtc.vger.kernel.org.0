Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CF1276B4B
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Sep 2020 10:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgIXH77 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Sep 2020 03:59:59 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36419 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbgIXH77 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Sep 2020 03:59:59 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2AF8EC0002;
        Thu, 24 Sep 2020 07:59:56 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bastian Krause <bst@pengutronix.de>, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Marek Vasut <marex@denx.de>,
        Arnaud Ebalard <arno@natisbad.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/8] rtc: expand charge support, implement rx8130 charging
Date:   Thu, 24 Sep 2020 09:59:56 +0200
Message-Id: <160093416442.1678374.12122275731329184121.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917183246.19446-1-bst@pengutronix.de>
References: <20200917183246.19446-1-bst@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 17 Sep 2020 20:32:38 +0200, Bastian Krause wrote:
> In order to preserve previous RTC charging behavior while allowing to
> add new charging configurations this series adds the dt property
> aux-voltage-chargeable as a uint enum. It supersedes the
> trickle-diode-disable flag.
> 
> Then the ds1307 driver's charging infrastructure is generalized:
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: rtc: let aux-voltage-chargeable supersede trickle-diode-disable
      commit: 965fe1ceea05de735f63d1c1f90f0310fc830a8d
[2/8] dt-bindings: rtc: ds1307: let aux-voltage-chargeable supersede trickle-diode-disable
      commit: c53cee48670cc623a42e49319a261798d8608b0e
[3/8] dt-bindings: rtc: ds1307: add rx8130 aux-voltage-chargeable support
      commit: 40d58c9742286ef95ef8dc5885d4043224490c82
[4/8] rtc: ds1307: apply DS13XX_TRICKLE_CHARGER_MAGIC only conditionally
      commit: 462eb736db3db76899022e4e4db788a7b6efbe09
[5/8] rtc: ds1307: introduce requires_trickle_resistor per chip
      commit: 1b5b6af788ae59ee73e3f3230dbfa4f0e31d8d18
[6/8] rtc: ds1307: store previous charge default per chip
      commit: 95a74cbb21a2431dd2fd8918fa26113629b6e13e
[7/8] rtc: ds1307: consider aux-voltage-chargeable
      commit: 0874734e09af5cc05439dbe2c8ff704f14d679f5
[8/8] rtc: ds1307: enable rx8130's backup battery, make it chargeable optionally
      commit: 0026f1604c9ba1ae8108d4977da0366c283552bc

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
