Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC68212DD2
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2020 22:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgGBUXi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 2 Jul 2020 16:23:38 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38753 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgGBUXi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 2 Jul 2020 16:23:38 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4F1D260005;
        Thu,  2 Jul 2020 20:23:35 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dev Null <devnull@uvos.xyz>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-omap@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Tony Lindgren <tony@atomide.com>, linux-rtc@vger.kernel.org,
        "Sicelo A . Mhlongo" <absicsz@gmail.com>
Subject: Re: [PATCH] rtc: cpcap: fix range
Date:   Thu,  2 Jul 2020 22:23:10 +0200
Message-Id: <159372105822.57284.8366488507603282804.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200629114123.27956-1-sebastian.reichel@collabora.com>
References: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz> <20200629114123.27956-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 29 Jun 2020 13:41:23 +0200, Sebastian Reichel wrote:
> Unbreak CPCAP driver, which has one more bit in the day counter
> increasing the max. range from 2014 to 2058. The original commit
> introducing the range limit was obviously wrong, since the driver
> has only been written in 2017 (3 years after 14 bits would have
> run out).

Applied, thanks!

What happen is that I can't count bits and so I though PCAP had 13 bits and
CPCAP 14 bits while it is indeed 14 and 15. I did the correct thing in the PCAP
driver though.

Thanks for the fix!

[1/1] rtc: cpcap: fix range
      commit: d6ac11f677ded28180fc9e59b01db79036c3ec31

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
