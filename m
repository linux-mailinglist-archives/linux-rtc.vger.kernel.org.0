Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6295957E1A
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2019 10:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfF0ITL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Jun 2019 04:19:11 -0400
Received: from gloria.sntech.de ([185.11.138.130]:60114 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbfF0ITL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 27 Jun 2019 04:19:11 -0400
Received: from wf0413.dip.tu-dresden.de ([141.76.181.157] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1hgPcN-0006oO-B4; Thu, 27 Jun 2019 10:18:55 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Tony Xie <tony.xie@rock-chips.com>, broonie@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, chenjh@rock-chips.com,
        xsf@rock-chips.com, zhangqing@rock-chips.com,
        huangtao@rock-chips.com
Subject: Re: [PATCH v10 0/6] support a new type of PMIC,including two chips(rk817 and rk809)
Date:   Thu, 27 Jun 2019 10:18:54 +0200
Message-ID: <2084806.DiqCa91xLP@phil>
In-Reply-To: <20190626115251.GR21119@dell>
References: <20190621103258.8154-1-tony.xie@rock-chips.com> <20190626115251.GR21119@dell>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Lee,

Am Mittwoch, 26. Juni 2019, 13:52:51 CEST schrieb Lee Jones:
> On Fri, 21 Jun 2019, Tony Xie wrote:
> 
> > Most of functions and registers of the rk817 and rk808 are the same,
> > so they can share allmost all codes.
> > 
> > Their specifications are as follows:
> >   1) The RK809 and RK809 consist of 5 DCDCs, 9 LDOs and have the same
> > registers
> >      for these components except dcdc5.
> >   2) The dcdc5 is a boost dcdc for RK817 and is a buck for RK809.
> >   3) The RK817 has one switch but The Rk809 has two.
> 
> Just tried to apply this set to a v5.2-rc1 base, but it doesn't seem
> to do so cleanly.  Would you be able to rebase and resend please?

I took the liberty of rebasing patch 3 accordingly and sent it as reply
to the original patch3 as (v10.1). The other patches did apply cleanly
after that.


Heiko


