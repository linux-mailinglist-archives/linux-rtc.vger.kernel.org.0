Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7A2221F8E
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jul 2020 11:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgGPJRK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jul 2020 05:17:10 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:53205 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgGPJRJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 16 Jul 2020 05:17:09 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4F0CB1BF227;
        Thu, 16 Jul 2020 09:16:34 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Huacai Chen <chenhc@lemote.com>,
        Miodrag Dinic <miodrag.dinic@mips.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Huacai Chen <chenhuacai@gmail.com>, linux-rtc@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Fuxin Zhang <zhangfx@lemote.com>
Subject: Re: [PATCH] rtc: goldfish: Enable interrupt in set_alarm() when necessary
Date:   Thu, 16 Jul 2020 11:16:32 +0200
Message-Id: <159489095984.8950.1847922720738517417.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
References: <1592654683-31314-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 20 Jun 2020 20:04:43 +0800, Huacai Chen wrote:
> When use goldfish rtc, the "hwclock" command fails with "select() to
> /dev/rtc to wait for clock tick timed out". This is because "hwclock"
> need the set_alarm() hook to enable interrupt when alrm->enabled is
> true. This operation is missing in goldfish rtc (but other rtc drivers,
> such as cmos rtc, enable interrupt here), so add it.

Applied, thanks!

[1/1] rtc: goldfish: Enable interrupt in set_alarm() when necessary
      commit: 22f8d5a1bf230cf8567a4121fc3789babb46336d

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
