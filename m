Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B06424C7A0
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Aug 2020 00:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgHTWOk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 20 Aug 2020 18:14:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:25633 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgHTWOi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 20 Aug 2020 18:14:38 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id AB6E4240003;
        Thu, 20 Aug 2020 22:14:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-rtc@vger.kernel.org,
        Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-sh@vger.kernel.org, kogiidena <kogiidena@eggplant.ddo.jp>
Subject: Re: [PATCH 0/3] rtc: rtc-rs5c313: Fix and cleanups
Date:   Fri, 21 Aug 2020 00:14:35 +0200
Message-Id: <159796165864.2239639.901039346229780391.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814110731.29029-1-geert+renesas@glider.be>
References: <20200814110731.29029-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 14 Aug 2020 13:07:28 +0200, Geert Uytterhoeven wrote:
> 	Hi Ale{ss,x}andr[oe],
> 
> This patch series fixes the RS5C313 RTC driver, which is used on the I-O
> DATA USL-5P aka Landisk:
> 
>     -rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
>      rs5c313 rs5c313: registered as rtc0
>     -rs5c313 rs5c313: rs5c313_rtc_read_time: timeout error
>     -rs5c313 rs5c313: hctosys: unable to read the hardware clock
>     +rs5c313 rs5c313: setting system clock to 2020-08-14T01:04:12 UTC (1597367052)
> 
> [...]

Applied, thanks!

[1/3] rtc: rtc-rs5c313: Drop obsolete platform_set_drvdata() call
      commit: fc9656a370499e5a32425b715f8fed241e832458
[2/3] rtc: rtc-rs5c313: Fix late hardware init
      commit: f65e727464d7c0090f05548e8f323779eaa97eda
[3/3] rtc: rtc-rs5c313: Convert to module_platform_driver()
      commit: 163a512cd929d6db712a3021720362749653998b

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
