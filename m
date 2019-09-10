Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB109AEF88
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2019 18:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436781AbfIJQ1y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Sep 2019 12:27:54 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:36567 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436494AbfIJQ1y (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Sep 2019 12:27:54 -0400
Received: from localhost (unknown [148.69.85.38])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A733620000D;
        Tue, 10 Sep 2019 16:27:51 +0000 (UTC)
Date:   Tue, 10 Sep 2019 18:27:48 +0200
From:   Alexandre Belloni <alexandre.belloni@free-electrons.com>
To:     David =?iso-8859-1?Q?M=FCller_=28ELSOFT_AG=29?= 
        <d.mueller@elsoft.ch>
Cc:     Stephen Boyd <sboyd@codeaurora.org>, linux-rtc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: rtc-pcf8563: circular locking dependency
Message-ID: <20190910162748.GA21254@piout.net>
References: <c8d6a60f-c574-9883-53ea-3b1c55275057@elsoft.ch>
 <20171206101906.GN21780@piout.net>
 <a4d1f4f1-37e9-dbc8-72bf-024c1e4e70df@elsoft.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4d1f4f1-37e9-dbc8-72bf-024c1e4e70df@elsoft.ch>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 22/12/2017 14:19:47+0100, David Müller (ELSOFT AG) wrote:
> Hi
> 
> Alexandre Belloni wrote:
> > Thanks for the report. This is actually a known issue (at least, I know
> > about it).
> > 
> > I'm adding the clock framework maintainers as this is actually an issue
> > that affects any device exposing clocks that are on a bus using clock
> > operations in its transfer operations. Here, an i2c RTC, exposing clocks
> > and connected on an imx6.
> > 
> > This has been solved by caching the registers for the m41t80 RTC, see:
> > 
> > http://patchwork.ozlabs.org/project/rtc-linux/list/?series=11636&state=*
> > 
> > But, I find that cumbersome and maybe something can be done in the clk
> > framework. I didn't check what the prepare_lock protects yet. But maybe
> > we can have another lock for get_rate and the like?
> > 
> > Stephen, Mike, any input?
> 
> Any update regarding this issue?
> 

I believe this issue has been solved by 90ad2cbe88c2 ("i2c: imx: use clk notifier for rate changes").

> 
> Dave

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
