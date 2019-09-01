Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64052A487B
	for <lists+linux-rtc@lfdr.de>; Sun,  1 Sep 2019 11:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfIAJCb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 1 Sep 2019 05:02:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:51707 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbfIAJCb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 1 Sep 2019 05:02:31 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84556C0005;
        Sun,  1 Sep 2019 09:02:28 +0000 (UTC)
Date:   Sun, 1 Sep 2019 11:02:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alejandro =?iso-8859-1?Q?Gonz=E1lez?= 
        <alejandro.gonzalez.correo@gmail.com>
Cc:     a.zummo@towertech.it, maxime.ripard@bootlin.com, wens@csie.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [RESEND PATCH 1/1] rtc: sun6i: Allow using as wakeup source from
 suspend
Message-ID: <20190901090228.GW21922@piout.net>
References: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190821210056.11995-1-alejandro.gonzalez.correo@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/08/2019 23:00:56+0200, Alejandro González wrote:
> This patch allows userspace to set up wakeup alarms on any RTC handled by the
> sun6i driver, and adds the necessary PM operations to allow resuming from
> suspend when the configured wakeup alarm fires a IRQ. Of course, that the
> device actually resumes depends on the suspend state and how a particular
> hardware reacts to it, but that is out of scope for this patch.
> 
> I've tested these changes on a Pine H64 model B, which contains a
> Allwinner H6 SoC, with the help of CONFIG_PM_TEST_SUSPEND kernel option.
> These are the interesting outputs from the kernel and commands which
> show that it works. As every RTC handled by this driver is largely the
> same, I think that it shouldn't introduce any regression on other SoCs,
> but I may be wrong.
> 
> [    1.092705] PM: test RTC wakeup from 'freeze' suspend
> [    1.098230] PM: suspend entry (s2idle)
> [    1.212907] PM: suspend devices took 0.080 seconds
> (The SoC freezes for some seconds)
> [    3.197604] PM: resume devices took 0.104 seconds
> [    3.215937] PM: suspend exit
> 
> [    1.092812] PM: test RTC wakeup from 'mem' suspend
> [    1.098089] PM: suspend entry (deep)
> [    1.102033] PM: suspend exit
> [    1.105205] PM: suspend test failed, error -22
> 
> In any case, the RTC alarm interrupt gets fired as exptected:
> 
> $ echo +5 > /sys/class/rtc/rtc0/wakealarm && sleep 5 && grep rtc /proc/interrupts
>  29:          1          0          0          0     GICv2 133 Level     7000000.rtc
> 
> Signed-off-by: Alejandro González <alejandro.gonzalez.correo@gmail.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
