Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701CF2838E
	for <lists+linux-rtc@lfdr.de>; Thu, 23 May 2019 18:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731334AbfEWQ1u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 23 May 2019 12:27:50 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:35648 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730987AbfEWQ1u (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 23 May 2019 12:27:50 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 0E9623A2EF0;
        Thu, 23 May 2019 15:48:39 +0000 (UTC)
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3ED5E20000A;
        Thu, 23 May 2019 15:48:30 +0000 (UTC)
Date:   Thu, 23 May 2019 17:48:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Richard Leitner <richard.leitner@skidata.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rtc: s35390a: uie_unsupported and minor fixes
Message-ID: <20190523154829.GW3274@piout.net>
References: <20190523115451.20007-1-richard.leitner@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523115451.20007-1-richard.leitner@skidata.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/05/2019 13:54:47+0200, Richard Leitner wrote:
> As the s35390a does only support per-minute based alarms we have to
> set the uie_unsupported flag. Otherwise it delays for 10sec and 
> fails afterwards with modern hwclock versions.
> 
> Furthermore some other minor changes are made.
> 
> All patches were tested on an i.MX6 platform.
> 
> CHANGES v2:
>  - use BIT in "clarify INT2 pin output modes"
>  - add "change FLAG defines to use BIT macro"
> 
> Richard Leitner (4):
>   rtc: s35390a: clarify INT2 pin output modes
>   rtc: s35390a: set uie_unsupported
>   rtc: s35390a: introduce struct device in probe
>   rtc: s35390a: change FLAG defines to use BIT macro
> 
>  drivers/rtc/rtc-s35390a.c | 55 +++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 26 deletions(-)
> 

Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
