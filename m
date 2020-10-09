Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77344289A0E
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Oct 2020 22:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390951AbgJIU5t (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Oct 2020 16:57:49 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49063 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389072AbgJIU5t (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Oct 2020 16:57:49 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id D28B460004;
        Fri,  9 Oct 2020 20:57:44 +0000 (UTC)
Date:   Fri, 9 Oct 2020 22:57:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     dinghao.liu@zju.edu.cn
Cc:     Chen-Yu Tsai <wens@csie.org>, Kangjie Lu <kjlu@umn.edu>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: Re: [PATCH] rtc: sun6i: Fix memleak in sun6i_rtc_clk_init
Message-ID: <20201009205744.GA849573@piout.net>
References: <20200823075815.23457-1-dinghao.liu@zju.edu.cn>
 <CAGb2v640zTha1tzjOo3L+=T=N3hDRG+8qf2xu+bD8BMUnkhORQ@mail.gmail.com>
 <6de4a430.8e03.17429fa786d.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6de4a430.8e03.17429fa786d.Coremail.dinghao.liu@zju.edu.cn>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/08/2020 16:55:14+0800, dinghao.liu@zju.edu.cn wrote:
> > On Sun, Aug 23, 2020 at 3:59 PM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
> > >
> > > When clk_hw_register_fixed_rate_with_accuracy() fails,
> > > clk_data should be freed. It's the same for the subsequent
> > > error paths.
> > 
> > I suppose you should also unregister the already registered clocks
> > in the latter two error paths?
> > 
> 
> Sounds reasonable. But I find that the existing kernel code takes different
> strategies for this case. of_sama5d4_sckc_setup() uses clk_hw_unregister() 
> after clk_hw_register_fixed_rate_with_accuracy(), while _of_fixed_clk_setup()
> uses clk_hw_unregister_fixed_rate(). But at91sam926x_pmc_setup() just does
> nothing in this case.

I guess you should use clk_hw_unregister_fixed_rate after
clk_hw_register_fixed_rate_with_accuracy. clk_hw_unregister will leak
the struct clk_fixed_rate. It doesn't matter too much for
of_sama5d4_sckc_setup and at91sam926x_pmc_setup because if th clock
can't be registered, the platform will not boot.

> 
> Also, tcon_ch1_setup() uses clk_unregister() after clk_register(), while
> clk_register_vco_pll() just does nothing. 
> 
> So I'm not sure if we should register here and which unregister function to 
> use. Would you please give me more specific advice about this problem?
> 
> Regards,
> Dinghao

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
