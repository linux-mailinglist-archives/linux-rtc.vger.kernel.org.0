Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B462448AD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Aug 2020 13:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgHNLHj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 14 Aug 2020 07:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgHNLHi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 14 Aug 2020 07:07:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30526C061387
        for <linux-rtc@vger.kernel.org>; Fri, 14 Aug 2020 04:07:37 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id FP7Y2300N4C55Sk06P7YYF; Fri, 14 Aug 2020 13:07:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0003r5-Bi; Fri, 14 Aug 2020 13:07:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k6XYa-0007Z0-9O; Fri, 14 Aug 2020 13:07:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        kogiidena <kogiidena@eggplant.ddo.jp>,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-rtc@vger.kernel.org, linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] rtc: rtc-rs5c313: Fix and cleanups
Date:   Fri, 14 Aug 2020 13:07:28 +0200
Message-Id: <20200814110731.29029-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

	Hi Ale{ss,x}andr[oe],

This patch series fixes the RS5C313 RTC driver, which is used on the I-O
DATA USL-5P aka Landisk:

    -rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
     rs5c313 rs5c313: registered as rtc0
    -rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
    -rs5c313 rs5c313: hctosys: unable to read the hardware clock
    +rs5c313 rs5c313: setting system clock to 2020-08-14T01:04:12 UTC (1597367052)

and performs a few related code cleanups.

Thanks for your comments!

Geert Uytterhoeven (3):
  rtc: rtc-rs5c313: Drop obsolete platform_set_drvdata() call
  rtc: rtc-rs5c313: Fix late hardware init
  rtc: rtc-rs5c313: Convert to module_platform_driver()

 drivers/rtc/rtc-rs5c313.c | 34 +++++++---------------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
